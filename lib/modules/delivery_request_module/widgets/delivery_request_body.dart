// delivery_request_page.dart (updated)

import 'package:flutter/material.dart';
import 'package:throw_user/core/constants/app_colors.dart';
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
    required this.provider,
    required this.onSubmit,
  });

  final GlobalKey<FormState> formKey;
  final DeliveryRequestService deliveryRequestService;
  final DeliveryRequestProvider provider;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 375;
    final isMediumScreen = screenSize.width < 600;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    const IconData rupeeSymbol = IconData(0x20B9, fontFamily: 'MaterialIcons');

    return SafeArea(
      child: Form(
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
                phoneController: provider.pickupPhoneController,
                remarksController: provider.pickupRemarksController,
                dateController: provider.pickupDateController,
                timeController: provider.pickupTimeController,
                addressValidator: provider.validateAddress,
                remarksValidator: provider.validateRemarks,
                dateValidator: provider.validateDate,
                timeValidator: provider.validateTime,
                phoneValidator: provider.validatePhone,
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
                preferredDateController:
                    provider.dropOffPreferredDateController,
                recipientPhoneController: provider.recipientPhoneController,
                addressValidator: provider.validateAddress,
                remarksValidator: provider.validateRemarks,
                dateValidator: provider.validateDate,
                phoneValidator: provider.validatePhone,
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
                  PackageTypeSelectionWidget(
                    selectedPackageType: provider.selectedPackageType,
                    onSelectingPackageType: (value) {
                      provider.setSelectedPackageType(value);
                    },
                    validator: provider.validatePackageType,
                  ),

                  SizedBox(height: isSmallScreen ? 12 : 16),

                  // Weight and Urgency Row
                  WeightAndUrgencySection(
                    isMediumScreen: isMediumScreen,
                    isSmallScreen: isSmallScreen,
                    isDark: isDark,
                    provider: provider,
                  ),

                  SizedBox(height: isSmallScreen ? 12 : 16),

                  // Base Price Field
                  Container(
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.cardDark : Colors.white,
                      border: Border.all(
                        color: isDark
                            ? AppColors.borderDark
                            : AppColors.borderLight,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextFormField(
                      controller: provider.basePriceController,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 18,
                        ),
                        hintText: 'Base Price',
                        hintStyle: TextStyle(
                          color: isDark
                              ? AppColors.textSecondaryDark
                              : AppColors.textSecondaryLight,
                        ),
                        prefixIcon: Icon(
                          rupeeSymbol,
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
                      validator: provider.validateBasePrice,
                    ),
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
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextButton(
                  onPressed: onSubmit,
                  child: const Text(
                    'Create Request',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
