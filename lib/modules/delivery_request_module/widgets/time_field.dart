// time_field.dart
import 'package:flutter/material.dart';
import 'package:throw_user/core/constants/app_colors.dart';

class TimeField extends StatelessWidget {
  final TextEditingController? timeController;
  final VoidCallback? onTimeTap;

  const TimeField({
    super.key,
    required this.timeController,
    required this.onTimeTap,
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
        controller: timeController,
        readOnly: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          hintText: 'Time',
          hintStyle: TextStyle(
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
          ),
          prefixIcon: Icon(
            Icons.schedule,
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
        onTap: onTimeTap,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select time';
          }
          return null;
        },
      ),
    );
  }
}
