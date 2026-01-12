// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:throw_user/core/constants/app_colors.dart';

// import 'package:throw_user/modules/delivery_details_module/utils/progress_step_helper.dart';
import 'package:throw_user/modules/feedback_module/view/feedback_page.dart';

class ProgressStep extends StatelessWidget {
  final String deliveryId;
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isActive;
  final bool isCompleted;
  final bool hasButton;
  final bool hasOtp;
  final bool showShareIcon;
  final bool hasReviewButton;
  final bool isReviewButtonEnabled;
  final VoidCallback? onButtonPressed;
  final VoidCallback? onOtpShared; // Add this callback
  final String? otp;
  final String? buttonText;
  final Color? primaryColor;
  final Color? textPrimaryColor;
  final Color? textSecondaryColor;
  final bool isDark;
  const ProgressStep({
    super.key,
    required this.deliveryId,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isActive,
    this.isCompleted = false,
    this.hasButton = false,
    this.hasOtp = false,
    this.showShareIcon = false,
    this.hasReviewButton = false,
    this.isReviewButtonEnabled = false,
    this.onButtonPressed,
    this.onOtpShared, // Add this parameter
    this.otp,
    this.buttonText,
    this.primaryColor,
    this.textPrimaryColor,
    this.textSecondaryColor,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isVerySmallScreen = mediaQuery.size.width < 400;

    // Responsive dimensions
    final iconSize = isVerySmallScreen ? 40.0 : 40.0;
    final iconInnerSize = isVerySmallScreen ? 20.0 : 20.0;
    final spacing = isVerySmallScreen ? 16.0 : 16.0;
    final buttonPadding = isVerySmallScreen
        ? const EdgeInsets.symmetric(horizontal: 24, vertical: 8)
        : const EdgeInsets.symmetric(horizontal: 24, vertical: 8);
    final otpFontSize = isVerySmallScreen ? 20.0 : 20.0;

    // Determine icon circle color
    final iconCircleColor = isCompleted
        ? AppColors
              .success // Green for completed
        : isActive
        ? primaryColor!
        : AppColors.getBorderColor(isDark);

    // Determine icon color
    final iconColor = isCompleted || isActive
        ? Colors.white
        : AppColors.getGrayColor(isDark);

    // Determine title color
    final titleColor = isActive || isCompleted
        ? textPrimaryColor
        : textSecondaryColor;

    // Determine subtitle color
    final subtitleColor = isCompleted
        ? AppColors
              .success // Green for completed
        : isActive
        ? AppColors
              .success // Green for active
        : textSecondaryColor;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon Circle
        Container(
          width: iconSize,
          height: iconSize,
          decoration: BoxDecoration(
            color: iconCircleColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            isCompleted ? Icons.check : icon,
            color: iconColor,
            size: iconInnerSize,
          ),
        ),
        SizedBox(width: spacing),

        // Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: isVerySmallScreen ? 16 : 16,
                  color: titleColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: isVerySmallScreen ? 14 : 14,
                  color: subtitleColor,
                ),
              ),

              // OTP Section
              if (hasOtp) ...[
                SizedBox(height: isVerySmallScreen ? 12 : 12),
                Opacity(
                  opacity: isActive ? 1.0 : 0.5,
                  child: Container(
                    padding: EdgeInsets.all(isVerySmallScreen ? 12 : 12),
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors.inactiveBackgroundDark
                          : AppColors.backgroundLight,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'OTP:',
                          style: TextStyle(
                            fontSize: isVerySmallScreen ? 14 : 14,
                            color: textSecondaryColor,
                          ),
                        ),
                        SizedBox(width: isVerySmallScreen ? 16 : 16),
                        Expanded(
                          child: Text(
                            otp ?? '1234',
                            style: TextStyle(
                              fontSize: otpFontSize,
                              fontWeight: FontWeight.bold,
                              letterSpacing: isVerySmallScreen ? 4 : 4,
                              color: textPrimaryColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (showShareIcon)
                          IconButton(
                            onPressed: () /*async*/ {
                              debugPrint('Share OTP via WhatsApp tapped');
                              onOtpShared?.call();
                              // if (phoneNumber != null) {
                              //   final success =
                              //       await ProgressStepHelper.shareOtpToWhatsApp(
                              //         context,
                              //         otp,
                              //         phoneNumber: phoneNumber!,
                              //       );

                              //   // If OTP was successfully shared, call the callback
                              //   if (success && onOtpShared != null) {
                              //     onOtpShared!();
                              //   }
                              // }
                            },
                            icon: Icon(
                              Icons.share,
                              color: primaryColor,
                              size: isVerySmallScreen ? 20 : 20,
                            ),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            tooltip: 'Share OTP via WhatsApp',
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),

        // Start Button (only for Pickup step when active)
        if (hasButton && isActive)
          ElevatedButton(
            onPressed: onButtonPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
              padding: buttonPadding,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9999),
              ),
              textStyle: TextStyle(
                fontSize: isVerySmallScreen ? 14 : 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            child: Text(buttonText ?? 'Start'),
          ),

        // Review Button (for delivered step)
        if (hasReviewButton)
          ElevatedButton(
            onPressed: isReviewButtonEnabled
                ? () => Navigator.push(
                    context,
                    FeedbackPage.route(deliveryId: deliveryId),
                  )
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: primaryColor,
              padding: buttonPadding,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9999),
              ),
              textStyle: TextStyle(
                fontSize: isVerySmallScreen ? 14 : 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            child: const Text('Review'),
          ),
      ],
    );
  }
}
