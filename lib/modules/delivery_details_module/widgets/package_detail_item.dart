import 'package:flutter/material.dart';
import 'package:throw_user/core/constants/app_colors.dart';

class PackageDetailItem extends StatelessWidget {
  final Color textPrimaryColor;
  final Color textSecondaryColor;
  final String label;
  final String value;
  final bool isPrimary;

  const PackageDetailItem({
    super.key,
    required this.textPrimaryColor,
    required this.textSecondaryColor,
    required this.label,
    required this.value,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: TextStyle(
            fontSize: 10,
            letterSpacing: 0.5,
            fontWeight: FontWeight.bold,
            color: textSecondaryColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: isPrimary ? AppColors.primary : textPrimaryColor,
          ),
        ),
      ],
    );
  }
}
