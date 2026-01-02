// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_user/core/constants/app_colors.dart';
import 'package:throw_user/core/exports/bloc_exports.dart';
import 'package:throw_user/core/exports/custom_widget_exports.dart';
import 'package:throw_user/core/models/bid_model.dart';
import 'package:throw_user/modules/payment_module/utils/payment_helper.dart';
import 'package:throw_user/modules/payment_result_module/view/payment_result_page.dart';

class PaymentPage extends StatefulWidget {
  final String requestId;
  final BidModel bid;
  const PaymentPage({super.key, required this.bid, required this.requestId});

  static MaterialPageRoute route({
    required BidModel bid,
    required String requestId,
  }) => MaterialPageRoute(
    builder: (context) => PaymentPage(bid: bid, requestId: requestId),
  );

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late final PaymentHelper _paymentHelper;

  @override
  void initState() {
    super.initState();
    _paymentHelper = PaymentHelper(
      context: context,
      bid: widget.bid,
      requestId: widget.requestId,
    );
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
    const primaryColor = AppColors.primary;
    const backgroundLight = AppColors.backgroundLight;
    const backgroundDark = AppColors.backgroundDark;

    return Scaffold(
      backgroundColor: isDark ? backgroundDark : backgroundLight,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Payment',
          style: GoogleFonts.inter(
            fontSize: headerFontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
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
      body: BlocListener<DeliveryRequestBloc, DeliveryRequestState>(
        listener: (context, state) {
          switch (state) {
            case DeliveryRequestLoading():
              OverlayLoader.show(
                context,
                message: 'Processing payment to escrow wallet...',
              );
              break;
            case PayEscrowAmountSuccess(requestId: final requestId):
              OverlayLoader.hide();
              CustomSnackbar.showSuccess(
                context: context,
                message: 'Payment processed successfully',
              );
              // Navigate to success page
              Navigator.pushReplacement(
                context,
                PaymentResultPage.route(
                  isSuccess: true,
                  requestId: requestId,
                  bid: widget.bid,
                ),
              );
              break;
            case DeliveryRequestError(message: final message):
              OverlayLoader.hide();
              CustomSnackbar.showError(context: context, message: message);
              Navigator.pushReplacement(
                context,
                PaymentResultPage.route(
                  isSuccess: false,
                  requestId: widget.requestId,
                  bid: widget.bid,
                  errorMessage: message,
                ),
              );
              break;
            default:
              OverlayLoader.hide();
              break;
          }
        },
        child: Column(
          children: [
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
                        color: AppColors.getCardColor(isDark),
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
                            style: GoogleFonts.inter(
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold,
                              color: AppColors.getTextPrimaryColor(isDark),
                            ),
                          ),
                          SizedBox(height: isSmallScreen ? 2 : 4),
                          Text(
                            'You are about to make a secure escrow payment.',
                            style: GoogleFonts.inter(
                              fontSize: bodyFontSize,
                              color: AppColors.getTextSecondaryColor(isDark),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Escrow Payment',
                                        style: GoogleFonts.inter(
                                          fontSize: isSmallScreen ? 12 : 14,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              AppColors.getTextSecondaryColor(
                                                isDark,
                                              ),
                                        ),
                                      ),
                                      SizedBox(height: isSmallScreen ? 2 : 4),
                                      Text(
                                        '\u20B9${widget.bid.bargainAmount ?? widget.bid.bidAmount.toStringAsFixed(2)}',
                                        style: GoogleFonts.inter(
                                          fontSize: amountFontSize,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.getTextPrimaryColor(
                                            isDark,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: isSmallScreen ? 4 : 8),
                                      Text(
                                        'Payment will be released to the agent upon your confirmation of delivery.',
                                        style: GoogleFonts.inter(
                                          fontSize: isSmallScreen ? 10 : 12,
                                          color:
                                              AppColors.getTextSecondaryColor(
                                                isDark,
                                              ),
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
                            style: GoogleFonts.inter(
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold,
                              color: AppColors.getTextPrimaryColor(isDark),
                            ),
                          ),
                        ),
                        SizedBox(height: isSmallScreen ? 4 : 8),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
                          decoration: BoxDecoration(
                            color: AppColors.getCardColor(isDark),
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
                              CachedNetworkImage(
                                imageUrl: widget.bid.agentAvatarUrl,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                      width: avatarSize,
                                      height: avatarSize,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                placeholder: (context, url) => SizedBox(
                                  width: avatarSize,
                                  height: avatarSize,
                                  child: const Center(
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) => Container(
                                  width: avatarSize,
                                  height: avatarSize,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: isDark
                                        ? Colors.grey[800]
                                        : Colors.grey[200],
                                  ),
                                  child: Icon(
                                    Icons.person,
                                    color: isDark
                                        ? Colors.grey[400]
                                        : Colors.grey[600],
                                    size: avatarSize * 0.6,
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
                                      widget.bid.agentName,
                                      style: GoogleFonts.inter(
                                        fontSize: isSmallScreen ? 14 : 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.getTextPrimaryColor(
                                          isDark,
                                        ),
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: isSmallScreen ? 1 : 2),
                                    Text(
                                      'Delivery Agent',
                                      style: GoogleFonts.inter(
                                        fontSize: isSmallScreen ? 12 : 14,
                                        color: AppColors.getTextSecondaryColor(
                                          isDark,
                                        ),
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
                        : AppColors.cardLight,
                    border: Border(
                      top: BorderSide(color: AppColors.getBorderColor(isDark)),
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
                      style: GoogleFonts.inter(
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
      ),
    );
  }
}
