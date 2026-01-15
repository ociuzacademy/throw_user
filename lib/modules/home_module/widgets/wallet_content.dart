// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:throw_user/core/constants/app_colors.dart';
import 'package:throw_user/core/exports/enum_exports.dart';
import 'package:throw_user/core/models/delivery_request_model.dart';
import 'package:throw_user/modules/home_module/widgets/transaction_item.dart';

class WalletContent extends StatelessWidget {
  final bool isDark;
  final bool isSmallScreen;
  final bool isLargeScreen;
  final List<DeliveryRequestModel> deliveryRequests;
  const WalletContent({
    super.key,
    required this.isDark,
    required this.isSmallScreen,
    required this.isLargeScreen,
    required this.deliveryRequests,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(isSmallScreen ? 16 : 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Text(
            'Payment History',
            style: TextStyle(
              fontSize: isSmallScreen ? 18 : 22,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : AppColors.textPrimaryLight,
            ),
          ),

          SizedBox(height: isSmallScreen ? 16 : 24),

          Builder(
            builder: (context) {
              final paymentCompletedRequests = deliveryRequests
                  .where(
                    (request) => request.paymentStatus != PaymentStatus.pending,
                  )
                  .toList();
              return Expanded(
                child: ListView.separated(
                  itemCount: paymentCompletedRequests.length,
                  itemBuilder: (context, index) {
                    final DeliveryRequestModel deliveryRequest =
                        paymentCompletedRequests[index];

                    final isPaymentCompleted =
                        deliveryRequest.paymentStatus ==
                        PaymentStatus.escrowAmountPaid;
                    return TransactionItem(
                      icon: isPaymentCompleted
                          ? Icons.north_east
                          : Icons.south_east,
                      title: deliveryRequest.paymentStatus.value,
                      subtitle: isPaymentCompleted
                          ? 'To Escrow Wallet'
                          : 'To Delivery Partner',
                      amount:
                          '${isPaymentCompleted ? '\u2197 ₹' : '\u2198 ₹'} ${deliveryRequest.agreedDeliveryCharge?.toStringAsFixed(2) ?? '0.00'}',
                      isPositive: isPaymentCompleted,
                      isDark: isDark,
                      isSmallScreen: isSmallScreen,
                    );
                  },
                  separatorBuilder: (context, index) =>
                      SizedBox(height: isSmallScreen ? 12 : 16),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
