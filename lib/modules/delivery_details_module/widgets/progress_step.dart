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
  final VoidCallback? onOtpShared;
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
    this.onOtpShared,
    this.otp,
    this.buttonText,
    this.primaryColor,
    this.textPrimaryColor,
    this.textSecondaryColor,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool isFinished = isCompleted;

    // Circle background color
    final Color circleColor = isFinished || isActive
        ? (primaryColor ?? AppColors.primary)
        : (isDark ? Colors.grey[800]! : Colors.grey[200]!);

    // Icon color
    final Color iconColor = isFinished || isActive
        ? Colors.white
        : (isDark ? Colors.grey[500]! : Colors.grey[400]!);

    // Subtitle text color
    final Color subtitleColor = isFinished || (isActive && !hasButton)
        ? Colors.green[500]!
        : (isDark ? textSecondaryColor! : textSecondaryColor!);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Stepper Icon
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(color: circleColor, shape: BoxShape.circle),
          child: Icon(icon, color: iconColor, size: 20),
        ),
        const SizedBox(width: 16),
        // Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isFinished || isActive
                                ? textPrimaryColor
                                : textSecondaryColor,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          subtitle,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: (isFinished || (isActive && !hasButton))
                                ? FontWeight.w600
                                : FontWeight.normal,
                            color: subtitleColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (hasButton && isActive)
                    ElevatedButton(
                      onPressed: onButtonPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor ?? AppColors.primary,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9999),
                        ),
                      ),
                      child: Text(
                        buttonText ?? 'Start',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  if (hasReviewButton)
                    ElevatedButton(
                      onPressed: isReviewButtonEnabled
                          ? () => Navigator.push(
                              context,
                              FeedbackPage.route(deliveryId: deliveryId),
                            )
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isReviewButtonEnabled
                            ? (primaryColor?.withValues(alpha: 0.1) ??
                                  AppColors.primary.withValues(alpha: 0.1))
                            : (isDark ? Colors.grey[800] : Colors.grey[200]),
                        foregroundColor: isReviewButtonEnabled
                            ? (primaryColor ?? AppColors.primary)
                            : Colors.grey[500],
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9999),
                        ),
                      ),
                      child: const Text(
                        'Review',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                ],
              ),
              if (hasOtp) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isDark
                        ? Colors.grey[800]?.withValues(alpha: 0.5)
                        : Colors.grey[100]?.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'OTP:',
                        style: TextStyle(
                          fontSize: 13,
                          color: textSecondaryColor,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        otp ?? '1234',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4,
                          color: textPrimaryColor,
                        ),
                      ),
                      const Spacer(),
                      if (showShareIcon)
                        IconButton(
                          onPressed: onOtpShared,
                          icon: Icon(
                            Icons.share,
                            color: primaryColor ?? AppColors.primary,
                            size: 20,
                          ),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
