// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:throw_user/core/exports/bloc_exports.dart';
import 'package:throw_user/core/widgets/snackbars/custom_snackbar.dart';

import 'package:throw_user/core/models/bid_model.dart';
import 'package:throw_user/core/repository/delivery_request_repository.dart';

class AuctionHelper {
  final BuildContext context;
  final String requestId;
  // Timer variables
  Timer? timer;
  // 3 minutes in seconds
  final ValueNotifier<int> remainingSeconds;
  final ValueNotifier<bool> isTimerActive;

  AuctionHelper({
    required this.context,
    required this.requestId,
    this.timer,
    required this.remainingSeconds,
    required this.isTimerActive,
  });

  void reset() {
    final DeliveryRequestBloc bloc = context.read<DeliveryRequestBloc>();
    bloc.add(const DeliveryRequestEvent.reset());
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds.value > 0) {
        remainingSeconds.value--;
      } else {
        isTimerActive.value = false;
        timer.cancel();
        _cancelDeliveryRequest();
      }
    });
  }

  void cancelTimer() {
    timer?.cancel();
  }

  void _cancelDeliveryRequest() {
    final DeliveryRequestBloc bloc = context.read<DeliveryRequestBloc>();
    bloc.add(DeliveryRequestEvent.cancelRequest(requestId));
  }

  // Update a bid (bargain) via repository
  void updateBid(BidModel bid) {
    context.read<DeliveryRequestRepository>().bargain(
      requestId,
      bid.bidId,
      bid.bargainAmount ?? 0,
    );
  }

  // Handle bid acceptance and stop timer
  void acceptBid(BidModel bid) {
    isTimerActive.value = false;
    cancelTimer();

    context.read<DeliveryRequestRepository>().acceptRequest(
      requestId,
      bid.agentId,
      bid.bidAmount,
    );

    CustomSnackbar.showSuccess(
      context: context,
      message: 'Bid accepted successfully!',
    );

    // Navigator.push(context, PaymentPage.route(bid: bid)); // Wait, PaymentPage.route might still use Bid
  }
}
