// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:throw_user/core/models/bid.dart';
import 'package:throw_user/core/widgets/alert_dialogs/custom_alert_dialog.dart';
import 'package:throw_user/core/widgets/snackbars/custom_snackbar.dart';
import 'package:throw_user/modules/auction_module/typedefs/bid_action.dart';
import 'package:throw_user/modules/auction_module/widgets/bargain_bottom_sheet.dart';

class BidCardHelper {
  final BuildContext context;
  final Bid bid;
  final TextTheme textTheme;
  final BidAction onBidUpdated; // Callback for bid updates
  final BidAction onBidAccepted; // Callback for when bid is accepted

  const BidCardHelper({
    required this.context,
    required this.bid,
    required this.textTheme,
    required this.onBidUpdated,
    required this.onBidAccepted, // Make sure this parameter is included
  });

  void showBargainBottomSheet() {
    final TextEditingController bargainController = TextEditingController();

    // Pre-fill with current price if no bargain exists, or with bargained price if it does
    bargainController.text =
        bid.bargainedPrice?.toStringAsFixed(2) ?? bid.price.toStringAsFixed(2);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return BargainBottomSheet(
          context: context,
          bid: bid,
          textTheme: textTheme,
          submitBargain: submitBargain,
        );
      },
    );
  }

  void submitBargain(double bargainAmount) {
    // Update the bid with new bargained price
    final updatedBid = bid.copyWith(bargainedPrice: bargainAmount);
    onBidUpdated(updatedBid);

    CustomSnackbar.showSuccess(
      context: context,
      message:
          'Bargain of \u20B9${bargainAmount.toStringAsFixed(2)} sent to ${bid.name}',
    );
  }

  void showAcceptBidDialog() {
    CustomAlertDialog.showCustomDialog(
      context: context,
      title: 'Accept Bid',
      message:
          'Are you sure you want to accept ${bid.name}\'s bid of \u20B9${bid.price.toStringAsFixed(2)}?',
      confirmButtonText: 'Accept',
      cancelButtonText: 'Cancel',
      onConfirm: acceptBid,
      onCancel: () {
        // Just close the dialog, no additional action needed
      },
      barrierDismissible: true, // Allow tapping outside to dismiss
      // Optional: Add an icon for better visual appeal
      icon: Icon(Icons.check_circle_outline, size: 40),
      iconColor: Theme.of(context).primaryColor,
      iconBackgroundColor: Theme.of(
        context,
      ).primaryColor.withValues(alpha: 0.1),
    );
  }

  void acceptBid() {
    // Call the parent callback to stop the timer and handle acceptance
    onBidAccepted.call(bid);

    // Note: The snackbar is now shown in AuctionHelper.acceptBid()
    // to avoid duplicate snackbars
  }
}
