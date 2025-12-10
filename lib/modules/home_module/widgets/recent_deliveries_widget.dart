import 'package:flutter/material.dart';
import 'package:throw_user/core/constants/app_colors.dart';
import 'package:throw_user/modules/home_module/widgets/delivery_card.dart';

class RecentDeliveriesWidget extends StatelessWidget {
  const RecentDeliveriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isSmallScreen = mediaQuery.size.width < 600;
    final _ = mediaQuery.size.width < 400;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Color definitions
    final backgroundColor = AppColors.getBackgroundColor(isDark);
    final textPrimaryColor = AppColors.getTextPrimaryColor(isDark);

    // Responsive dimensions
    final padding = isSmallScreen ? 16.0 : 24.0;
    final spacing = isSmallScreen ? 16.0 : 24.0;
    final titleFontSize = isSmallScreen ? 20.0 : 24.0;

    return Container(
      color: backgroundColor,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Recent Deliveries Section Title
            Text(
              'Recent Deliveries',
              style: TextStyle(
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
                color: textPrimaryColor,
              ),
            ),
            SizedBox(height: spacing),

            // Delivery Cards
            DeliveryCard(
              status: 'In Progress',
              title: 'Package to 123 Main St',
              description: 'Estimated delivery: 2 hours',
              imageUrl: 'assets/images/package_delivery.png',
            ),
            SizedBox(height: spacing),

            DeliveryCard(
              status: 'Completed',
              title: 'Groceries to 456 Oak Ave',
              description: 'Delivered on time',
              imageUrl: 'assets/images/groceries_delivery.png',
            ),
            SizedBox(height: spacing),

            // Additional delivery cards for better UX
            DeliveryCard(
              status: 'Completed',
              title: 'Documents to Office',
              description: 'Signed and delivered',
              imageUrl: 'assets/images/documents_delivery.png',
            ),
          ],
        ),
      ),
    );
  }
}
