// delivery_request_provider.dart
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class DeliveryRequestProvider extends ChangeNotifier {
  // Selected locations
  GeoPoint? _pickupLocation;
  GeoPoint? _dropOffLocation;

  // Form state
  DateTime? _pickUpDate;
  TimeOfDay? _pickUpTime;
  DateTime? _dropOffDate;
  String? _selectedPackageType;
  String? _selectedUrgency;
  String _selectedTime = 'Afternoon';

  // Text editing controllers
  final TextEditingController pickupAddressController = TextEditingController();
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

  // Getters
  GeoPoint? get pickupLocation => _pickupLocation;
  GeoPoint? get dropOffLocation => _dropOffLocation;
  DateTime? get pickUpDate => _pickUpDate;
  TimeOfDay? get pickUpTime => _pickUpTime;
  DateTime? get dropOffDate => _dropOffDate;
  String? get selectedPackageType => _selectedPackageType;
  String? get selectedUrgency => _selectedUrgency;
  String get selectedTime => _selectedTime;

  // Setters
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

  void setSelectedPackageType(String? type) {
    _selectedPackageType = type;
    notifyListeners();
  }

  void setSelectedUrgency(String? urgency) {
    _selectedUrgency = urgency;
    notifyListeners();
  }

  void setSelectedTime(String time) {
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
    _selectedTime = 'Afternoon';

    pickupAddressController.clear();
    pickupRemarksController.clear();
    pickupDateController.clear();
    pickupTimeController.clear();
    dropOffAddressController.clear();
    dropOffRemarksController.clear();
    dropOffPreferredDateController.clear();
    weightController.clear();
    recipientPhoneController.clear();

    notifyListeners();
  }

  @override
  void dispose() {
    pickupAddressController.dispose();
    pickupRemarksController.dispose();
    pickupDateController.dispose();
    pickupTimeController.dispose();
    dropOffAddressController.dispose();
    dropOffRemarksController.dispose();
    dropOffPreferredDateController.dispose();
    weightController.dispose();
    recipientPhoneController.dispose();
    super.dispose();
  }
}
