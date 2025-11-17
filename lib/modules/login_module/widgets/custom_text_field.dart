import 'package:flutter/material.dart';
import 'package:throw_user/modules/delivery_request_module/typedefs/validate_text_input.dart';

enum TextFieldStyle { delivery, login }

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final double screenWidth;
  final bool isDark;
  final TextFieldStyle style;
  final bool obscureText;
  final ValidateTextInput? validator;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Color? textPrimaryColor;
  final Color? textSecondaryColor;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.screenWidth,
    required this.isDark,
    required this.style,
    this.obscureText = false,
    this.validator,
    this.keyboardType,
    this.suffixIcon,
    this.textPrimaryColor,
    this.textSecondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = screenWidth < 375;

    // Colors based on theme and style
    final backgroundColor = isDark ? const Color(0xFF182430) : Colors.white;
    final borderColor = isDark ? const Color(0xFF374151) : Colors.grey.shade300;
    final hintColor =
        textSecondaryColor ?? (isDark ? const Color(0xFF9badbd) : Colors.grey);
    final textColor =
        textPrimaryColor ??
        (isDark ? const Color(0xFFf6f7f8) : const Color(0xFF111518));

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor, width: 1),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          if (style == TextFieldStyle.delivery)
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        style: TextStyle(color: textColor, fontSize: isSmallScreen ? 14 : 16),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: isSmallScreen ? 12 : 16,
            vertical: isSmallScreen ? 12 : 16,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: hintColor,
            fontSize: isSmallScreen ? 14 : 16,
          ),
          suffixIcon: suffixIcon,
          errorStyle: TextStyle(
            fontSize: isSmallScreen ? 12 : 14,
            color: Colors.red.shade400,
          ),
        ),
      ),
    );
  }
}
