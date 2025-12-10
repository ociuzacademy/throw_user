// preferred_date_field.dart
import 'package:flutter/material.dart';
import 'package:throw_user/core/constants/app_colors.dart';

class PreferredDateField extends StatelessWidget {
  final TextEditingController? preferredDateController;
  final VoidCallback? onPreferredDateTap;

  const PreferredDateField({
    super.key,
    required this.preferredDateController,
    required this.onPreferredDateTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.inactiveBackgroundDark
            : AppColors.getBackgroundColor(false),
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        controller: preferredDateController,
        readOnly: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          hintText: 'Date',
          hintStyle: TextStyle(
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
          ),
          prefixIcon: Icon(
            Icons.calendar_today,
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
            size: 20,
          ),
        ),
        style: TextStyle(
          color: isDark
              ? AppColors.textPrimaryDark
              : AppColors.textPrimaryLight,
        ),
        onTap: onPreferredDateTap,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select date';
          }
          return null;
        },
      ),
    );
  }
}
