import 'package:flutter/material.dart';
import 'package:throw_user/core/models/bid.dart';
import 'package:throw_user/modules/auction_module/helper/fake_data.dart';
import 'package:throw_user/modules/auction_module/utils/auction_helper.dart';
import 'package:throw_user/modules/auction_module/widgets/bid_card.dart';
import 'package:throw_user/modules/auction_module/widgets/time_unit.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AuctionPage extends StatefulWidget {
  const AuctionPage({super.key});

  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const AuctionPage());

  @override
  State<AuctionPage> createState() => _AuctionPageState();
}

class _AuctionPageState extends State<AuctionPage> {
  late final AuctionHelper _auctionHelper;

  // Converted to ValueNotifier
  final ValueNotifier<List<Bid>> _bids = ValueNotifier<List<Bid>>([]);

  // Timer variables as ValueNotifiers
  final ValueNotifier<int> _remainingSeconds = ValueNotifier<int>(180);
  final ValueNotifier<bool> _isTimerActive = ValueNotifier<bool>(true);

  @override
  void initState() {
    super.initState();
    _auctionHelper = AuctionHelper(
      context: context,
      remainingSeconds: _remainingSeconds,
      isTimerActive: _isTimerActive,
      bids: _bids,
    );
    _bids.value = FakeData.generateRandomBids();
    _auctionHelper.startTimer();
  }

  @override
  void dispose() {
    _auctionHelper.cancelTimer();
    _bids.dispose();
    _remainingSeconds.dispose();
    _isTimerActive.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    // Responsive dimensions
    final isSmallScreen = size.width < 375;
    final isLargeScreen = size.width > 600;
    final horizontalPadding = isSmallScreen
        ? 12.0
        : isLargeScreen
        ? 24.0
        : 16.0;
    final verticalPadding = isSmallScreen ? 12.0 : 16.0;
    final cardPadding = isSmallScreen ? 16.0 : 24.0;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF101a22) : Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF2694ed),
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: isSmallScreen ? 18.0 : 20.0,
          color: Colors.white,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: isSmallScreen ? 20.0 : 24.0),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Auction'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(minHeight: size.height),
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Auction Timer Section
              ValueListenableBuilder<bool>(
                valueListenable: _isTimerActive,
                builder: (context, isTimerActive, _) {
                  return ValueListenableBuilder<int>(
                    valueListenable: _remainingSeconds,
                    builder: (context, remainingSeconds, _) {
                      final minutes = (remainingSeconds ~/ 60)
                          .toString()
                          .padLeft(2, '0');
                      final seconds = (remainingSeconds % 60)
                          .toString()
                          .padLeft(2, '0');

                      return Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(cardPadding),
                        decoration: BoxDecoration(
                          color: isDark ? colorScheme.surface : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: !isTimerActive
                              ? Border.all(color: Colors.red, width: 2)
                              : null,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 1,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              isTimerActive
                                  ? 'Auction ends in'
                                  : 'Auction ended',
                              style: textTheme.bodySmall?.copyWith(
                                color: isTimerActive
                                    ? (isDark
                                          ? colorScheme.onSurface.withValues(
                                              alpha: 0.6,
                                            )
                                          : const Color(0xFF6b7280))
                                    : Colors.red,
                                fontWeight: isTimerActive
                                    ? null
                                    : FontWeight.bold,
                                fontSize: isSmallScreen ? 12.0 : 14.0,
                              ),
                            ),
                            SizedBox(height: isSmallScreen ? 6.0 : 8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                TimeUnit(
                                  number: minutes,
                                  label: 'Minutes',
                                  isSmallScreen: isSmallScreen,
                                  isLargeScreen: isLargeScreen,
                                  isDark: isDark,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    bottom: isSmallScreen ? 2.0 : 4.0,
                                  ),
                                  child: Text(
                                    ':',
                                    style: TextStyle(
                                      fontSize: isSmallScreen
                                          ? 24.0
                                          : isLargeScreen
                                          ? 40.0
                                          : 36.0,
                                      fontWeight: FontWeight.bold,
                                      color: isDark
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                                TimeUnit(
                                  number: seconds,
                                  label: 'Seconds',
                                  isSmallScreen: isSmallScreen,
                                  isLargeScreen: isLargeScreen,
                                  isDark: isDark,
                                ),
                              ],
                            ),
                            if (!isTimerActive) ...[
                              SizedBox(height: isSmallScreen ? 6.0 : 8.0),
                              Text(
                                "Time's up!",
                                style: textTheme.bodyMedium?.copyWith(
                                  color: Colors.red,
                                  fontSize: isSmallScreen ? 12.0 : 14.0,
                                ),
                              ),
                            ],
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              SizedBox(height: isSmallScreen ? 16.0 : 24.0),
              // Live Bids Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Live Bids',
                    style: textTheme.titleLarge?.copyWith(
                      fontSize: isSmallScreen
                          ? 18.0
                          : isLargeScreen
                          ? 22.0
                          : 20.0,
                    ),
                  ),
                  ValueListenableBuilder<List<Bid>>(
                    valueListenable: _bids,
                    builder: (context, bids, _) => Text(
                      '${bids.length} bids',
                      style: textTheme.titleMedium?.copyWith(
                        color: colorScheme.onSurface.withValues(alpha: 0.6),
                        fontWeight: FontWeight.w500,
                        fontSize: isSmallScreen ? 14.0 : 16.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: isSmallScreen ? 12.0 : 16.0),
              // Bids List
              ValueListenableBuilder<bool>(
                valueListenable: _isTimerActive,
                builder: (context, isTimerActive, child) {
                  return ValueListenableBuilder<List<Bid>>(
                    valueListenable: _bids,
                    builder: (context, bids, _) {
                      return Column(
                        children: bids
                            .map(
                              (bid) => BidCard(
                                bid: bid,
                                colorScheme: colorScheme,
                                textTheme: textTheme,
                                isAuctionActive: isTimerActive,
                                onBidUpdated: _auctionHelper.updateBid,
                                onBidAccepted: _auctionHelper.acceptBid,
                                isSmallScreen: isSmallScreen,
                                isLargeScreen: isLargeScreen,
                                isDark: isDark,
                              ),
                            )
                            .toList(),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
