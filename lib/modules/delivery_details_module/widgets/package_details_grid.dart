// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:throw_user/core/constants/app_colors.dart';
import 'package:throw_user/core/exports/enum_exports.dart';
import 'package:throw_user/modules/delivery_details_module/widgets/package_detail_item.dart';

class PackageDetailsGrid extends StatelessWidget {
  final Color textSecondaryColor;
  final Color textPrimaryColor;
  final bool isSmallScreen;
  final PackageType packageType;
  final double weight;
  final Urgency urgency;
  final String? imageUrl;
  final String? remarks;

  const PackageDetailsGrid({
    super.key,
    required this.textSecondaryColor,
    required this.textPrimaryColor,
    this.isSmallScreen = false,
    required this.packageType,
    required this.weight,
    required this.urgency,
    this.imageUrl,
    this.remarks,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Package Thumbnail
            Container(
              width: isSmallScreen ? 80 : 96,
              height: isSmallScreen ? 80 : 96,
              decoration: BoxDecoration(
                color: isDark ? Colors.grey[800] : Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: imageUrl != null
                  ? CachedNetworkImage(
                      imageUrl: imageUrl!,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error_outline),
                    )
                  : Icon(Icons.inventory_2, color: Colors.grey[400], size: 32),
            ),
            const SizedBox(width: 16),
            // Details Grid
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 12,
                childAspectRatio: 2.2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  PackageDetailItem(
                    textPrimaryColor: textPrimaryColor,
                    textSecondaryColor: textSecondaryColor,
                    label: 'Type',
                    value: packageType.value,
                  ),
                  PackageDetailItem(
                    textPrimaryColor: textPrimaryColor,
                    textSecondaryColor: textSecondaryColor,
                    label: 'Weight',
                    value: '~$weight kg',
                  ),
                  PackageDetailItem(
                    textPrimaryColor: textPrimaryColor,
                    textSecondaryColor: textSecondaryColor,
                    label: 'Urgency',
                    value: urgency.value,
                    isPrimary: true,
                  ),
                ],
              ),
            ),
          ],
        ),
        if (remarks != null && remarks!.isNotEmpty) ...[
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark
                  ? AppColors.primary.withValues(alpha: 0.1)
                  : Colors.blue[50]?.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isDark
                    ? AppColors.primary.withValues(alpha: 0.1)
                    : Colors.blue[100]!.withValues(alpha: 0.5),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.sticky_note_2,
                      color: AppColors.primary,
                      size: 16,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Package Remarks',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  remarks!,
                  style: TextStyle(
                    fontSize: 13,
                    color: textSecondaryColor,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
