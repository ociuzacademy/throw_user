// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:throw_user/core/exports/bloc_exports.dart';
import 'package:throw_user/core/widgets/snackbars/custom_snackbar.dart';

import 'package:throw_user/core/models/bid.dart';
import 'package:throw_user/modules/payment_module/view/payment_page.dart';

class AuctionHelper {
  final BuildContext context;
  final String requestId;
  // Timer variables
  Timer? timer;
  // 3 minutes in seconds
  final ValueNotifier<List<Bid>> bids;
  final ValueNotifier<int> remainingSeconds;
  final ValueNotifier<bool> isTimerActive;

  AuctionHelper({
    required this.context,
    required this.requestId,
    this.timer,
    required this.bids,
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

  // Update a bid by replacing it in the list and notifying listeners
  void updateBid(Bid updatedBid) {
    final current = List<Bid>.from(bids.value);
    final index = current.indexWhere((bid) => bid.name == updatedBid.name);
    if (index != -1) {
      current[index] = updatedBid;
      bids.value = current;
    }
  }

  // Handle bid acceptance and stop timer
  void acceptBid(Bid bid) {
    isTimerActive.value = false;
    cancelTimer();
    CustomSnackbar.showSuccess(
      context: context,
      message: 'Bid accepted successfully!',
    );

    Navigator.push(context, PaymentPage.route(bid: bid));
  }
}
