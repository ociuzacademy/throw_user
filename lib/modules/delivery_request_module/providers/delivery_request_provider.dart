// delivery_request_provider.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:throw_user/core/exports/enum_exports.dart';
import 'package:throw_user/modules/delivery_request_module/data/delivery_request_data.dart';

class DeliveryRequestProvider extends ChangeNotifier {
  // Item image
  File? _itemImage;

  // Selected locations
  GeoPoint? _pickupLocation;
  GeoPoint? _dropOffLocation;

  // Form state
  DateTime? _pickUpDate;
  TimeOfDay? _pickUpTime;
  DateTime? _dropOffDate;
  PackageType? _selectedPackageType;
  Urgency? _selectedUrgency;
  PreferedDeliveryTime _selectedTime = PreferedDeliveryTime.afternoon;

  // Text editing controllers
  final TextEditingController pickupAddressController = TextEditingController();
  final TextEditingController pickupPhoneController = TextEditingController();
  final TextEditingController pickupRemarksController = TextEditingController();
  final TextEditingController pickupDateController = TextEditingController();
  final TextEditingController pickupTimeController = TextEditingController();
  final TextEditingController dropOffAddressController =
      TextEditingController();
  final TextEditingController dropOffRemarksController =
      TextEditingController();
  final TextEditingController dropOffPreferredDateController =
      TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController recipientPhoneController =
      TextEditingController();
  final TextEditingController basePriceController = TextEditingController();
  final TextEditingController itemRemarksController = TextEditingController();

  // Getters
  File? get itemImage => _itemImage;
  GeoPoint? get pickupLocation => _pickupLocation;
  GeoPoint? get dropOffLocation => _dropOffLocation;
  DateTime? get pickUpDate => _pickUpDate;
  TimeOfDay? get pickUpTime => _pickUpTime;
  DateTime? get dropOffDate => _dropOffDate;
  PackageType? get selectedPackageType => _selectedPackageType;
  Urgency? get selectedUrgency => _selectedUrgency;
  PreferedDeliveryTime get selectedTime => _selectedTime;

  // Setters
  void setItemImage(File? image) {
    _itemImage = image;
    notifyListeners();
  }

  void setPickupLocation(GeoPoint? location) {
    _pickupLocation = location;
    notifyListeners();
  }

  void setDropOffLocation(GeoPoint? location) {
    _dropOffLocation = location;
    notifyListeners();
  }

  void setPickUpDate(DateTime? date) {
    _pickUpDate = date;
    if (date != null) {
      pickupDateController.text = _formatDate(date);
    }
    notifyListeners();
  }

  void setPickUpTime(TimeOfDay? time) {
    _pickUpTime = time;
    if (time != null) {
      pickupTimeController.text = _formatTime(time);
    }
    notifyListeners();
  }

  void setDropOffDate(DateTime? date) {
    _dropOffDate = date;
    if (date != null) {
      dropOffPreferredDateController.text = _formatDate(date);
    }
    notifyListeners();
  }

  void setSelectedPackageType(PackageType? type) {
    _selectedPackageType = type;
    notifyListeners();
  }

  void setSelectedUrgency(Urgency? urgency) {
    _selectedUrgency = urgency;
    notifyListeners();
  }

  void setSelectedTime(PreferedDeliveryTime time) {
    _selectedTime = time;
    notifyListeners();
  }

  // Helper methods
  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  String _formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  // Validation method
  bool validateForm(GlobalKey<FormState> formKey) {
    return formKey.currentState?.validate() ?? false;
  }

  // Validators (return null when valid, or error string when invalid)
  String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select date';
    }
    return null;
  }

  String? validateTime(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select time';
    }
    return null;
  }

  String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter address';
    }
    return null;
  }

  String? validatePackageType(PackageType? value) {
    if (value == null) {
      return 'Please select a package type';
    }
    return null;
  }

  String? validateUrgency(Urgency? value) {
    if (value == null) {
      return 'Please select urgency';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter phone number';
    }
    return null;
  }

  String? validateWeight(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter weight';
    }
    final weight = double.tryParse(value);
    if (weight == null || weight <= 0) {
      return 'Please enter a valid weight';
    }
    return null;
  }

  String? validateBasePrice(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter base price';
    }
    final price = double.tryParse(value);
    if (price == null || price < 0) {
      return 'Please enter a valid price';
    }
    return null;
  }

  // Remarks are optional — always valid (can be null or empty)
  String? validateRemarks(String? value) {
    return null;
  }

  String? validateItemRemarks(String? value) {
    return null;
  }

  DeliveryRequestData? getDeliveryRequestData(GlobalKey<FormState> formKey) {
    if (!validateForm(formKey)) {
      return null;
    }

    if (!areLocationsSelected) {
      return null;
    }

    if (itemImage == null) {
      return null;
    }

    return DeliveryRequestData(
      baseDeliveryCharge: double.parse(basePriceController.text.trim()),
      deliveryLocation: dropOffLocation!,
      dropOffAddress: dropOffAddressController.text.trim(),
      dropOffDate: dropOffDate!,
      dropOffRemarks: dropOffRemarksController.text.trim(),
      dropOffPhone: recipientPhoneController.text.trim(),
      itemImage: itemImage!,
      itemRemarks: itemRemarksController.text.trim(),
      packageType: selectedPackageType!,
      packageWeight: double.parse(weightController.text.trim()),
      pickupAddress: pickupAddressController.text.trim(),
      pickupDate: pickUpDate!,
      pickupLocation: pickupLocation!,
      pickupRemarks: pickupRemarksController.text.trim(),
      pickupPhone: pickupPhoneController.text.trim(),
      pickupTime: pickUpTime!,
      preferredDeliveryTime: selectedTime,
      urgency: selectedUrgency!,
    );
  }

  // Check if locations are selected
  bool get areLocationsSelected {
    return _pickupLocation != null && _dropOffLocation != null;
  }

  // Clear all data
  void clearAll() {
    _pickupLocation = null;
    _dropOffLocation = null;
    _pickUpDate = null;
    _pickUpTime = null;
    _dropOffDate = null;
    _selectedPackageType = null;
    _selectedUrgency = null;
    _selectedTime = PreferedDeliveryTime.afternoon;

    pickupAddressController.clear();
    pickupPhoneController.clear();
    pickupRemarksController.clear();
    pickupDateController.clear();
    pickupTimeController.clear();
    dropOffAddressController.clear();
    dropOffRemarksController.clear();
    dropOffPreferredDateController.clear();
    weightController.clear();
    recipientPhoneController.clear();
    basePriceController.clear();

    notifyListeners();
  }

  @override
  void dispose() {
    pickupAddressController.dispose();
    pickupPhoneController.dispose();
    pickupRemarksController.dispose();
    pickupDateController.dispose();
    pickupTimeController.dispose();
    dropOffAddressController.dispose();
    dropOffRemarksController.dispose();
    dropOffPreferredDateController.dispose();
    weightController.dispose();
    recipientPhoneController.dispose();
    basePriceController.dispose();
    super.dispose();
  }
}
