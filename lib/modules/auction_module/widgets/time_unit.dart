import 'package:flutter/material.dart';

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
    final colorScheme = Theme.of(context).colorScheme;
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
              color: isDark ? Colors.white : Colors.black, // Fixed number color
            ),
          ),
          Text(
            label,
            style: textTheme.labelSmall?.copyWith(
              color: isDark
                  ? colorScheme.onSurface.withValues(alpha: 0.6)
                  : const Color(0xFF6b7280), // Fixed label color
              fontSize: labelFontSize,
            ),
          ),
        ],
      ),
    );
  }
}
