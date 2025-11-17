// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class DetailItem extends StatelessWidget {
  const DetailItem({
    super.key,
    required this.isSmallScreen,
    required this.textSecondaryColor,
    required this.textPrimaryColor,
    required this.label,
    required this.value,
    required this.index,
  });

  final bool isSmallScreen;
  final Color textSecondaryColor;
  final Color textPrimaryColor;
  final String label;
  final String value;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isSmallScreen ? 12 : 14,
            color: textSecondaryColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: isSmallScreen ? 13 : 15,
            color: textPrimaryColor,
          ),
        ),
      ],
    );
  }
}
