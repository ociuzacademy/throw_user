// location_section.dart (updated)
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:throw_user/modules/delivery_request_module/widgets/date_field.dart';
import 'package:throw_user/modules/delivery_request_module/widgets/preferred_date_field.dart';
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
  final String? selectedTime;
  final Function(String)? onSelectingTime;

  // Controllers
  final TextEditingController? addressController;
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
    this.remarksController,
    this.dateController,
    this.timeController,
    this.preferredDateController,
    this.recipientPhoneController,
    this.onDateTap,
    this.onTimeTap,
    this.onPreferredDateTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenSize = MediaQuery.of(context).size;
    final isMediumScreen = screenSize.width < 600;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1f2937) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: isDark
                      ? const Color(0xFF374151)
                      : const Color(0xFFe5e7eb),
                ),
              ),
            ),
            child: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isDark
                        ? const Color(0xFFf9fafb)
                        : const Color(0xFF111827),
                  ),
                ),
              ],
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Address Field
                Container(
                  decoration: BoxDecoration(
                    color: isDark
                        ? const Color(0xFF1f2937)
                        : const Color(0xFFf6f7f8),
                    border: Border.all(
                      color: isDark
                          ? const Color(0xFF374151)
                          : const Color(0xFFe5e7eb),
                    ),
                    borderRadius: BorderRadius.circular(8),
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
                            ? const Color(0xFF9ca3af)
                            : const Color(0xFF6b7280),
                      ),
                    ),
                    style: TextStyle(
                      color: isDark
                          ? const Color(0xFFf9fafb)
                          : const Color(0xFF111827),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter $addressHint';
                      }
                      return null;
                    },
                  ),
                ),

                const SizedBox(height: 16),

                // Phone Field (only for drop-off)
                if (!isPickup && recipientPhoneController != null) ...[
                  PhoneField(phoneController: recipientPhoneController!),
                  const SizedBox(height: 16),
                ],

                // Remarks Field
                Container(
                  decoration: BoxDecoration(
                    color: isDark
                        ? const Color(0xFF1f2937)
                        : const Color(0xFFf6f7f8),
                    border: Border.all(
                      color: isDark
                          ? const Color(0xFF374151)
                          : const Color(0xFFe5e7eb),
                    ),
                    borderRadius: BorderRadius.circular(8),
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
                            ? const Color(0xFF9ca3af)
                            : const Color(0xFF6b7280),
                      ),
                    ),
                    style: TextStyle(
                      color: isDark
                          ? const Color(0xFFf9fafb)
                          : const Color(0xFF111827),
                    ),
                  ),
                ),

                // Date/Time Fields
                if (showDateTime) ...[
                  const SizedBox(height: 16),
                  isMediumScreen
                      ? Column(
                          children: [
                            DateField(
                              dateController: dateController,
                              onDateTap: onDateTap,
                            ),
                            const SizedBox(height: 16),
                            TimeField(
                              timeController: timeController,
                              onTimeTap: onTimeTap,
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Expanded(
                              child: DateField(
                                dateController: dateController,
                                onDateTap: onDateTap,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: TimeField(
                                timeController: timeController,
                                onTimeTap: onTimeTap,
                              ),
                            ),
                          ],
                        ),
                ] else ...[
                  const SizedBox(height: 16),
                  PreferredDateField(
                    preferredDateController: preferredDateController,
                    onPreferredDateTap: onPreferredDateTap,
                  ),
                ],
              ],
            ),
          ),

          // Map Preview
          GestureDetector(
            onTap: onMapTap,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              child: SizedBox(
                height: 200,
                child: selectedLocation != null
                    ? LocationCardPreview(
                        isDark: isDark,
                        isPickup: isPickup,
                        selectedLocation: selectedLocation!,
                      )
                    : Container(
                        color: isDark
                            ? const Color(0xFF374151)
                            : const Color(0xFFe5e7eb),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_location_alt,
                                size: 48,
                                color: isDark
                                    ? const Color(0xFF9ca3af)
                                    : const Color(0xFF6b7280),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Tap to select location',
                                style: TextStyle(
                                  color: isDark
                                      ? const Color(0xFF9ca3af)
                                      : const Color(0xFF6b7280),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
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
