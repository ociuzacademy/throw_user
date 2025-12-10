// delivery_request_page.dart (updated)

import 'package:flutter/material.dart';
import 'package:throw_user/core/constants/app_colors.dart';
import 'package:throw_user/modules/delivery_request_module/providers/delivery_request_provider.dart';

class WeightFieldWidget extends StatelessWidget {
  const WeightFieldWidget({
    super.key,
    required this.isDark,
    required this.provider,
  });

  final bool isDark;
  final DeliveryRequestProvider provider;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: isDark ? AppColors.inactiveBackgroundDark : Colors.white,
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        controller: provider.weightController,
        keyboardType: TextInputType.number,
        style: TextStyle(color: isDark ? Colors.white : Colors.black),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          hintText: 'Weight (kg)',
          hintStyle: TextStyle(
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter weight';
          }
          final weight = double.tryParse(value);
          if (weight == null || weight <= 0) {
            return 'Please enter a valid weight';
          }
          return null;
        },
      ),
    );
  }
}
