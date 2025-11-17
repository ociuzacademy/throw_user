import 'package:flutter/material.dart';

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
        color: isDark ? const Color(0xFF1f2937) : Colors.white,
        border: Border.all(
          color: isDark ? const Color(0xFF374151) : const Color(0xFFe5e7eb),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}
