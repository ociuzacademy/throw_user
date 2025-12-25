import 'package:flutter/material.dart';
import 'package:throw_user/core/constants/app_colors.dart';
import 'package:throw_user/modules/home_module/view/home_page.dart';
import 'package:throw_user/modules/login_module/view/login_page.dart';
import 'dart:async';

import 'package:throw_user/modules/onboarding_module/view/onboarding_page.dart';
import 'package:throw_user/modules/splash_screen_module/utils/splash_screen_helper.dart';

class SplashScreen extends StatefulWidget {
  final bool isFirstLaunch;
  final bool isLoggedIn;
  const SplashScreen({
    super.key,
    required this.isFirstLaunch,
    required this.isLoggedIn,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _bounceController;
  late Animation<double> _bounceAnimation;
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;
  late Timer _navigationTimer;

  @override
  void initState() {
    super.initState();

    // Setup bounce animation for logo
    _bounceController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _bounceAnimation = Tween<double>(begin: -0.05, end: 0.0).animate(
      CurvedAnimation(parent: _bounceController, curve: Curves.easeInOut),
    );

    // Setup pulse animation for progress bar
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    // Set up timer to navigate after 3 seconds
    _navigationTimer = Timer(const Duration(seconds: 3), _navigateToNextPage);
  }

  void _navigateToNextPage() {
    if (widget.isFirstLaunch) {
      Navigator.of(context).pushReplacement(OnboardingPage.route());
    } else {
      if (widget.isLoggedIn) {
        Navigator.of(context).pushReplacement(HomePage.route());
      } else {
        Navigator.of(context).pushReplacement(LoginPage.route());
      }
    }
  }

  @override
  void dispose() {
    _bounceController.dispose();
    _pulseController.dispose();
    _navigationTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Responsive calculations
    final logoSize = SplashScreenHelper.getLogoSize(screenSize.width);
    final appNameFontSize = SplashScreenHelper.getAppNameFontSize(
      screenSize.width,
    );
    final taglineFontSize = SplashScreenHelper.getTaglineFontSize(
      screenSize.width,
    );
    final padding = SplashScreenHelper.getPadding(screenSize.width);
    final spacing = SplashScreenHelper.getSpacing(screenSize.width);

    // Color definitions
    const primaryColor = AppColors.primary;
    const backgroundLight = AppColors.backgroundLight;
    const backgroundDark = AppColors.backgroundDark;

    return Scaffold(
      backgroundColor: isDark ? backgroundDark : backgroundLight,
      body: Column(
        children: [
          // Main content
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Animated logo with bounce
                  AnimatedBuilder(
                    animation: _bounceAnimation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(
                          0,
                          _bounceAnimation.value *
                              SplashScreenHelper.getBounceDistance(
                                screenSize.height,
                              ),
                        ),
                        child: child,
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(padding),
                      child: CustomPaint(
                        size: Size(logoSize, logoSize),
                        painter: _StarPainter(),
                      ),
                    ),
                  ),
                  SizedBox(height: spacing * 0.5),
                  // App name
                  Text(
                    'Throw',
                    style: TextStyle(
                      fontSize: appNameFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppColors.getTextPrimaryColor(isDark),
                    ),
                  ),
                  SizedBox(height: spacing * 0.5),
                  // Tagline
                  Text(
                    'Your package, delivered with care.',
                    style: TextStyle(
                      fontSize: taglineFontSize,
                      color: AppColors.getTextSecondaryColor(isDark),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          // Progress bar at the bottom
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(padding * 2),
            child: Container(
              width: double.infinity,
              height: SplashScreenHelper.getProgressBarHeight(screenSize.width),
              decoration: BoxDecoration(
                color: primaryColor.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(9999),
              ),
              child: Stack(
                children: [
                  // Pulsing progress bar
                  AnimatedBuilder(
                    animation: _pulseAnimation,
                    builder: (context, child) {
                      return Container(
                        width: double.infinity,
                        height: SplashScreenHelper.getProgressBarHeight(
                          screenSize.width,
                        ),
                        decoration: BoxDecoration(
                          color: primaryColor.withValues(
                            alpha: _pulseAnimation.value,
                          ),
                          borderRadius: BorderRadius.circular(9999),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.fill;

    // Scale the path to fit the provided size
    final scale = size.width / 24;
    final path = Path()
      ..moveTo(21.258 * scale, 8.243 * scale)
      ..cubicTo(
        21.258 * scale,
        7.207 * scale,
        20.251 * scale,
        6.207 * scale,
        19.798 * scale,
        6.207 * scale,
      )
      ..lineTo(14.336 * scale, 5.843 * scale)
      ..lineTo(12.136 * scale, 0.823 * scale)
      ..cubicTo(
        11.431 * scale,
        -0.274 * scale,
        9.569 * scale,
        -0.274 * scale,
        8.864 * scale,
        0.823 * scale,
      )
      ..lineTo(6.664 * scale, 5.843 * scale)
      ..lineTo(1.202 * scale, 6.207 * scale)
      ..cubicTo(
        0.24 * scale,
        6.207 * scale,
        -0.162 * scale,
        7.207 * scale,
        0.542 * scale,
        7.841 * scale,
      )
      ..lineTo(4.622 * scale, 11.561 * scale)
      ..lineTo(3.468 * scale, 16.958 * scale)
      ..cubicTo(
        3.241 * scale,
        17.994 * scale,
        4.222 * scale,
        18.794 * scale,
        5.229 * scale,
        18.42 * scale,
      )
      ..lineTo(9.989 * scale, 15.704 * scale)
      ..lineTo(14.749 * scale, 18.42 * scale)
      ..cubicTo(
        15.756 * scale,
        18.794 * scale,
        16.737 * scale,
        17.994 * scale,
        16.51 * scale,
        16.958 * scale,
      )
      ..lineTo(15.356 * scale, 11.561 * scale)
      ..lineTo(19.436 * scale, 7.841 * scale)
      ..cubicTo(
        20.14 * scale,
        7.207 * scale,
        20.251 * scale,
        7.207 * scale,
        21.258 * scale,
        8.243 * scale,
      )
      ..close()
      ..moveTo(12.768 * scale, 13.209 * scale)
      ..cubicTo(
        12.357 * scale,
        13.209 * scale,
        11.946 * scale,
        13.339 * scale,
        11.641 * scale,
        13.373 * scale,
      )
      ..lineTo(7.9 * scale, 15.228 * scale)
      ..lineTo(8.664 * scale, 11.663 * scale)
      ..cubicTo(
        8.664 * scale,
        11.163 * scale,
        8.453 * scale,
        10.693 * scale,
        8.042 * scale,
        10.223 * scale,
      )
      ..lineTo(5.349 * scale, 7.768 * scale)
      ..lineTo(8.955 * scale, 7.528 * scale)
      ..cubicTo(
        9.366 * scale,
        7.528 * scale,
        9.777 * scale,
        7.398 * scale,
        10.082 * scale,
        7.134 * scale,
      )
      ..lineTo(11.532 * scale, 3.826 * scale)
      ..lineTo(12.982 * scale, 7.134 * scale)
      ..cubicTo(
        13.287 * scale,
        7.398 * scale,
        13.698 * scale,
        7.528 * scale,
        14.109 * scale,
        7.528 * scale,
      )
      ..lineTo(17.715 * scale, 7.768 * scale)
      ..lineTo(15.022 * scale, 10.223 * scale)
      ..cubicTo(
        14.611 * scale,
        10.693 * scale,
        14.4 * scale,
        11.163 * scale,
        14.4 * scale,
        11.663 * scale,
      )
      ..lineTo(15.164 * scale, 15.228 * scale)
      ..lineTo(11.423 * scale, 13.373 * scale)
      ..cubicTo(
        11.118 * scale,
        13.339 * scale,
        11.013 * scale,
        13.209 * scale,
        12.768 * scale,
        13.209 * scale,
      )
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
