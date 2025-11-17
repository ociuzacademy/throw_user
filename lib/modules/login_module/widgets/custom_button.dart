import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isSmallScreen;
  final Color primaryColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isSmallScreen,
    required this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isSmallScreen ? 50 : 56,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onPressed,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: isSmallScreen ? 15 : 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
