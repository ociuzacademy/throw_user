// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:throw_user/core/constants/app_colors.dart';
import 'package:throw_user/core/exports/enum_exports.dart';
import 'package:throw_user/modules/delivery_details_module/widgets/progress_step.dart';

class ProgressTimeline extends StatelessWidget {
  final bool isDark;
  final Color primaryColor;
  final Color textPrimaryColor;
  final Color textSecondaryColor;
  final DeliveryStatus deliveryStatus;
  final String? otp;
  final VoidCallback? onStartPressed;
  final VoidCallback? onOtpShared; // Add this callback

  const ProgressTimeline({
    super.key,
    required this.isDark,
    required this.primaryColor,
    required this.textPrimaryColor,
    required this.textSecondaryColor,
    required this.deliveryStatus,
    this.otp,
    this.onStartPressed,
    this.onOtpShared, // Add this parameter
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isVerySmallScreen = mediaQuery.size.width < 400;

    // Responsive dimensions
    final linePosition = isVerySmallScreen ? 20.0 : 20.0;
    final stepSpacing = isVerySmallScreen ? 32.0 : 32.0;

    return Stack(
      children: [
        // Dashed line - positioned exactly like HTML
        Positioned(
          left: linePosition,
          top: isVerySmallScreen ? 40 : 40,
          bottom: isVerySmallScreen ? 40 : 40,
          child: CustomPaint(
            size: const Size(2, double.infinity),
            painter: _DashedLinePainter(
              color: AppColors.getBorderColor(isDark),
            ),
          ),
        ),

        Column(
          children: [
            // Pickup Step
            ProgressStep(
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
              icon: Icons.task_alt,
              title: 'Delivered',
              subtitle: deliveryStatus == DeliveryStatus.dropOff
                  ? 'Completed'
                  : 'Pending',
              isActive: deliveryStatus == DeliveryStatus.dropOff,
              isCompleted: deliveryStatus == DeliveryStatus.dropOff,
              hasReviewButton: true,
              isReviewButtonEnabled: deliveryStatus == DeliveryStatus.dropOff,
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
