// delivery_request_service.dart
import 'package:flutter/material.dart';
import 'package:throw_user/core/widgets/snackbars/custom_snackbar.dart';
import 'package:throw_user/modules/auction_module/view/auction_page.dart';
import 'package:throw_user/modules/delivery_request_module/providers/delivery_request_provider.dart';
import 'package:throw_user/modules/location_picker_module/view/location_picker_page.dart';

class DeliveryRequestService {
  final BuildContext context;

  DeliveryRequestService(this.context);

  Future<void> selectLocation(
    bool isPickup,
    DeliveryRequestProvider provider,
  ) async {
    final result = await LocationPickerPage.navigate(
      context,
      title: isPickup ? 'Select Pickup Location' : 'Select Drop-off Location',
      isPickup: isPickup,
      initialLocation: isPickup
          ? provider.pickupLocation
          : provider.dropOffLocation,
    );

    if (result != null && context.mounted) {
      if (isPickup) {
        provider.setPickupLocation(result);
      } else {
        provider.setDropOffLocation(result);
      }
    }
  }

  Future<void> selectPickupDate(DeliveryRequestProvider provider) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: provider.pickUpDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked != null) {
      provider.setPickUpDate(picked);
    }
  }

  Future<void> selectPickupTime(DeliveryRequestProvider provider) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: provider.pickUpTime ?? TimeOfDay.now(),
    );

    if (picked != null) {
      provider.setPickUpTime(picked);
    }
  }

  Future<void> selectDropOffDate(DeliveryRequestProvider provider) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: provider.dropOffDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked != null) {
      provider.setDropOffDate(picked);
    }
  }

  void submitForm(
    DeliveryRequestProvider provider,
    GlobalKey<FormState> formKey,
  ) {
    FocusScope.of(context).unfocus();

    if (provider.validateForm(formKey)) {
      if (provider.areLocationsSelected) {
        // Form is valid and locations are selected, proceed with submission
        _logFormData(provider);

        CustomSnackbar.showSuccess(
          context: context,
          message: 'Delivery request created successfully!',
        );
        Navigator.push(context, AuctionPage.route());
      } else {
        CustomSnackbar.showError(
          context: context,
          message: 'Please select both pickup and drop-off locations',
        );
      }
    } else {
      CustomSnackbar.showError(
        context: context,
        message: 'Please fill in all required fields correctly',
      );
    }
  }

  void _logFormData(DeliveryRequestProvider provider) {
    debugPrint(
      'Pickup Address: ${provider.pickupAddressController.text.trim()}',
    );
    debugPrint(
      'Pickup Remarks: ${provider.pickupRemarksController.text.trim()}',
    );
    debugPrint('Pickup Date: ${provider.pickupDateController.text.trim()}');
    debugPrint('Pickup Time: ${provider.pickupTimeController.text.trim()}');
    debugPrint('Pickup Location: ${provider.pickupLocation}');
    debugPrint(
      'Drop-off Address: ${provider.dropOffAddressController.text.trim()}',
    );
    debugPrint(
      'Drop-off Remarks: ${provider.dropOffRemarksController.text.trim()}',
    );
    debugPrint(
      'Drop-off Preferred Date: ${provider.dropOffPreferredDateController.text.trim()}',
    );
    debugPrint('Drop-off Location: ${provider.dropOffLocation}');
    debugPrint(
      'Recipient Phone Number: ${provider.recipientPhoneController.text.trim()}',
    );
    debugPrint('Preferred Drop-off Time: ${provider.selectedTime}');
    debugPrint('Weight: ${provider.weightController.text}');
    debugPrint('Package Type: ${provider.selectedPackageType}');
    debugPrint('Urgency: ${provider.selectedUrgency}');
  }
}
