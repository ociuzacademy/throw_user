import 'package:flutter/material.dart';
import 'package:throw_user/core/constants/app_colors.dart';

class TimeUnit extends StatelessWidget {
  const TimeUnit({
    super.key,
    required this.number,
    required this.label,
    required this.isSmallScreen,
    required this.isLargeScreen,
    required this.isDark, // Add this parameter
  });

  final String number;
  final String label;
  final bool isSmallScreen;
  final bool isLargeScreen;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final numberFontSize = isSmallScreen
        ? 20.0
        : isLargeScreen
        ? 32.0
        : 24.0;
    final labelFontSize = isSmallScreen ? 10.0 : 12.0;
    final horizontalPadding = isSmallScreen ? 4.0 : 8.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        children: [
          Text(
            number,
            style: textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: numberFontSize,
              color: AppColors.getTextPrimaryColor(
                isDark,
              ), // Fixed number color
            ),
          ),
          Text(
            label,
            style: textTheme.labelSmall?.copyWith(
              color: AppColors.getTextSecondaryColor(
                isDark,
              ), // Fixed label color
              fontSize: labelFontSize,
            ),
          ),
        ],
      ),
    );
  }
}
