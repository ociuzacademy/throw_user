import 'package:flutter/material.dart';
import 'package:throw_user/core/constants/app_colors.dart';

class ResponsiveCard extends StatelessWidget {
  final bool isDark;
  final double height;
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const ResponsiveCard({
    super.key,
    required this.isDark,
    required this.height,
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: isDark ? AppColors.inactiveBackgroundDark : Colors.white,
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}
