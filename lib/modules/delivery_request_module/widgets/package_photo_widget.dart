import 'package:flutter/material.dart';
import 'package:throw_user/core/constants/app_colors.dart';
import 'package:throw_user/modules/delivery_request_module/providers/delivery_request_provider.dart';

class PackagePhotoWidget extends StatelessWidget {
  final DeliveryRequestProvider provider;
  final VoidCallback onAddPhoto;

  const PackagePhotoWidget({
    super.key,
    required this.provider,
    required this.onAddPhoto,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Package Details',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        AspectRatio(
          aspectRatio: 16 / 9,
          child: GestureDetector(
            onTap: onAddPhoto,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.backgroundDark
                    : AppColors.backgroundLight,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isDark ? AppColors.borderDark : AppColors.borderLight,
                  width: 2,
                  style: BorderStyle.solid,
                ),
              ),
              child: provider.itemImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(provider.itemImage!, fit: BoxFit.cover),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_a_photo,
                          size: 40,
                          color: isDark
                              ? AppColors.textSecondaryDark
                              : AppColors.textSecondaryLight,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Upload Package Photo',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: isDark
                                ? AppColors.textSecondaryDark
                                : AppColors.textSecondaryLight,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
