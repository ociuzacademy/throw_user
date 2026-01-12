import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_user/core/constants/app_colors.dart';
import 'package:throw_user/core/exports/bloc_exports.dart';
import 'package:throw_user/core/repository/delivery_request_repository.dart';
import 'package:throw_user/core/repository/feedback_repository.dart';
import 'package:throw_user/core/service/auth_service.dart';
import 'package:throw_user/core/storage/app_storage_functions.dart';
import 'package:throw_user/core/storage/auth_storage_functions.dart';
import 'package:throw_user/core/repository/user_repository.dart';
import 'package:throw_user/modules/splash_screen_module/view/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();
    final AuthStorageFunctions authStorageFunctions = AuthStorageFunctions();
    final UserRepository userRepository = UserRepository();
    final DeliveryRequestRepository deliveryRequestRepository =
        DeliveryRequestRepository();
    final FeedbackRepository feedbackRepository = FeedbackRepository();
    // Initialize auth service
    WidgetsBinding.instance.addPostFrameCallback((_) {
      authService.initialize();
    });

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: authService),
        RepositoryProvider.value(value: userRepository),
        RepositoryProvider.value(value: deliveryRequestRepository),
        RepositoryProvider.value(value: feedbackRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              authService: authService,
              authStorageFunctions: authStorageFunctions,
              userRepository: userRepository,
            ),
          ),
          BlocProvider(create: (context) => UserProfileCubit()),
          BlocProvider(
            create: (context) => DeliveryRequestBloc(
              deliveryRequestRepository: deliveryRequestRepository,
            ),
          ),
          BlocProvider(
            create: (context) => UserDeliveryRequestsCubit(
              deliveryRequestRepository: deliveryRequestRepository,
            ),
          ),
          BlocProvider(
            create: (context) => DeliveryRequestDetailsCubit(
              deliveryRequestRepository: deliveryRequestRepository,
            ),
          ),
          BlocProvider(create: (context) => SendOtpBloc()),
          BlocProvider(
            create: (context) =>
                FeedbackBloc(feedbackRepository: feedbackRepository),
          ),
        ],
        child: MaterialApp(
          title: 'Throw',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: AppColors.primary,
            cardColor: Colors.white,
            scaffoldBackgroundColor: AppColors.backgroundLight,
            textTheme: GoogleFonts.plusJakartaSansTextTheme().copyWith(
              titleLarge: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              bodyLarge: GoogleFonts.plusJakartaSans(color: Colors.black87),
              bodyMedium: GoogleFonts.plusJakartaSans(color: Colors.grey[700]),
              bodySmall: GoogleFonts.plusJakartaSans(color: Colors.grey[600]),
            ),
            appBarTheme: AppBarTheme(
              backgroundColor: AppColors.backgroundLight.withValues(alpha: 0.8),
              elevation: 0,
              titleTextStyle: GoogleFonts.plusJakartaSans(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          darkTheme: ThemeData(
            primaryColor: AppColors.primary,
            cardColor: AppColors.cardDark,
            scaffoldBackgroundColor: AppColors.backgroundDark,
            textTheme: GoogleFonts.plusJakartaSansTextTheme().copyWith(
              titleLarge: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              bodyLarge: GoogleFonts.plusJakartaSans(color: Colors.white),
              bodyMedium: GoogleFonts.plusJakartaSans(color: Colors.grey[300]),
              bodySmall: GoogleFonts.plusJakartaSans(color: Colors.grey[400]),
            ),
            appBarTheme: AppBarTheme(
              backgroundColor: AppColors.backgroundDark.withValues(alpha: 0.8),
              elevation: 0,
              titleTextStyle: GoogleFonts.plusJakartaSans(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          home: const SplashScreenWrapper(),
        ),
      ),
    );
  }
}

class SplashScreenWrapper extends StatefulWidget {
  const SplashScreenWrapper({super.key});

  @override
  State<SplashScreenWrapper> createState() => _SplashScreenWrapperState();
}

class _SplashScreenWrapperState extends State<SplashScreenWrapper> {
  @override
  void initState() {
    super.initState();
    // Dispatch check auth status event when the app starts
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthBloc>().add(const CheckAuthStatus());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        final isLoggedIn = authState is Authenticated;

        // Show loading state while checking auth
        if (authState is Initial || authState is Loading) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        // Check if it's the first launch
        return FutureBuilder<bool>(
          future: AppStorageFunctions.getIntroScreenStatus(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Scaffold(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                body: const Center(child: CircularProgressIndicator()),
              );
            }

            final isFirstLaunch = snapshot.data ?? true;

            return SplashScreen(
              isFirstLaunch: isFirstLaunch,
              isLoggedIn: isLoggedIn,
            );
          },
        );
      },
    );
  }
}
