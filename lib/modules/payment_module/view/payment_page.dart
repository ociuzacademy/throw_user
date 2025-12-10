// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:throw_user/core/constants/app_colors.dart';

import 'package:throw_user/core/models/bid.dart';
import 'package:throw_user/modules/payment_module/utils/payment_helper.dart';

class PaymentPage extends StatefulWidget {
  final Bid bid;
  const PaymentPage({super.key, required this.bid});

  static MaterialPageRoute route({required Bid bid}) =>
      MaterialPageRoute(builder: (context) => PaymentPage(bid: bid));

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late final PaymentHelper _paymentHelper;

  @override
  void initState() {
    super.initState();
    _paymentHelper = PaymentHelper(context: context, bid: widget.bid);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final isSmallScreen = screenWidth < 600;
    final isVerySmallScreen = screenWidth < 400;

    // Responsive dimensions
    final horizontalPadding = isSmallScreen ? 16.0 : 24.0;
    final verticalPadding = isSmallScreen ? 12.0 : 16.0;
    final cardPadding = isSmallScreen ? 16.0 : 24.0;
    final titleFontSize = isSmallScreen ? 16.0 : 18.0;
    final headerFontSize = isSmallScreen ? 16.0 : 18.0;
    final amountFontSize = isVerySmallScreen ? 20.0 : 24.0;
    final bodyFontSize = isSmallScreen ? 12.0 : 14.0;
    final buttonFontSize = isSmallScreen ? 14.0 : 16.0;
    final buttonVerticalPadding = isSmallScreen ? 12.0 : 16.0;
    final avatarSize = isVerySmallScreen ? 48.0 : 56.0;
    final spacing = isSmallScreen ? 16.0 : 24.0;
    final innerSpacing = isSmallScreen ? 8.0 : 16.0;

    // Color definitions based on the HTML
    // Color definitions based on the HTML
    final primaryColor = AppColors.primary;
    final backgroundLight = AppColors.backgroundLight;
    final backgroundDark = AppColors.backgroundDark;

    return Scaffold(
      backgroundColor: isDark ? backgroundDark : backgroundLight,
      body: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(verticalPadding),
            decoration: BoxDecoration(color: primaryColor),
            child: SafeArea(
              bottom: false,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Back button
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: isSmallScreen ? 20.0 : 24.0,
                      ),
                    ),
                  ),
                  // Title
                  Padding(
                    padding: EdgeInsets.only(
                      right: isSmallScreen
                          ? 32.0
                          : 40.0, // To account for the back button space
                    ),
                    child: Text(
                      'Payment',
                      style: TextStyle(
                        fontSize: headerFontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Main content
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(horizontalPadding),
              child: Column(
                children: [
                  // Payment Confirmation Section
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(cardPadding),
                    decoration: BoxDecoration(
                      color: isDark ? backgroundDark : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 1,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Payment Confirmation',
                          style: TextStyle(
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: isSmallScreen ? 2 : 4),
                        Text(
                          'You are about to make a secure escrow payment.',
                          style: TextStyle(
                            fontSize: bodyFontSize,
                            color: isDark ? Colors.grey[400] : Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: innerSpacing),
                        Container(
                          padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
                          decoration: BoxDecoration(
                            color: isDark
                                ? Colors.black.withValues(alpha: 0.2)
                                : backgroundLight,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Escrow Payment',
                                      style: TextStyle(
                                        fontSize: isSmallScreen ? 12 : 14,
                                        fontWeight: FontWeight.w500,
                                        color: isDark
                                            ? Colors.grey[300]
                                            : Colors.grey[600],
                                      ),
                                    ),
                                    SizedBox(height: isSmallScreen ? 2 : 4),
                                    Text(
                                      '\u20B9${widget.bid.bargainedPrice != null ? widget.bid.bargainedPrice?.toStringAsFixed(2) : widget.bid.price.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        fontSize: amountFontSize,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: isSmallScreen ? 4 : 8),
                                    Text(
                                      'Payment will be released to the agent upon your confirmation of delivery.',
                                      style: TextStyle(
                                        fontSize: isSmallScreen ? 10 : 12,
                                        color: isDark
                                            ? Colors.grey[400]
                                            : Colors.grey[500],
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: spacing),

                  // Agent Information Section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isSmallScreen ? 8 : 16,
                        ),
                        child: Text(
                          'Agent Information',
                          style: TextStyle(
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: isSmallScreen ? 4 : 8),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
                        decoration: BoxDecoration(
                          color: isDark ? backgroundDark : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 1,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            // Agent Avatar
                            Container(
                              width: avatarSize,
                              height: avatarSize,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(widget.bid.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: isSmallScreen ? 12 : 16),
                            // Agent Info
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.bid.name,
                                    style: TextStyle(
                                      fontSize: isSmallScreen ? 14 : 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: isSmallScreen ? 1 : 2),
                                  Text(
                                    'Delivery Agent',
                                    style: TextStyle(
                                      fontSize: isSmallScreen ? 12 : 14,
                                      color: isDark
                                          ? Colors.grey[400]
                                          : Colors.grey[600],
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: isSmallScreen ? 60 : 80,
                  ), // Extra space for bottom button
                ],
              ),
            ),
          ),

          // Bottom Payment Button and Navigation
          Column(
            children: [
              // Payment Button
              Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(
                  horizontalPadding,
                  isSmallScreen ? 8 : 12,
                  horizontalPadding,
                  isSmallScreen ? 8 : 12,
                ),
                decoration: BoxDecoration(
                  color: isDark
                      ? backgroundDark.withValues(alpha: 0.8)
                      : Colors.white,
                  border: Border(
                    top: BorderSide(
                      color: isDark ? Colors.grey[800]! : Colors.grey[200]!,
                    ),
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    _paymentHelper.showPaymentConfirmDialog();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      vertical: buttonVerticalPadding,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 4,
                    shadowColor: primaryColor.withValues(alpha: 0.3),
                  ),
                  child: Text(
                    'Proceed to Payment Gateway',
                    style: TextStyle(
                      fontSize: buttonFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
