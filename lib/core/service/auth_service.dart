import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:throw_user/core/models/auth_response.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  // Initialize Google Sign-In
  Future<void> initialize() async {
    // Initialize GoogleSignIn with configuration
    await _googleSignIn.initialize(
      clientId: Platform.isIOS
          ? '108928876199-oi5o4hmum4g86f99p76mrhsfiuhims1q.apps.googleusercontent.com'
          : null,
      serverClientId: Platform.isAndroid
          ? '108928876199-ujvgpv4d5upmk2kqcucp3e1aeg0kdf83.apps.googleusercontent.com' // Web Client ID
          : null,
    );
  }

  // Check if user is already signed in
  Future<bool> isSignedIn() async {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }

  // Get current user profile
  Future<UserProfile?> getCurrentUser() async {
    final user = _firebaseAuth.currentUser;
    if (user == null) return null;

    return UserProfile(
      uid: user.uid,
      email: user.email ?? '',
      displayName: user.displayName ?? 'User',
      photoUrl: user.photoURL,
      phoneNumber: user.phoneNumber,
      emailVerified: user.emailVerified,
      createdAt: user.metadata.creationTime ?? DateTime.now(),
    );
  }

  // Google Sign In
  Future<AuthResponse> signInWithGoogle() async {
    try {
      // Check if platform supports authenticate
      if (!_googleSignIn.supportsAuthenticate()) {
        return const AuthResponse.error(
          code: 'platform-not-supported',
          message: 'Google Sign-In is not supported on this platform',
        );
      }

      // Start authentication flow
      final googleSignInAccount = await _googleSignIn.authenticate();

      // Get authentication details
      final authentication = googleSignInAccount.authentication;

      // Create a Firebase credential
      final credential = GoogleAuthProvider.credential(
        idToken: authentication.idToken,
      );

      // Sign in to Firebase with the credential
      final UserCredential userCredential = await _firebaseAuth
          .signInWithCredential(credential);
      final user = userCredential.user;

      if (user == null) {
        return const AuthResponse.error(
          code: 'no-user',
          message: 'No user returned from Firebase',
        );
      }

      // Get ID token
      final token = await user.getIdToken();

      // Create user profile
      final userProfile = UserProfile(
        uid: user.uid,
        email: user.email ?? '',
        displayName: user.displayName ?? 'User',
        photoUrl: user.photoURL,
        phoneNumber: user.phoneNumber,
        emailVerified: user.emailVerified,
        createdAt: user.metadata.creationTime ?? DateTime.now(),
      );

      return AuthResponse.success(user: userProfile, token: token!);
    } on FirebaseAuthException catch (e) {
      return AuthResponse.error(
        code: e.code,
        message: e.message ?? 'Firebase authentication failed',
        details: e.toString(),
      );
    } catch (e) {
      return AuthResponse.error(
        code: 'unknown',
        message: 'An unexpected error occurred',
        details: e.toString(),
      );
    }
  }

  // Try silent sign-in
  Future<AuthResponse> trySilentSignIn() async {
    try {
      // Try lightweight authentication (silent sign-in)
      final result = await _googleSignIn.attemptLightweightAuthentication();

      if (result != null) {
        // Get authentication details
        final authentication = result.authentication;

        // Create a Firebase credential
        final credential = GoogleAuthProvider.credential(
          idToken: authentication.idToken,
        );

        // Sign in to Firebase with the credential
        final UserCredential userCredential = await _firebaseAuth
            .signInWithCredential(credential);
        final user = userCredential.user;

        if (user != null) {
          final token = await user.getIdToken();
          final userProfile = UserProfile(
            uid: user.uid,
            email: user.email ?? '',
            displayName: user.displayName ?? 'User',
            photoUrl: user.photoURL,
            phoneNumber: user.phoneNumber,
            emailVerified: user.emailVerified,
            createdAt: user.metadata.creationTime ?? DateTime.now(),
          );
          return AuthResponse.success(user: userProfile, token: token!);
        }
      }

      return const AuthResponse.error(
        code: 'not-signed-in',
        message: 'Not signed in',
      );
    } catch (e) {
      return const AuthResponse.error(
        code: 'silent-sign-in-failed',
        message: 'Silent sign-in failed',
      );
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _googleSignIn.disconnect();
      await _firebaseAuth.signOut();
    } catch (e) {
      // Ignore error
    }
  }

  // Clean up
  void dispose() {
    // Nothing to dispose in newer versions
  }
}
