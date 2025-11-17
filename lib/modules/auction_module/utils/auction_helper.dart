// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:throw_user/core/widgets/snackbars/custom_snackbar.dart';
import 'package:throw_user/modules/auction_expired_module/view/auction_expired_page.dart';

import 'package:throw_user/core/models/bid.dart';
import 'package:throw_user/modules/payment_module/view/payment_page.dart';

class AuctionHelper {
  final BuildContext context;
  // Timer variables
  Timer? timer;
  // 3 minutes in seconds
  final ValueNotifier<List<Bid>> bids;
  final ValueNotifier<int> remainingSeconds;
  final ValueNotifier<bool> isTimerActive;

  AuctionHelper({
    required this.context,
    this.timer,
    required this.bids,
    required this.remainingSeconds,
    required this.isTimerActive,
  });

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds.value > 0) {
        remainingSeconds.value--;
      } else {
        isTimerActive.value = false;
        timer.cancel();
        _showAuctionEndedSnackbar();
      }
    });
  }

  void cancelTimer() {
    timer?.cancel();
  }

  void _showAuctionEndedSnackbar() {
    if (context.mounted) {
      CustomSnackbar.showError(
        context: context,
        message: 'Auction has ended!',
        onActionPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          Navigator.push(context, AuctionExpiredPage.route());
        },
      );
    }
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
