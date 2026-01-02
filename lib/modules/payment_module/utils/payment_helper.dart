// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_user/core/constants/app_colors.dart';
import 'package:throw_user/core/exports/bloc_exports.dart';

import 'package:throw_user/core/widgets/alert_dialogs/custom_alert_dialog.dart';
import 'package:throw_user/core/models/bid_model.dart';

class PaymentHelper {
  final BuildContext context;
  final String requestId;
  final BidModel bid;

  PaymentHelper({
    required this.context,
    required this.bid,
    required this.requestId,
  });

  void showPaymentConfirmDialog() {
    CustomAlertDialog.showCustomDialog(
      context: context,
      title: 'Secure Payment',
      message:
          'You will be redirected to our secure payment gateway to complete your transaction.',
      icon: const Icon(Icons.lock_outline),
      confirmButtonText: 'Proceed',
      cancelButtonText: 'Cancel',
      customContent: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.black.withValues(alpha: 0.3) // CORRECT: using withValues
              : const Color(0xFFf6f7f8),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Amount',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.getTextPrimaryColor(
                  Theme.of(context).brightness == Brightness.dark,
                ),
              ),
            ),
            Text(
              '\u20B9${bid.bargainAmount ?? bid.bidAmount.toStringAsFixed(2)}',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.getTextPrimaryColor(
                  Theme.of(context).brightness == Brightness.dark,
                ),
              ),
            ),
          ],
        ),
      ),
      onConfirm: () {
        final DeliveryRequestBloc bloc = context.read<DeliveryRequestBloc>();
        bloc.add(DeliveryRequestEvent.payEscrowAmount(requestId));
      },
    );
  }
}
