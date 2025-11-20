// delivery_request_page.dart (updated)

import 'package:flutter/material.dart';
import 'package:throw_user/modules/delivery_request_module/providers/delivery_request_provider.dart';
import 'package:throw_user/modules/delivery_request_module/services/delivery_request_service.dart';
import 'package:throw_user/modules/delivery_request_module/widgets/location_section.dart';
import 'package:throw_user/modules/delivery_request_module/widgets/package_type_selection_widget.dart';
import 'package:throw_user/modules/delivery_request_module/widgets/time_selection_widget.dart';
import 'package:throw_user/modules/delivery_request_module/widgets/weight_and_urgency_section.dart';

class DeliveryRequestBody extends StatelessWidget {
  const DeliveryRequestBody({
    super.key,
    required this.formKey,
    required this.deliveryRequestService,
    required this.context,
    required this.provider,
  });

  final GlobalKey<FormState> formKey;
  final DeliveryRequestService deliveryRequestService;
  final BuildContext context;
  final DeliveryRequestProvider provider;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 375;
    final isMediumScreen = screenSize.width < 600;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Form(
      key: formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
        child: Column(
          children: [
            // Pickup Location
            LocationSection(
              title: 'Pickup Location',
              addressHint: 'Enter pickup address',
              remarksHint: 'Remarks (e.g. leave at front door)',
              showDateTime: true,
              selectedLocation: provider.pickupLocation,
              isPickup: true,
              addressController: provider.pickupAddressController,
              remarksController: provider.pickupRemarksController,
              dateController: provider.pickupDateController,
              timeController: provider.pickupTimeController,
              onMapTap: () =>
                  deliveryRequestService.selectLocation(true, provider),
              onDateTap: () =>
                  deliveryRequestService.selectPickupDate(provider),
              onTimeTap: () =>
                  deliveryRequestService.selectPickupTime(provider),
            ),

            SizedBox(height: isSmallScreen ? 16 : 24),

            // Drop-off Location
            LocationSection(
              title: 'Drop-off Location',
              addressHint: 'Enter drop-off address',
              remarksHint: 'Remarks (e.g. contact recipient before arrival)',
              showDateTime: false,
              selectedLocation: provider.dropOffLocation,
              isPickup: false,
              addressController: provider.dropOffAddressController,
              remarksController: provider.dropOffRemarksController,
              preferredDateController: provider.dropOffPreferredDateController,
              recipientPhoneController: provider.recipientPhoneController,
              onMapTap: () =>
                  deliveryRequestService.selectLocation(false, provider),
              onPreferredDateTap: () =>
                  deliveryRequestService.selectDropOffDate(provider),
              selectedTime: provider.selectedTime,
              onSelectingTime: (value) {
                provider.setSelectedTime(value);
              },
            ),

            SizedBox(height: isSmallScreen ? 16 : 24),

            // Package Details
            Column(
              children: [
                // Package Type Dropdown
                Container(
                  height: 56,
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF1f2937) : Colors.white,
                    border: Border.all(
                      color: isDark
                          ? const Color(0xFF374151)
                          : const Color(0xFFe5e7eb),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: PackageTypeSelectionWidget(
                    selectedPackageType: provider.selectedPackageType,
                    onSelectingPackageType: (value) {
                      provider.setSelectedPackageType(value);
                    },
                  ),
                ),

                SizedBox(height: isSmallScreen ? 12 : 16),

                // Weight and Urgency Row
                WeightAndUrgencySection(
                  isMediumScreen: isMediumScreen,
                  isSmallScreen: isSmallScreen,
                  isDark: isDark,
                  provider: provider,
                ),
              ],
            ),

            SizedBox(height: isSmallScreen ? 20 : 28),

            // Preferred Delivery Time
            TimeSelectionWidget(
              selectedTime: provider.selectedTime,
              onSelectingTime: (value) {
                provider.setSelectedTime(value);
              },
            ),

            SizedBox(height: isSmallScreen ? 24 : 32),

            // Create Request Button
            Container(
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFF2694ed),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF2694ed).withValues(alpha: 0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextButton(
                onPressed: () =>
                    deliveryRequestService.submitForm(provider, formKey),
                child: Text(
                  'Create Request',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            SizedBox(height: isSmallScreen ? 16 : 24),
          ],
        ),
      ),
    );
  }
}
