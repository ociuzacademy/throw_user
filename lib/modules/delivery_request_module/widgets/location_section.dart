// location_section.dart (updated)
import 'package:flutter/material.dart';
import 'package:throw_user/core/constants/app_colors.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:throw_user/core/exports/enum_exports.dart';
import 'package:throw_user/modules/delivery_request_module/widgets/date_field.dart';
import 'package:throw_user/modules/delivery_request_module/widgets/time_field.dart';
import 'package:throw_user/modules/delivery_request_module/widgets/location_card_preview.dart';
import 'package:throw_user/modules/delivery_request_module/widgets/phone_field.dart';

class LocationSection extends StatelessWidget {
  final String title;
  final String addressHint;
  final String remarksHint;
  final bool showDateTime;
  final GeoPoint? selectedLocation;
  final bool isPickup;
  final VoidCallback onMapTap;
  final PreferedDeliveryTime? selectedTime;
  final Function(PreferedDeliveryTime)? onSelectingTime;

  // Controllers
  final TextEditingController? addressController;
  final TextEditingController? phoneController;
  final TextEditingController? remarksController;
  final TextEditingController? dateController;
  final TextEditingController? timeController;
  final TextEditingController? preferredDateController;
  final TextEditingController? recipientPhoneController;

  // Callbacks
  final VoidCallback? onDateTap;
  final VoidCallback? onTimeTap;
  final VoidCallback? onPreferredDateTap;

  const LocationSection({
    super.key,
    required this.title,
    required this.addressHint,
    required this.remarksHint,
    required this.showDateTime,
    required this.selectedLocation,
    required this.isPickup,
    required this.onMapTap,
    this.selectedTime,
    this.onSelectingTime,
    this.addressController,
    this.phoneController,
    this.remarksController,
    this.dateController,
    this.timeController,
    this.preferredDateController,
    this.recipientPhoneController,
    this.onDateTap,
    this.onTimeTap,
    this.onPreferredDateTap,
    this.addressValidator,
    this.remarksValidator,
    this.dateValidator,
    this.timeValidator,
    this.phoneValidator,
  });
  final String? Function(String?)? addressValidator;
  final String? Function(String?)? remarksValidator;
  final String? Function(String?)? dateValidator;
  final String? Function(String?)? timeValidator;
  final String? Function(String?)? phoneValidator;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimaryLight,
              ),
            ),
          ),
          const Divider(height: 1),

          // Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Address Field
                Container(
                  decoration: BoxDecoration(
                    color: isDark
                        ? AppColors.cardDark
                        : AppColors.getBackgroundColor(false),
                    border: Border.all(
                      color: isDark
                          ? AppColors.borderDark
                          : AppColors.borderLight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextFormField(
                    controller: addressController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(16),
                      hintText: addressHint,
                      hintStyle: TextStyle(
                        color: isDark
                            ? AppColors.textSecondaryDark
                            : AppColors.textSecondaryLight,
                      ),
                    ),
                    style: TextStyle(
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight,
                    ),
                    validator:
                        addressValidator ??
                        (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter address';
                          }
                          return null;
                        },
                  ),
                ),

                const SizedBox(height: 16),

                // Phone Field
                if (isPickup && phoneController != null) ...[
                  PhoneField(
                    phoneController: phoneController!,
                    validator: phoneValidator,
                    hintText: 'Pickup phone number',
                  ),
                  const SizedBox(height: 16),
                ] else if (!isPickup && recipientPhoneController != null) ...[
                  PhoneField(
                    phoneController: recipientPhoneController!,
                    validator: phoneValidator,
                    hintText: "Recipient's phone number",
                  ),
                  const SizedBox(height: 16),
                ],

                // Remarks Field
                Container(
                  decoration: BoxDecoration(
                    color: isDark
                        ? AppColors.cardDark
                        : AppColors.getBackgroundColor(false),
                    border: Border.all(
                      color: isDark
                          ? AppColors.borderDark
                          : AppColors.borderLight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextFormField(
                    controller: remarksController,
                    maxLines: 2,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(16),
                      hintText: remarksHint,
                      hintStyle: TextStyle(
                        color: isDark
                            ? AppColors.textSecondaryDark
                            : AppColors.textSecondaryLight,
                      ),
                    ),
                    style: TextStyle(
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight,
                    ),
                    validator: remarksValidator,
                  ),
                ),

                // Date/Time Fields
                const SizedBox(height: 16),
                if (isPickup)
                  Row(
                    children: [
                      Expanded(
                        child: DateField(
                          dateController: dateController,
                          onDateTap: onDateTap,
                          validator: dateValidator,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TimeField(
                          timeController: timeController,
                          onTimeTap: onTimeTap,
                          validator: timeValidator,
                        ),
                      ),
                    ],
                  )
                else
                  DateField(
                    dateController: preferredDateController,
                    onDateTap: onPreferredDateTap,
                    validator: dateValidator,
                  ),
              ],
            ),
          ),

          // Map Preview
          GestureDetector(
            onTap: onMapTap,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: selectedLocation != null
                    ? LocationCardPreview(
                        isDark: isDark,
                        isPickup: isPickup,
                        selectedLocation: selectedLocation!,
                      )
                    : Container(
                        color: isDark
                            ? AppColors.borderDark
                            : AppColors.borderLight.withValues(alpha: 0.5),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_location_alt,
                                size: 40,
                                color: isDark
                                    ? AppColors.textSecondaryDark
                                    : AppColors.textSecondaryLight,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Tap to select location',
                                style: TextStyle(
                                  color: isDark
                                      ? AppColors.textSecondaryDark
                                      : AppColors.textSecondaryLight,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
