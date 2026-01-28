// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:throw_user/core/exports/enum_exports.dart';
import 'package:throw_user/modules/delivery_details_module/widgets/progress_step.dart';

class ProgressTimeline extends StatelessWidget {
  final String deliveryId;
  final bool isDark;
  final Color primaryColor;
  final Color textPrimaryColor;
  final Color textSecondaryColor;
  final DeliveryStatus deliveryStatus;
  final String? otp;
  final VoidCallback? onStartPressed;
  final VoidCallback? onOtpShared; // Add this callback
  final bool feedbackSubmitted;

  const ProgressTimeline({
    super.key,
    required this.deliveryId,
    required this.isDark,
    required this.primaryColor,
    required this.textPrimaryColor,
    required this.textSecondaryColor,
    required this.deliveryStatus,
    this.otp,
    this.onStartPressed,
    this.onOtpShared, // Add this parameter
    required this.feedbackSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isVerySmallScreen = mediaQuery.size.width < 400;

    // Responsive dimensions
    final stepSpacing = isVerySmallScreen ? 32.0 : 32.0;

    return Stack(
      children: [
        // Dashed line
        Positioned(
          left: 20,
          top: 20,
          bottom: 20,
          child: Container(
            width: 2,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: isDark ? Colors.grey[800]! : Colors.grey[200]!,
                  width: 2,
                  style: BorderStyle.none,
                ),
              ),
            ),
            child: CustomPaint(
              painter: _DashedLinePainter(
                color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
              ),
            ),
          ),
        ),

        Column(
          children: [
            // Pickup Step
            ProgressStep(
              deliveryId: deliveryId,
              icon: Icons.inventory_2,
              title: 'Pickup',
              subtitle: deliveryStatus == DeliveryStatus.pending
                  ? 'Ready to Start'
                  : 'Completed',
              isActive: deliveryStatus == DeliveryStatus.pending,
              isCompleted: deliveryStatus.index > DeliveryStatus.pending.index,
              hasButton: deliveryStatus == DeliveryStatus.pending,
              buttonText: 'Start',
              onButtonPressed: onStartPressed,
              primaryColor: primaryColor,
              textPrimaryColor: textPrimaryColor,
              textSecondaryColor: textSecondaryColor,
              isDark: isDark,
            ),

            SizedBox(height: stepSpacing),

            // On the way Step
            ProgressStep(
              deliveryId: deliveryId,
              icon: Icons.local_shipping,
              title: 'On the way',
              subtitle: deliveryStatus == DeliveryStatus.onTheWay
                  ? 'In Progress'
                  : deliveryStatus.index > DeliveryStatus.onTheWay.index
                  ? 'Completed'
                  : 'Pending',
              isActive: deliveryStatus == DeliveryStatus.onTheWay,
              isCompleted: deliveryStatus.index > DeliveryStatus.onTheWay.index,
              hasOtp: deliveryStatus.index >= DeliveryStatus.onTheWay.index,
              otp: otp,
              showShareIcon: deliveryStatus == DeliveryStatus.onTheWay,
              onOtpShared: onOtpShared, // Pass the callback here
              primaryColor: primaryColor,
              textPrimaryColor: textPrimaryColor,
              textSecondaryColor: textSecondaryColor,
              isDark: isDark,
            ),

            SizedBox(height: stepSpacing),

            // Delivered Step
            ProgressStep(
              deliveryId: deliveryId,
              icon: Icons.task_alt,
              title: 'Delivered',
              subtitle: deliveryStatus == DeliveryStatus.dropOff
                  ? 'Completed'
                  : 'Pending',
              isActive: deliveryStatus == DeliveryStatus.dropOff,
              isCompleted: deliveryStatus == DeliveryStatus.dropOff,
              hasReviewButton: true,
              isReviewButtonEnabled:
                  deliveryStatus == DeliveryStatus.dropOff &&
                  !feedbackSubmitted,
              primaryColor: primaryColor,
              textPrimaryColor: textPrimaryColor,
              textSecondaryColor: textSecondaryColor,
              isDark: isDark,
            ),
          ],
        ),
      ],
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  final Color color;

  const _DashedLinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2;

    const double dashWidth = 4;
    const double dashSpace = 4;

    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), paint);
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
