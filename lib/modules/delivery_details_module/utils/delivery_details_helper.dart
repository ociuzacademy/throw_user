// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:throw_user/core/exports/bloc_exports.dart';

class DeliveryDetailsHelper {
  final BuildContext context;
  final String deliveryRequestId;
  const DeliveryDetailsHelper({
    required this.context,
    required this.deliveryRequestId,
  });

  void deliveryRequestDetailsInit() {
    final DeliveryRequestDetailsCubit cubit = context
        .read<DeliveryRequestDetailsCubit>();
    cubit.getDeliveryRequestDetails(deliveryRequestId);
  }

  String generateOtp() {
    final random = Random();
    return (1000 + random.nextInt(9000)).toString(); // Generates 4-digit OTP
  }

  void startPickup() {
    // deliveryStatus.value = DeliveryStatus.onTheWay;
    generateOtp();
  }
}
