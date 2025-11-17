// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:throw_user/modules/delivery_details_module/widgets/detail_item.dart';

class PackageDetailsGrid extends StatelessWidget {
  final Color textSecondaryColor;
  final Color textPrimaryColor;
  final bool isSmallScreen;
  const PackageDetailsGrid({
    super.key,
    required this.textSecondaryColor,
    required this.textPrimaryColor,
    this.isSmallScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final _ = mediaQuery.size.width < 400;

    // Use GridView for 2-column layout
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: isSmallScreen ? 16 : 24,
      mainAxisSpacing: isSmallScreen ? 12 : 16,
      childAspectRatio: 2.5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        DetailItem(
          isSmallScreen: isSmallScreen,
          textSecondaryColor: textSecondaryColor,
          textPrimaryColor: textPrimaryColor,
          label: 'Package Type',
          value: 'Document',
          index: 0,
        ),
        DetailItem(
          isSmallScreen: isSmallScreen,
          textSecondaryColor: textSecondaryColor,
          textPrimaryColor: textPrimaryColor,
          label: 'Weight',
          value: '~0.5 kg',
          index: 1,
        ),
        DetailItem(
          isSmallScreen: isSmallScreen,
          textSecondaryColor: textSecondaryColor,
          textPrimaryColor: textPrimaryColor,
          label: 'Urgency',
          value: 'Standard',
          index: 2,
        ),
      ],
    );
  }
}
