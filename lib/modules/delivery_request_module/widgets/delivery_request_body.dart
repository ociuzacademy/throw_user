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

    const IconData dollarSymbol = Icons.attach_money;

    return SafeArea(
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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

              const SizedBox(height: 24),

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

              const SizedBox(height: 24),

              // Package Details Card
              Container(
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
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'Package Details',
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
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          AspectRatio(
                            aspectRatio: 16 / 9,
                            child: GestureDetector(
                              onTap: () => deliveryRequestService
                                  .selectItemImage(provider),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? AppColors.backgroundDark
                                      : AppColors.backgroundLight,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: isDark
                                        ? AppColors.borderDark
                                        : AppColors.borderLight,
                                    width: 2,
                                  ),
                                ),
                                child: provider.itemImage != null
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Image.file(
                                          provider.itemImage!,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                                  : AppColors
                                                        .textSecondaryLight,
                                            ),
                                          ),
                                        ],
                                      ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            decoration: BoxDecoration(
                              color: isDark
                                  ? AppColors.cardDark
                                  : AppColors.backgroundLight,
                              border: Border.all(
                                color: isDark
                                    ? AppColors.borderDark
                                    : AppColors.borderLight,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextFormField(
                              controller: provider.itemRemarksController,
                              maxLines: 3,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.all(16),
                                hintText:
                                    'Package description and special instructions...',
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
                              validator: provider.validateItemRemarks,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Additional Package Info
              Column(
                children: [
                  PackageTypeSelectionWidget(
                    selectedPackageType: provider.selectedPackageType,
                    onSelectingPackageType: (value) {
                      provider.setSelectedPackageType(value);
                    },
                    validator: provider.validatePackageType,
                  ),
                  const SizedBox(height: 16),
                  WeightAndUrgencySection(
                    isMediumScreen: isMediumScreen,
                    isSmallScreen: isSmallScreen,
                    isDark: isDark,
                    provider: provider,
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 56,
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.cardDark : Colors.white,
                      border: Border.all(
                        color: isDark
                            ? AppColors.borderDark
                            : AppColors.borderLight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
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
                          vertical: 10,
                        ),
                        hintText: 'Base Price',
                        prefixIcon: Icon(
                          dollarSymbol,
                          color: isDark
                              ? AppColors.textSecondaryDark
                              : AppColors.textSecondaryLight,
                          size: 20,
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

              const SizedBox(height: 24),

              // Preferred Delivery Time
              TimeSelectionWidget(
                selectedTime: provider.selectedTime,
                onSelectingTime: (value) {
                  provider.setSelectedTime(value);
                },
              ),

              const SizedBox(height: 32),

              // Create Request Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: onSubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 8,
                    shadowColor: AppColors.primary.withValues(alpha: 0.4),
                  ),
                  child: const Text(
                    'Create Request',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}
