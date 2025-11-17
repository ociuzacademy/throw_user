import 'package:flutter/material.dart';
import 'package:throw_user/modules/delivery_request_module/typedefs/validate_text_input.dart';

enum TextFieldStyle {
  profile, // Solid colors, no border, fixed height
  delivery, // Semi-transparent with border, flexible height
}

class UnifiedTextField extends StatelessWidget {
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
  final bool hasFixedHeight;

  const UnifiedTextField({
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
    this.hasFixedHeight = true,
  });

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = screenWidth < 375;

    // Theme-based colors with fallbacks
    final backgroundColor = _getBackgroundColor();
    final borderColor = _getBorderColor();
    final hintColor = _getHintColor();
    final textColor = _getTextColor();

    return Container(
      height: hasFixedHeight ? (isSmallScreen ? 50 : 56) : null,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: style == TextFieldStyle.delivery
            ? Border.all(color: borderColor, width: 1)
            : null,
        borderRadius: BorderRadius.circular(12),
        boxShadow: _getBoxShadow(),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        style: TextStyle(
          color: textColor,
          fontSize: isSmallScreen ? 14 : 16,
          fontWeight: _getFontWeight(),
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: isSmallScreen ? 12 : 16,
            vertical: style == TextFieldStyle.profile
                ? (isSmallScreen ? 12 : 16)
                : (isSmallScreen ? 12 : 16),
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
          filled: true,
          fillColor: Colors.transparent,
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    if (textPrimaryColor != null && style == TextFieldStyle.profile) {
      return textPrimaryColor!.withValues(alpha: 0.1);
    }

    switch (style) {
      case TextFieldStyle.profile:
        return isDark ? const Color(0xFF1c2a38) : const Color(0xFFe7eef3);
      case TextFieldStyle.delivery:
        return isDark
            ? const Color(0xFF182430)
            : Colors.white.withValues(alpha: 0.5);
    }
  }

  Color _getBorderColor() {
    return isDark ? const Color(0xFF374151) : Colors.grey.shade300;
  }

  Color _getHintColor() {
    if (textSecondaryColor != null) {
      return textSecondaryColor!;
    }

    switch (style) {
      case TextFieldStyle.profile:
        return isDark ? const Color(0xFFa0b3c4) : const Color(0xFF4c779a);
      case TextFieldStyle.delivery:
        return isDark ? const Color(0xFF9badbd) : Colors.grey;
    }
  }

  Color _getTextColor() {
    if (textPrimaryColor != null) {
      return textPrimaryColor!;
    }

    switch (style) {
      case TextFieldStyle.profile:
        return isDark ? Colors.white : const Color(0xFF0d151b);
      case TextFieldStyle.delivery:
        return isDark ? const Color(0xFFf6f7f8) : const Color(0xFF111518);
    }
  }

  FontWeight _getFontWeight() {
    switch (style) {
      case TextFieldStyle.profile:
        return FontWeight.normal;
      case TextFieldStyle.delivery:
        return FontWeight.normal;
    }
  }

  List<BoxShadow>? _getBoxShadow() {
    switch (style) {
      case TextFieldStyle.profile:
        return null;
      case TextFieldStyle.delivery:
        return [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ];
    }
  }
}
