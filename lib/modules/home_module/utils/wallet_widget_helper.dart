import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:throw_user/core/exports/bloc_exports.dart';
import 'package:throw_user/core/exports/enum_exports.dart';
import 'package:throw_user/core/models/delivery_request_model.dart';

class WalletWidgetHelper {
  final BuildContext context;

  const WalletWidgetHelper({required this.context});

  void getUserDeliveryRequests() {
    final UserDeliveryRequestsCubit cubit = context
        .read<UserDeliveryRequestsCubit>();
    cubit.getUserDeliveryRequests();
  }

  static double calculateBalance(List<DeliveryRequestModel> deliveryRequests) {
    double balance = 0.0;
    for (var request in deliveryRequests) {
      if (request.paymentStatus == PaymentStatus.escrowAmountPaid) {
        balance += request.agreedDeliveryCharge ?? 0.0;
      }
    }
    return balance;
  }
}
