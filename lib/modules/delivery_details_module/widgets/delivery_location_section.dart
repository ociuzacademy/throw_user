// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class DeliveryLocationSection extends StatelessWidget {
  final String title;
  final String address;
  final String? phone;
  final String remark;
  final String date;
  final Color primaryColor;
  final Color textSecondaryColor;
  final Color textPrimaryColor;
  final IconData icon;

  const DeliveryLocationSection({
    super.key,
    required this.title,
    required this.address,
    this.phone,
    required this.remark,
    required this.date,
    required this.primaryColor,
    required this.textSecondaryColor,
    required this.textPrimaryColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isSmallScreen = mediaQuery.size.width < 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: primaryColor, size: isSmallScreen ? 18 : 20),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: primaryColor,
                fontSize: isSmallScreen ? 15 : 16,
              ),
            ),
          ],
        ),
        SizedBox(height: isSmallScreen ? 8 : 10),
        Text(
          address,
          style: TextStyle(
            color: textSecondaryColor,
            fontSize: isSmallScreen ? 13 : 14,
            height: 1.4,
          ),
        ),
        if (phone != null) ...[
          const SizedBox(height: 4),
          Text(
            phone!,
            style: TextStyle(
              color: textSecondaryColor,
              fontSize: isSmallScreen ? 13 : 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
        const SizedBox(height: 4),
        Text(
          '"$remark"',
          style: TextStyle(
            fontSize: isSmallScreen ? 12 : 13,
            fontStyle: FontStyle.italic,
            color: Colors.grey[500],
          ),
        ),
        const SizedBox(height: 6),
        Text(
          date,
          style: TextStyle(
            fontSize: isSmallScreen ? 12 : 13,
            fontWeight: FontWeight.w600,
            color: textPrimaryColor.withValues(alpha: 0.8),
          ),
        ),
      ],
    );
  }
}
