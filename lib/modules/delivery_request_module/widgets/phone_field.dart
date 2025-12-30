// phone_field.dart
import 'package:flutter/material.dart';
import 'package:throw_user/core/constants/app_colors.dart';

class PhoneField extends StatelessWidget {
  final TextEditingController phoneController;
  final String? Function(String?)? validator;

  const PhoneField({super.key, required this.phoneController, this.validator});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.getPhoneFieldBackground(isDark),
        border: Border.all(color: AppColors.getBorderColor(isDark)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        controller: phoneController,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          hintText: "Recipient's phone number",
          hintStyle: TextStyle(color: AppColors.getGrayColor(isDark)),
          prefixIcon: Icon(
            Icons.phone,
            color: AppColors.getGrayColor(isDark),
            size: 20,
          ),
        ),
        style: TextStyle(color: AppColors.getTextPrimaryColor(isDark)),
        validator: validator,
      ),
    );
  }
}
