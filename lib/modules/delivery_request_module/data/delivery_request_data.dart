import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:throw_user/core/exports/enum_exports.dart';

class DeliveryRequestData {
  final double baseDeliveryCharge;
  final GeoPoint deliveryLocation;
  final String dropOffAddress;
  final DateTime dropOffDate;
  final String dropOffRemarks;
  final PackageType packageType;
  final double packageWeight;
  final String pickupAddress;
  final DateTime pickupDate;
  final TimeOfDay pickupTime;
  final GeoPoint pickupLocation;
  final String pickupRemarks;
  final String preferredDeliveryTime;
  final Urgency urgency;

  DeliveryRequestData({
    required this.baseDeliveryCharge,
    required this.deliveryLocation,
    required this.dropOffAddress,
    required this.dropOffDate,
    required this.dropOffRemarks,
    required this.packageType,
    required this.packageWeight,
    required this.pickupAddress,
    required this.pickupDate,
    required this.pickupLocation,
    required this.pickupRemarks,
    required this.pickupTime,
    required this.preferredDeliveryTime,
    required this.urgency,
  });
}
