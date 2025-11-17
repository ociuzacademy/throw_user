import 'package:flutter/material.dart';

class WelcomeSection extends StatelessWidget {
  final bool isSmallScreen;
  final Color textPrimaryColor;
  final Color textSecondaryColor;

  const WelcomeSection({
    super.key,
    required this.isSmallScreen,
    required this.textPrimaryColor,
    required this.textSecondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Welcome to Throw',
          style: TextStyle(
            fontSize: isSmallScreen ? 24 : 28,
            fontWeight: FontWeight.bold,
            color: textPrimaryColor,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: isSmallScreen ? 6 : 8),
        Text(
          'Sign in or create an account to get started',
          style: TextStyle(
            fontSize: isSmallScreen ? 14 : 16,
            color: textSecondaryColor,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
