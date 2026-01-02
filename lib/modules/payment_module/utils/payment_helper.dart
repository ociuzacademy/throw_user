// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:throw_user/core/widgets/alert_dialogs/custom_alert_dialog.dart';
import 'package:throw_user/core/models/bid_model.dart';
import 'package:throw_user/modules/payment_result_module/view/payment_result_page.dart';

// Mock payment result class
class PaymentResult {
  final bool success;
  final String? message;
  final String? transactionId;

  PaymentResult({required this.success, this.message, this.transactionId});
}

// Mock payment service
class PaymentService {
  final Random _random = Random();

  Future<PaymentResult> processPayment() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    // 80% chance of success, 20% chance of failure for realistic simulation
    final bool isSuccess = _random.nextDouble() < 0.8;

    if (isSuccess) {
      // Generate a mock transaction ID
      final transactionId =
          'TXN${_random.nextInt(999999).toString().padLeft(6, '0')}';
      return PaymentResult(
        success: true,
        message: 'Payment processed successfully',
        transactionId: transactionId,
      );
    } else {
      // Simulate different failure reasons
      final failureReasons = [
        'Insufficient funds',
        'Network error',
        'Card declined',
        'Transaction timeout',
        'Invalid card details',
      ];
      final reason = failureReasons[_random.nextInt(failureReasons.length)];
      return PaymentResult(success: false, message: reason);
    }
  }
}

class PaymentHelper {
  final BuildContext context;
  final BidModel bid;
  final PaymentService _paymentService = PaymentService();

  PaymentHelper({required this.context, required this.bid});

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
            const Text(
              'Total Amount',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              '\u20B9${bid.bargainAmount ?? bid.bidAmount.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      onConfirm: () {
        // Process payment and navigate to success page
        _processPayment();
      },
    );
  }

  // Payment processing with simulation
  // In _processPayment method, use this simplified approach:
  void _processPayment() async {
    try {
      _showProcessingDialog();
      final paymentResult = await _paymentService.processPayment();

      if (context.mounted) {
        Navigator.of(
          context,
          rootNavigator: true,
        ).pop(); // Close loading dialog
      }

      if (paymentResult.success) {
        if (!context.mounted) return;
        // Navigate to success page
        Navigator.of(context).pushReplacement(
          PaymentResultPage.route(
            isSuccess: true,
            transactionId: paymentResult.transactionId,
          ),
        );
      } else {
        if (!context.mounted) return;
        // Navigate to failure page
        Navigator.of(
          context,
        ).pushReplacement(PaymentResultPage.route(isSuccess: false, bid: bid));
      }
    } catch (e) {
      if (context.mounted) {
        Navigator.of(context, rootNavigator: true).pop();
      }
      if (!context.mounted) return;
      Navigator.of(
        context,
      ).pushReplacement(PaymentResultPage.route(isSuccess: false, bid: bid));
    }
  }

  // Show a processing dialog while payment is being simulated
  void _showProcessingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Processing your payment...'),
          ],
        ),
      ),
    );
  }
}
