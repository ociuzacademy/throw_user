// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class SuccessIcon extends StatelessWidget {
  const SuccessIcon({
    super.key,
    required this.animation,
    required this.primaryColor,
  });

  final Animation<double> animation;
  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isVerySmallScreen = mediaQuery.size.width < 400;

    // Responsive stroke width
    final strokeWidth = isVerySmallScreen ? 3.0 : 5.0;

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return CustomPaint(
          painter: CheckmarkPainter(
            color: primaryColor,
            progress: animation.value,
            strokeWidth: strokeWidth,
          ),
        );
      },
    );
  }
}

class CheckmarkPainter extends CustomPainter {
  final Color color;
  final double progress;
  final double strokeWidth;

  CheckmarkPainter({
    required this.color,
    required this.progress,
    this.strokeWidth = 5.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final circlePaint = Paint()
      ..color = color.withValues(alpha: 0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final checkPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Draw circle
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 2 - (strokeWidth / 2),
      circlePaint,
    );

    // Draw checkmark based on progress
    if (progress > 0) {
      final path = Path();

      // Start point
      path.moveTo(size.width * 0.25, size.height * 0.5);

      // Middle point (animate this)
      if (progress < 0.5) {
        final middleProgress = progress / 0.5;
        path.lineTo(
          size.width * 0.25 + (size.width * 0.2) * middleProgress,
          size.height * 0.5 + (size.height * 0.2) * middleProgress,
        );
      } else {
        path.lineTo(size.width * 0.45, size.height * 0.7);

        // End point (animate this)
        if (progress > 0.5) {
          final endProgress = (progress - 0.5) / 0.5;
          path.lineTo(
            size.width * 0.45 + (size.width * 0.3) * endProgress,
            size.height * 0.7 - (size.height * 0.4) * endProgress,
          );
        }
      }

      canvas.drawPath(path, checkPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CheckmarkPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
