// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:throw_user/modules/delivery_details_module/enums/delivery_status.dart';

class DeliveryDetailsHelper {
  final ValueNotifier<DeliveryStatus> deliveryStatus;
  final ValueNotifier<String?> otp;
  const DeliveryDetailsHelper({
    required this.deliveryStatus,
    required this.otp,
  });

  void generateOtp() {
    final random = Random();
    otp.value = (1000 + random.nextInt(9000))
        .toString(); // Generates 4-digit OTP
  }

  void startPickup() {
    deliveryStatus.value = DeliveryStatus.onTheWay;
    generateOtp();
  }
}
