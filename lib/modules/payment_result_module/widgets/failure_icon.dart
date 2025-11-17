// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class FailureIcon extends StatelessWidget {
  const FailureIcon({
    super.key,
    required this.animation,
    required this.errorColor,
  });

  final Animation<double> animation;
  final Color errorColor;

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
          painter: CrossPainter(
            color: errorColor,
            progress: animation.value,
            strokeWidth: strokeWidth,
          ),
        );
      },
    );
  }
}

class CrossPainter extends CustomPainter {
  final Color color;
  final double progress;
  final double strokeWidth;

  CrossPainter({
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

    final crossPaint = Paint()
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

    // Draw cross (X) based on progress
    if (progress > 0) {
      final path = Path();

      // First line of the cross: top-left to bottom-right
      if (progress < 0.5) {
        // Animate first line
        final firstLineProgress = progress / 0.5;
        path.moveTo(size.width * 0.3, size.height * 0.3);
        path.lineTo(
          size.width * 0.3 + (size.width * 0.4) * firstLineProgress,
          size.height * 0.3 + (size.height * 0.4) * firstLineProgress,
        );
      } else {
        // First line is complete, animate second line
        path.moveTo(size.width * 0.3, size.height * 0.3);
        path.lineTo(size.width * 0.7, size.height * 0.7);

        // Second line of the cross: top-right to bottom-left
        final secondLineProgress = (progress - 0.5) / 0.5;
        path.moveTo(size.width * 0.7, size.height * 0.3);
        path.lineTo(
          size.width * 0.7 - (size.width * 0.4) * secondLineProgress,
          size.height * 0.3 + (size.height * 0.4) * secondLineProgress,
        );
      }

      canvas.drawPath(path, crossPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CrossPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
