// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

import 'package:throw_user/core/widgets/snackbars/custom_snackbar.dart';
import 'package:throw_user/modules/auction_module/view/auction_page.dart';
import 'package:throw_user/modules/location_picker_module/view/location_picker_page.dart';

class DeliveryRequestHelper {
  final BuildContext context;
  // Selected locations
  final ValueNotifier<GeoPoint?> pickupLocation;
  final ValueNotifier<GeoPoint?> dropOffLocation;
  // Form key for validation
  final GlobalKey<FormState> formKey;

  // Text editing controllers
  final TextEditingController pickupAddressController;
  final TextEditingController pickupRemarksController;
  final TextEditingController pickupDateController;
  final TextEditingController pickupTimeController;
  final TextEditingController recipientPhoneController;

  final TextEditingController dropOffAddressController;
  final TextEditingController dropOffRemarksController;
  final TextEditingController dropOffPreferredDateController;
  final TextEditingController weightController;

  // Value notifiers
  final ValueNotifier<DateTime?> pickUpDate;
  final ValueNotifier<TimeOfDay?> pickUpTime;
  final ValueNotifier<DateTime?> dropOffDate;
  final ValueNotifier<String?> selectedPackageType;
  final ValueNotifier<String?> selectedUrgency;
  final ValueNotifier<String> selectedTime;

  const DeliveryRequestHelper({
    required this.context,
    required this.pickupLocation,
    required this.dropOffLocation,
    required this.formKey,
    required this.pickupAddressController,
    required this.pickupRemarksController,
    required this.pickupDateController,
    required this.pickupTimeController,
    required this.recipientPhoneController,
    required this.dropOffAddressController,
    required this.dropOffRemarksController,
    required this.dropOffPreferredDateController,
    required this.weightController,
    required this.pickUpDate,
    required this.pickUpTime,
    required this.dropOffDate,
    required this.selectedPackageType,
    required this.selectedUrgency,
    required this.selectedTime,
  });

  Future<void> selectLocation(bool isPickup) async {
    final result = await LocationPickerPage.navigate(
      context,
      title: isPickup ? 'Select Pickup Location' : 'Select Drop-off Location',
      isPickup: isPickup,
      initialLocation: isPickup ? pickupLocation.value : dropOffLocation.value,
    );

    if (result != null && context.mounted) {
      if (isPickup) {
        pickupLocation.value = result;
      } else {
        dropOffLocation.value = result;
      }
    }
  }

  // Date and time picker methods
  Future<void> selectPickupDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: pickUpDate.value ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked != null) {
      pickUpDate.value = picked;
      pickupDateController.text = _formatDate(picked);
    }
  }

  Future<void> selectPickupTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: pickUpTime.value ?? TimeOfDay.now(),
    );

    if (picked != null) {
      pickUpTime.value = picked;
      pickupTimeController.text = _formatTime(picked);
    }
  }

  Future<void> selectDropOffDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dropOffDate.value ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked != null) {
      dropOffDate.value = picked;
      dropOffPreferredDateController.text = _formatDate(picked);
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  String _formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  // Form submission method
  void submitForm() {
    FocusScope.of(context).unfocus();
    if (formKey.currentState!.validate()) {
      // Form is valid, proceed with creating the request
      if (pickupLocation.value != null && dropOffLocation.value != null) {
        debugPrint('Pickup Address: ${pickupAddressController.text.trim()}');
        debugPrint('Pickup Remarks: ${pickupRemarksController.text.trim()}');
        debugPrint('Pickup Date: ${pickupDateController.text.trim()}');
        debugPrint('Pickup Time: ${pickupTimeController.text.trim()}');
        debugPrint('Pickup Location: ${pickupLocation.value}');
        debugPrint('Drop-off Address: ${dropOffAddressController.text.trim()}');
        debugPrint('Drop-off Remarks: ${dropOffRemarksController.text.trim()}');
        debugPrint(
          'Drop-off Preferred Date: ${dropOffPreferredDateController.text.trim()}',
        );
        debugPrint('Drop-off Location: ${dropOffLocation.value}');
        debugPrint(
          'Recipient Phone Number: ${recipientPhoneController.text.trim()}',
        );
        debugPrint('Preferred Drop-off Time: ${selectedTime.value}');
        debugPrint('Weight: ${weightController.text}');
        debugPrint('Package Type: ${selectedPackageType.value}');
        debugPrint('Urgency: ${selectedUrgency.value}');

        CustomSnackbar.showSuccess(
          context: context,
          message: 'Delivery request created successfully!',
        );
        Navigator.push(context, AuctionPage.route());
      } else {
        // Show error message for locations
        CustomSnackbar.showError(
          context: context,
          message: 'Please select both pickup and drop-off locations',
        );
      }
    } else {
      // Form is invalid
      CustomSnackbar.showError(
        context: context,
        message: 'Please fill in all required fields correctly',
      );
    }
  }
}
