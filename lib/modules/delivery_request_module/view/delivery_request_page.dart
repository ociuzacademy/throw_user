// delivery_request_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:throw_user/modules/delivery_request_module/utils/delivery_request_helper.dart';
import 'package:throw_user/modules/delivery_request_module/widgets/location_section.dart';
import 'package:throw_user/modules/delivery_request_module/widgets/package_type_selection_widget.dart';
import 'package:throw_user/modules/delivery_request_module/widgets/urgency_dropdown.dart';
import 'package:throw_user/modules/delivery_request_module/widgets/time_selection_widget.dart';

class DeliveryRequestPage extends StatefulWidget {
  const DeliveryRequestPage({super.key});

  @override
  State<DeliveryRequestPage> createState() => _DeliveryRequestPageState();

  static Route route() =>
      MaterialPageRoute(builder: (context) => const DeliveryRequestPage());
}

class _DeliveryRequestPageState extends State<DeliveryRequestPage> {
  late final DeliveryRequestHelper _deliveryRequestHelper;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Text editing controllers
  final TextEditingController _pickupAddressController =
      TextEditingController();
  final TextEditingController _pickupRemarksController =
      TextEditingController();
  final TextEditingController _pickupDateController = TextEditingController();
  final TextEditingController _pickupTimeController = TextEditingController();
  final TextEditingController _dropOffAddressController =
      TextEditingController();
  final TextEditingController _dropOffRemarksController =
      TextEditingController();
  final TextEditingController _dropOffPreferredDateController =
      TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _recipientPhoneController =
      TextEditingController();

  // Value notifiers
  final ValueNotifier<DateTime?> _pickUpDate = ValueNotifier<DateTime?>(null);
  final ValueNotifier<TimeOfDay?> _pickUpTime = ValueNotifier<TimeOfDay?>(null);
  final ValueNotifier<DateTime?> _dropOffDate = ValueNotifier<DateTime?>(null);
  final ValueNotifier<String?> _selectedPackageType = ValueNotifier<String?>(
    null,
  );
  final ValueNotifier<String?> _selectedUrgency = ValueNotifier<String?>(null);
  final ValueNotifier<String> _selectedTime = ValueNotifier<String>(
    'Afternoon',
  );
  final ValueNotifier<GeoPoint?> _pickupLocation = ValueNotifier<GeoPoint?>(
    null,
  );
  final ValueNotifier<GeoPoint?> _dropOffLocation = ValueNotifier<GeoPoint?>(
    null,
  );

  @override
  void initState() {
    super.initState();
    _deliveryRequestHelper = DeliveryRequestHelper(
      context: context,
      pickupLocation: _pickupLocation,
      dropOffLocation: _dropOffLocation,
      formKey: _formKey,
      pickupAddressController: _pickupAddressController,
      pickupRemarksController: _pickupRemarksController,
      pickupDateController: _pickupDateController,
      pickupTimeController: _pickupTimeController,
      dropOffAddressController: _dropOffAddressController,
      dropOffRemarksController: _dropOffRemarksController,
      dropOffPreferredDateController: _dropOffPreferredDateController,
      weightController: _weightController,
      recipientPhoneController: _recipientPhoneController,
      pickUpDate: _pickUpDate,
      pickUpTime: _pickUpTime,
      dropOffDate: _dropOffDate,
      selectedPackageType: _selectedPackageType,
      selectedUrgency: _selectedUrgency,
      selectedTime: _selectedTime,
    );
  }

