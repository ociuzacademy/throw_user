import 'package:flutter/material.dart';
import 'package:throw_user/core/constants/app_colors.dart';
import 'package:throw_user/modules/delivery_details_module/view/delivery_details_page.dart';

class DeliveryCard extends StatelessWidget {
  final String deliveryRequestId;
  final String status;
  final String title;
  final String description;
  const DeliveryCard({
    super.key,
    required this.deliveryRequestId,
    required this.status,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isVerySmallScreen = mediaQuery.size.width < 400;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Color definitions
    final cardColor = isDark ? AppColors.cardDark : AppColors.cardLight;
    final textPrimaryColor = AppColors.getTextPrimaryColor(isDark);
    final textSecondaryColor = AppColors.getTextSecondaryColor(isDark);
    final dividerColor = AppColors.getBorderColor(isDark);

    // Responsive dimensions
    final padding = isVerySmallScreen ? 16.0 : 20.0;
    final titleFontSize = isVerySmallScreen ? 16.0 : 18.0;
    final descriptionFontSize = isVerySmallScreen ? 14.0 : 16.0;
    final statusFontSize = isVerySmallScreen ? 14.0 : 16.0;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          DeliveryDetailsPage.route(deliveryRequestId: deliveryRequestId),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Status
                  Text(
                    status,
                    style: TextStyle(
                      fontSize: statusFontSize,
                      fontWeight: FontWeight.w600,
                      color: status == 'In Progress'
                          ? AppColors.primary
                          : AppColors.success,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Title
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                      color: textPrimaryColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Description
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: descriptionFontSize,
                      color: textSecondaryColor,
                    ),
                  ),
                ],
              ),
            ),
            // Divider
            Container(height: 1, color: dividerColor),
          ],
        ),
      ),
    );
  }
}
