// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:throw_user/core/constants/app_colors.dart';

import 'package:throw_user/core/models/bid.dart';
import 'package:throw_user/modules/auction_module/typedefs/bid_action.dart';
import 'package:throw_user/modules/auction_module/utils/bid_card_helper.dart';
import 'package:throw_user/modules/auction_module/widgets/accept_button.dart';
import 'package:throw_user/modules/auction_module/widgets/bargain_button.dart';

class BidCard extends StatefulWidget {
  final Bid bid;
  final ColorScheme colorScheme;
  final TextTheme textTheme;
  final bool isAuctionActive;
  final bool isSmallScreen;
  final bool isLargeScreen;
  final BidAction onBidUpdated;
  final BidAction onBidAccepted;
  final bool isDark;

  const BidCard({
    super.key,
    required this.bid,
    required this.colorScheme,
    required this.textTheme,
    required this.isAuctionActive,
    required this.isSmallScreen,
    required this.isLargeScreen,
    required this.onBidUpdated,
    required this.onBidAccepted,
    required this.isDark,
  });

  @override
  State<BidCard> createState() => _BidCardState();
}

class _BidCardState extends State<BidCard> {
  late final BidCardHelper _bidCardHelper;

  @override
  void initState() {
    super.initState();
    _bidCardHelper = BidCardHelper(
      context: context,
      bid: widget.bid,
      textTheme: widget.textTheme,
      onBidUpdated: widget.onBidUpdated,
      onBidAccepted: widget.onBidAccepted,
    );
  }

  @override
  Widget build(BuildContext context) {
    final avatarRadius = widget.isSmallScreen
        ? 20.0
        : widget.isLargeScreen
        ? 28.0
        : 24.0;
    final nameFontSize = widget.isSmallScreen ? 14.0 : 16.0;
    final priceFontSize = widget.isSmallScreen
        ? 16.0
        : widget.isLargeScreen
        ? 20.0
        : 18.0;
    final buttonFontSize = widget.isSmallScreen ? 12.0 : 14.0;
    final buttonHorizontalPadding = widget.isSmallScreen ? 8.0 : 12.0;
    final buttonVerticalPadding = widget.isSmallScreen ? 6.0 : 8.0;

    return Card(
      elevation: 2,
      color: widget.isDark ? widget.colorScheme.surface : Colors.white,
      margin: EdgeInsets.only(bottom: widget.isSmallScreen ? 8.0 : 12.0),
      child: Padding(
        padding: EdgeInsets.all(widget.isSmallScreen ? 12.0 : 16.0),
        child: Row(
          children: [
            // Profile image
            CircleAvatar(
              radius: avatarRadius,
              backgroundImage: NetworkImage(widget.bid.imageUrl),
            ),
            SizedBox(width: widget.isSmallScreen ? 8.0 : 12.0),

            // Bidder info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.bid.name,
                    style: widget.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: nameFontSize,
                      color: widget.isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  SizedBox(height: widget.isSmallScreen ? 2.0 : 4.0),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: widget.isSmallScreen ? 14.0 : 16.0,
                        color: Colors.amber,
                      ),
                      SizedBox(width: widget.isSmallScreen ? 2.0 : 4.0),
                      Text(
                        widget.bid.rating.toString(),
                        style: widget.textTheme.bodySmall?.copyWith(
                          fontSize: widget.isSmallScreen ? 12.0 : 14.0,
                        ),
                      ),
                      SizedBox(width: widget.isSmallScreen ? 4.0 : 8.0),
                      Text(
                        widget.bid.eta,
                        style: widget.textTheme.bodySmall?.copyWith(
                          color: widget.colorScheme.onSurface.withValues(
                            alpha: 0.6,
                          ),
                          fontSize: widget.isSmallScreen ? 12.0 : 14.0,
                        ),
                      ),
                    ],
                  ),

                  // Show bargained price if exists
                  if (widget.bid.bargainedPrice != null) ...[
                    SizedBox(height: widget.isSmallScreen ? 2.0 : 4.0),
                    Text(
                      'Bargained: \u20B9${widget.bid.bargainedPrice!.toStringAsFixed(2)}',
                      style: widget.textTheme.bodySmall?.copyWith(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                        fontSize: widget.isSmallScreen ? 11.0 : 12.0,
                      ),
                    ),
                  ],

                  // Show if agent left the auction
                  if (widget.bid.agentLeftAuction) ...[
                    SizedBox(height: widget.isSmallScreen ? 2.0 : 4.0),
                    Text(
                      'Agent left the auction',
                      style: widget.textTheme.bodySmall?.copyWith(
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                        fontSize: widget.isSmallScreen ? 11.0 : 12.0,
                      ),
                    ),
                  ],
                ],
              ),
            ),

            // Price and action buttons
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\u20B9${widget.bid.price.toStringAsFixed(2)}',
                  style: widget.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                    fontSize: priceFontSize,
                  ),
                ),
                SizedBox(height: widget.isSmallScreen ? 4.0 : 8.0),

                // Show different UI based on auction status and agent status
                if (widget.bid.agentLeftAuction)
                  Text(
                    'No longer available',
                    style: widget.textTheme.bodySmall?.copyWith(
                      color: Colors.red,
                      fontStyle: FontStyle.italic,
                      fontSize: widget.isSmallScreen ? 10.0 : 12.0,
                    ),
                  )
                else
                  // Responsive button layout
                  widget.isSmallScreen
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            BargainButton(
                              isAuctionActive: widget.isAuctionActive,
                              agentLeftAuction: widget.bid.agentLeftAuction,
                              showBargainBottomSheet:
                                  _bidCardHelper.showBargainBottomSheet,
                              fontSize: buttonFontSize,
                              horizontalPadding: buttonHorizontalPadding,
                              verticalPadding: buttonVerticalPadding,
                            ),
                            SizedBox(height: 4),
                            AcceptButton(
                              isAuctionActive: widget.isAuctionActive,
                              agentLeftAuction: widget.bid.agentLeftAuction,
                              showAcceptBidDialog:
                                  _bidCardHelper.showAcceptBidDialog,
                              fontSize: buttonFontSize,
                              horizontalPadding: buttonHorizontalPadding,
                              verticalPadding: buttonVerticalPadding,
                            ),
                          ],
                        )
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            BargainButton(
                              isAuctionActive: widget.isAuctionActive,
                              agentLeftAuction: widget.bid.agentLeftAuction,
                              showBargainBottomSheet:
                                  _bidCardHelper.showBargainBottomSheet,
                              fontSize: buttonFontSize,
                              horizontalPadding: buttonHorizontalPadding,
                              verticalPadding: buttonVerticalPadding,
                            ),
                            SizedBox(width: widget.isLargeScreen ? 12.0 : 8.0),
                            AcceptButton(
                              isAuctionActive: widget.isAuctionActive,
                              agentLeftAuction: widget.bid.agentLeftAuction,
                              showAcceptBidDialog:
                                  _bidCardHelper.showAcceptBidDialog,
                              fontSize: buttonFontSize,
                              horizontalPadding: buttonHorizontalPadding,
                              verticalPadding: buttonVerticalPadding,
                            ),
                          ],
                        ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