  @override
  void dispose() {
    _pickupAddressController.dispose();
    _pickupRemarksController.dispose();
    _pickupDateController.dispose();
    _pickupTimeController.dispose();
    _dropOffAddressController.dispose();
    _dropOffRemarksController.dispose();
    _dropOffPreferredDateController.dispose();
    _weightController.dispose();
    _recipientPhoneController.dispose();
    _pickUpDate.dispose();
    _pickUpTime.dispose();
    _dropOffDate.dispose();
    _selectedPackageType.dispose();
    _selectedUrgency.dispose();
    _selectedTime.dispose();
    _pickupLocation.dispose();
    _dropOffLocation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 375;
    final isMediumScreen = screenSize.width < 600;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF101a22)
          : const Color(0xFFf6f7f8),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Create Delivery Request',
          style: TextStyle(
            color: Colors.white,
            fontSize: isSmallScreen ? 18 : 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF2694ed),
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
          child: Column(
            children: [
              // Pickup Location
              ValueListenableBuilder<GeoPoint?>(
                valueListenable: _pickupLocation,
                builder: (context, pickup, _) {
                  return LocationSection(
                    title: 'Pickup Location',
                    addressHint: 'Enter pickup address',
                    remarksHint: 'Remarks (e.g. leave at front door)',
                    showDateTime: true,
                    selectedLocation: pickup,
                    isPickup: true,
                    addressController: _pickupAddressController,
                    remarksController: _pickupRemarksController,
                    dateController: _pickupDateController,
                    timeController: _pickupTimeController,
                    onMapTap: () => _deliveryRequestHelper.selectLocation(true),
                    onDateTap: () => _deliveryRequestHelper.selectPickupDate(),
                    onTimeTap: () => _deliveryRequestHelper.selectPickupTime(),
                  );
                },
              ),

              SizedBox(height: isSmallScreen ? 16 : 24),

              // Drop-off Location
              ValueListenableBuilder<GeoPoint?>(
                valueListenable: _dropOffLocation,
                builder: (context, dropOff, _) {
                  return LocationSection(
                    title: 'Drop-off Location',
                    addressHint: 'Enter drop-off address',
                    remarksHint:
                        'Remarks (e.g. contact recipient before arrival)',
                    showDateTime: false,
                    selectedLocation: dropOff,
                    isPickup: false,
                    addressController: _dropOffAddressController,
                    remarksController: _dropOffRemarksController,
                    preferredDateController: _dropOffPreferredDateController,
                    recipientPhoneController: _recipientPhoneController,
                    onMapTap: () =>
                        _deliveryRequestHelper.selectLocation(false),
                    onPreferredDateTap: () =>
                        _deliveryRequestHelper.selectDropOffDate(),
                    selectedTime: _selectedTime.value,
                    onSelectingTime: (value) {
                      _selectedTime.value = value;
                    },
                  );
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
                    child: ValueListenableBuilder<String?>(
                      valueListenable: _selectedPackageType,
                      builder: (context, packageType, _) {
                        return PackageTypeSelectionWidget(
                          selectedPackageType: packageType,
                          onSelectingPackageType: (value) {
                            _selectedPackageType.value = value;
                          },
                        );
                      },
                    ),
                  ),

                  SizedBox(height: isSmallScreen ? 12 : 16),

                  // Weight and Urgency Row
                  isMediumScreen
                      ? Column(
                          children: [
                            // Weight Field
                            Container(
                              height: 56,
                              decoration: BoxDecoration(
                                color: isDark
                                    ? const Color(0xFF1f2937)
                                    : Colors.white,
                                border: Border.all(
                                  color: isDark
                                      ? const Color(0xFF374151)
                                      : const Color(0xFFe5e7eb),
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: TextFormField(
                                controller: _weightController,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                  color: isDark ? Colors.white : Colors.black,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  hintText: 'Weight (kg)',
                                  hintStyle: TextStyle(
                                    color: isDark
                                        ? const Color(0xFF9ca3af)
                                        : const Color(0xFF6b7280),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter weight';
                                  }
                                  final weight = double.tryParse(value);
                                  if (weight == null || weight <= 0) {
                                    return 'Please enter a valid weight';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(height: isSmallScreen ? 12 : 16),
                            // Urgency Dropdown
                            Container(
                              height: 56,
                              decoration: BoxDecoration(
                                color: isDark
                                    ? const Color(0xFF1f2937)
                                    : Colors.white,
                                border: Border.all(
                                  color: isDark
                                      ? const Color(0xFF374151)
                                      : const Color(0xFFe5e7eb),
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ValueListenableBuilder<String?>(
                                valueListenable: _selectedUrgency,
                                builder: (context, urgency, _) {
                                  return UrgencyDropdown(
                                    selectedUrgency: urgency,
                                    onSelectingUrgency: (value) {
                                      _selectedUrgency.value = value;
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 56,
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? const Color(0xFF1f2937)
                                      : Colors.white,
                                  border: Border.all(
                                    color: isDark
                                        ? const Color(0xFF374151)
                                        : const Color(0xFFe5e7eb),
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: TextFormField(
                                  controller: _weightController,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(
                                    color: isDark ? Colors.white : Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    hintText: 'Weight (kg)',
                                    hintStyle: TextStyle(
                                      color: isDark
                                          ? const Color(0xFF9ca3af)
                                          : const Color(0xFF6b7280),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter weight';
                                    }
                                    final weight = double.tryParse(value);
                                    if (weight == null || weight <= 0) {
                                      return 'Please enter a valid weight';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            SizedBox(width: isSmallScreen ? 12 : 16),
                            Expanded(
                              child: Container(
                                height: 56,
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? const Color(0xFF1f2937)
                                      : Colors.white,
                                  border: Border.all(
                                    color: isDark
                                        ? const Color(0xFF374151)
                                        : const Color(0xFFe5e7eb),
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: ValueListenableBuilder<String?>(
                                  valueListenable: _selectedUrgency,
                                  builder: (context, urgency, _) {
                                    return UrgencyDropdown(
                                      selectedUrgency: urgency,
                                      onSelectingUrgency: (value) {
                                        _selectedUrgency.value = value;
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                ],
              ),

              SizedBox(height: isSmallScreen ? 20 : 28),

              // Preferred Delivery Time
              ValueListenableBuilder(
                valueListenable: _selectedTime,
                builder: (context, selectedTime, child) {
                  return TimeSelectionWidget(
                    selectedTime: selectedTime,
                    onSelectingTime: (value) {
                      _selectedTime.value = value;
                    },
                  );
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
                  onPressed: _deliveryRequestHelper.submitForm,
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
      ),
    );
  }
}
