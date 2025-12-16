import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:throw_user/core/models/auth_response.dart';
import 'package:throw_user/core/service/auth_service.dart';
import 'package:throw_user/core/storage/auth_storage_functions.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;
  final AuthStorageFunctions _authStorageFunctions;

  AuthBloc({
    required AuthService authService,
    required AuthStorageFunctions authStorageFunctions,
  }) : _authService = authService,
       _authStorageFunctions = authStorageFunctions,
       super(const AuthState.initial()) {
    on<CheckAuthStatus>(_checkAuthStatus);
    on<SignInWithGoogle>(_signInWithGoogle);
    on<TrySilentSignIn>(_trySilentSignIn);
    on<SignOut>(_signOut);
    on<ResetError>(_resetError);
  }

  Future<void> _checkAuthStatus(
    CheckAuthStatus event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthState.loading());

      final isSignedIn = await _authService.isSignedIn();

      if (isSignedIn) {
        final user = await _authService.getCurrentUser();
        if (user != null) {
          emit(AuthState.authenticated(user: user));
        } else {
          emit(const AuthState.unauthenticated());
        }
      } else {
        // Try silent sign-in if not signed in
        add(const AuthEvent.trySilentSignIn());
      }
    } catch (e) {
      emit(
        AuthState.error(
          message: 'Failed to check auth status',
          details: e.toString(),
        ),
      );
    }
  }

  Future<void> _signInWithGoogle(
    SignInWithGoogle event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthState.loading());

      final response = await _authService.signInWithGoogle();

      response.when(
        success: (user, token) async {
          // Save user to storage
          final authResponse = AuthResponse.success(user: user, token: token);
          await _authStorageFunctions.saveUser(authResponse);
          emit(AuthState.authenticated(user: user));
        },
        error: (code, message, details) {
          emit(AuthState.error(message: message, details: details, code: code));
        },
        cancelled: () {
          emit(const AuthState.unauthenticated());
        },
      );
    } catch (e) {
      emit(
        AuthState.error(
          message: 'An unexpected error occurred',
          details: e.toString(),
        ),
      );
    }
  }

  Future<void> _trySilentSignIn(
    TrySilentSignIn event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthState.loading());

      final response = await _authService.trySilentSignIn();

      response.when(
        success: (user, token) async {
          // Save user to storage
          final authResponse = AuthResponse.success(user: user, token: token);
          await _authStorageFunctions.saveUser(authResponse);
          emit(AuthState.authenticated(user: user));
        },
        error: (code, message, details) {
          // Silent sign-in failed, just stay in unauthenticated state
          emit(const AuthState.unauthenticated());
        },
        cancelled: () {
          emit(const AuthState.unauthenticated());
        },
      );
    } catch (e) {
      // Silent sign-in failed, just stay in unauthenticated state
      emit(const AuthState.unauthenticated());
    }
  }

  Future<void> _signOut(SignOut event, Emitter<AuthState> emit) async {
    try {
      emit(const AuthState.loading());
      await _authService.signOut();
      // Clear user from storage
      await _authStorageFunctions.clear();
      emit(const AuthState.unauthenticated());
    } catch (e) {
      emit(
        AuthState.error(message: 'Failed to sign out', details: e.toString()),
      );
      // Even if error, user is effectively logged out locally
      await _authStorageFunctions.clear(); // Still clear storage
      emit(const AuthState.unauthenticated());
    }
  }

  Future<void> _resetError(ResetError event, Emitter<AuthState> emit) async {
    // If currently authenticated, stay authenticated
    if (state is Authenticated) {
      final authenticatedState = state as Authenticated;
      emit(AuthState.authenticated(user: authenticatedState.user));
    } else {
      emit(const AuthState.unauthenticated());
    }
  }
}
