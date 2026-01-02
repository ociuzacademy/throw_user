// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_user/core/constants/app_colors.dart';

import 'package:throw_user/core/models/bid_model.dart';
import 'package:throw_user/modules/home_module/view/home_page.dart';
import 'package:throw_user/modules/payment_result_module/widgets/failure_icon.dart';
import 'package:throw_user/modules/payment_result_module/widgets/success_icon.dart';
import 'package:throw_user/modules/payment_module/view/payment_page.dart';

class PaymentResultPage extends StatefulWidget {
  final bool isSuccess;
  final String requestId;
  final BidModel bid;
  final String? errorMessage;

  const PaymentResultPage({
    super.key,
    required this.isSuccess,
    required this.requestId,
    required this.bid,
    this.errorMessage,
  });

  @override
  State<PaymentResultPage> createState() => _PaymentResultPageState();

  static MaterialPageRoute route({
    required bool isSuccess,
    required String requestId,
    required BidModel bid,
    String? errorMessage,
  }) => MaterialPageRoute(
    builder: (context) => PaymentResultPage(
      isSuccess: isSuccess,
      bid: bid,
      requestId: requestId,
      errorMessage: errorMessage,
    ),
  );
}

class _PaymentResultPageState extends State<PaymentResultPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize animation for both success and failure states
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {}); // This ensures the UI rebuilds on each animation tick
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
    final iconSize = isVerySmallScreen ? 120.0 : 192.0;
    final titleFontSize = isVerySmallScreen ? 20.0 : 24.0;
    final descriptionFontSize = isSmallScreen ? 14.0 : 16.0;
    final transactionFontSize = isSmallScreen ? 12.0 : 14.0;
    final buttonFontSize = isSmallScreen ? 16.0 : 18.0;
    final buttonHeight = isSmallScreen ? 48.0 : 56.0;

    // Spacing adjustments
    final iconSpacing = isSmallScreen ? 24.0 : 32.0;
    final titleSpacing = isSmallScreen ? 6.0 : 8.0;
    final descriptionSpacing = isSmallScreen ? 12.0 : 16.0;
    final transactionSpacing = isSmallScreen ? 8.0 : 16.0;

    // Color definitions based on HTML
    const primaryColor = AppColors.primary;
    const errorColor = AppColors.error;

    final backgroundColor = AppColors.getBackgroundColor(isDark);
    final textColor = AppColors.getTextPrimaryColor(isDark);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: EdgeInsets.all(verticalPadding),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      color: textColor,
                      size: isSmallScreen ? 20.0 : 24.0,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Expanded(
                    child: Text(
                      'Payment',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: isSmallScreen ? 16.0 : 18.0,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: isSmallScreen ? 40.0 : 48.0,
                  ), // Balance for the close button
                ],
              ),
            ),

            // Main Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: isSmallScreen ? 20.0 : 40.0),
                    // Animated Icon
                    SizedBox(
                      width: iconSize,
                      height: iconSize,
                      child: widget.isSuccess
                          ? SuccessIcon(
                              animation: _animation,
                              primaryColor: primaryColor,
                            )
                          : FailureIcon(
                              animation: _animation,
                              errorColor: errorColor,
                            ),
                    ),
                    SizedBox(height: iconSpacing),

                    // Title
                    Text(
                      widget.isSuccess
                          ? 'Payment Successful'
                          : 'Payment Failed',
                      style: GoogleFonts.inter(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: titleSpacing),

                    // Description
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isSmallScreen ? 16.0 : 24.0,
                      ),
                      child: Text(
                        widget.isSuccess
                            ? 'Your payment has been processed successfully. You will receive a confirmation shortly.'
                            : 'Unfortunately, your payment could not be processed. Please try again.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: descriptionFontSize,
                          color: textColor.withValues(alpha: 0.8),
                        ),
                      ),
                    ),
                    SizedBox(height: descriptionSpacing),

                    // Transaction ID (only for success)
                    if (widget.isSuccess) ...[
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: isSmallScreen ? 12.0 : 16.0,
                          vertical: isSmallScreen ? 8.0 : 12.0,
                        ),
                        decoration: BoxDecoration(
                          color: isDark
                              ? AppColors.inactiveBackgroundDark
                              : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 1,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Bid ID:',
                              style: GoogleFonts.inter(
                                fontSize: transactionFontSize,
                                color: textColor.withValues(alpha: 0.6),
                              ),
                            ),
                            SizedBox(width: isSmallScreen ? 2.0 : 4.0),
                            Flexible(
                              child: Text(
                                widget.bid.bidId,
                                style: GoogleFonts.inter(
                                  fontSize: transactionFontSize,
                                  fontWeight: FontWeight.w600,
                                  color: textColor,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: transactionSpacing),
                    ],
                    if (widget.errorMessage != null) ...[
                      Text(
                        widget.errorMessage!,
                        style: GoogleFonts.inter(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                    SizedBox(height: isSmallScreen ? 20.0 : 40.0),
                  ],
                ),
              ),
            ),

            // Footer Button
            Padding(
              padding: EdgeInsets.all(horizontalPadding),
              child: SizedBox(
                height: buttonHeight,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (widget.isSuccess) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        HomePage.route(),
                        (_) => false,
                      );
                    } else {
                      Navigator.pushAndRemoveUntil(
                        context,
                        PaymentPage.route(
                          bid: widget.bid,
                          requestId: widget.requestId,
                        ),
                        (_) => false,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    elevation: 4,
                    shadowColor: primaryColor.withValues(alpha: 0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        isSmallScreen ? 12.0 : 16.0,
                      ),
                    ),
                  ),
                  child: Text(
                    widget.isSuccess ? 'Done' : 'Retry Payment',
                    style: GoogleFonts.inter(
                      fontSize: buttonFontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
