// delivery_request_service.dart
import 'package:flutter/material.dart';
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
}
