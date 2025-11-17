// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class LocationSection extends StatelessWidget {
  final String title;
  final String address;
  final String? phone;
  final String remark;
  final String date;
  final Color primaryColor;
  final Color textSecondaryColor;
  const LocationSection({
    super.key,
    required this.title,
    required this.address,
    this.phone,
    required this.remark,
    required this.date,
    required this.primaryColor,
    required this.textSecondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isSmallScreen = mediaQuery.size.width < 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: primaryColor,
            fontSize: isSmallScreen ? 15 : 16,
          ),
        ),
        SizedBox(height: isSmallScreen ? 6 : 8),
        Text(
          address,
          style: TextStyle(
            color: textSecondaryColor,
            fontSize: isSmallScreen ? 13 : 14,
          ),
        ),
        if (phone != null) ...[
          SizedBox(height: isSmallScreen ? 2 : 4),
          Text(
            phone!,
            style: TextStyle(
              color: textSecondaryColor,
              fontSize: isSmallScreen ? 13 : 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
        SizedBox(height: isSmallScreen ? 2 : 4),
        Text(
          remark,
          style: TextStyle(
            fontSize: isSmallScreen ? 12 : 14,
            fontStyle: FontStyle.italic,
            color: textSecondaryColor,
          ),
        ),
        SizedBox(height: isSmallScreen ? 6 : 8),
        Text(
          date,
          style: TextStyle(
            fontSize: isSmallScreen ? 12 : 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
