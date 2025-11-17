import 'package:flutter/material.dart';
import 'package:throw_user/modules/delivery_request_module/typedefs/validate_text_input.dart';

class ResponsiveFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isSmallScreen;
  final TextInputType? keyboardType;
  final ValidateTextInput? validator;
  final Widget? suffixIcon;
  final bool obscureText;

  const ResponsiveFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.isSmallScreen,
    this.keyboardType,
    this.validator,
    this.suffixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(
          horizontal: isSmallScreen ? 12 : 16,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Theme.of(context).brightness == Brightness.dark
              ? const Color(0xFF9ca3af)
              : const Color(0xFF6b7280),
        ),
        suffixIcon: suffixIcon,
      ),
      validator: validator,
    );
  }
}
