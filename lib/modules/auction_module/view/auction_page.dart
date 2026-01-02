import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:throw_user/core/constants/app_colors.dart';
import 'package:throw_user/core/exports/bloc_exports.dart';
import 'package:throw_user/core/exports/custom_widget_exports.dart';
import 'package:throw_user/core/repository/delivery_request_repository.dart';
import 'package:throw_user/modules/auction_expired_module/view/auction_expired_page.dart';
import 'package:throw_user/modules/auction_module/cubit/delivery_request_bids_cubit.dart';
import 'package:throw_user/modules/auction_module/utils/auction_helper.dart';
import 'package:throw_user/modules/auction_module/widgets/bid_card.dart';
import 'package:throw_user/modules/auction_module/widgets/time_unit.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AuctionPage extends StatefulWidget {
  final String auctionId;
  const AuctionPage({super.key, required this.auctionId});

  static MaterialPageRoute route(String auctionId) => MaterialPageRoute(
    builder: (context) => BlocProvider(
      create: (context) =>
          DeliveryRequestBidsCubit(context.read<DeliveryRequestRepository>())
            ..loadBids(auctionId),
      child: AuctionPage(auctionId: auctionId),
    ),
  );

  @override
  State<AuctionPage> createState() => _AuctionPageState();
}

class _AuctionPageState extends State<AuctionPage> {
  late final AuctionHelper _auctionHelper;

  // Timer variables as ValueNotifiers
  final ValueNotifier<int> _remainingSeconds = ValueNotifier<int>(5 * 60);
  final ValueNotifier<bool> _isTimerActive = ValueNotifier<bool>(true);

  @override
  void initState() {
    super.initState();
    _auctionHelper = AuctionHelper(
      context: context,
      requestId: widget.auctionId,
      remainingSeconds: _remainingSeconds,
      isTimerActive: _isTimerActive,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _auctionHelper.startTimer();
    });
  }

  @override
  void dispose() {
    _auctionHelper.cancelTimer();
    _remainingSeconds.dispose();
    _isTimerActive.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      backgroundColor: AppColors.getBackgroundColor(isDark),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: isSmallScreen ? 18.0 : 20.0,
          color: AppColors.onPrimary,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: isSmallScreen ? 20.0 : 24.0),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Auction'),
        centerTitle: true,
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<DeliveryRequestBloc, DeliveryRequestState>(
            listener: (context, state) {
              switch (state) {
                case DeliveryRequestLoading():
                  OverlayLoader.show(context);
                  break;
                case CancelRequestSuccess _:
                  OverlayLoader.hide();
                  _auctionHelper.reset();
                  CustomSnackbar.showError(
                    context: context,
                    message: 'Auction has cancelled!',
                  );
                  Navigator.push(context, AuctionExpiredPage.route());
                  break;
                case DeliveryRequestError(message: final String message):
                  OverlayLoader.hide();
                  CustomSnackbar.showError(context: context, message: message);
                  break;
                default:
                  OverlayLoader.hide();
                  break;
              }
            },
          ),
        ],
        child: SingleChildScrollView(
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
                            color: AppColors.getCardColor(isDark),
                            borderRadius: BorderRadius.circular(12),
                            border: !isTimerActive
                                ? Border.all(color: AppColors.error, width: 2)
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
                                      ? AppColors.getTextSecondaryColor(isDark)
                                      : AppColors.error,
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
                                        color: AppColors.getTextPrimaryColor(
                                          isDark,
                                        ),
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
                                    color: AppColors.error,
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
                BlocBuilder<DeliveryRequestBidsCubit, DeliveryRequestBidsState>(
                  builder: (context, state) {
                    final bidsCount = switch (state) {
                      DeliveryRequestBidsLoaded(bids: final bids) =>
                        bids.length,
                      _ => 0,
                    };
                    return Row(
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
                            color: AppColors.getTextSecondaryColor(isDark),
                          ),
                        ),
                        Text(
                          '$bidsCount bids',
                          style: textTheme.titleMedium?.copyWith(
                            color: AppColors.getTextSecondaryColor(isDark),
                            fontWeight: FontWeight.w500,
                            fontSize: isSmallScreen ? 14.0 : 16.0,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: isSmallScreen ? 12.0 : 16.0),
                // Bids List
                ValueListenableBuilder<bool>(
                  valueListenable: _isTimerActive,
                  builder: (context, isTimerActive, child) {
                    return BlocBuilder<
                      DeliveryRequestBidsCubit,
                      DeliveryRequestBidsState
                    >(
                      builder: (context, state) {
                        return switch (state) {
                          DeliveryRequestBidsInitial() =>
                            const SizedBox.shrink(),
                          DeliveryRequestBidsLoading() => const Center(
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          DeliveryRequestBidsEmpty() => Center(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                'No bids yet',
                                style: textTheme.bodyMedium?.copyWith(
                                  color: AppColors.getTextSecondaryColor(
                                    isDark,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          DeliveryRequestBidsLoaded(bids: final bids) =>
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: bids.length,
                              itemBuilder: (context, index) {
                                final bid = bids[index];
                                return BidCard(
                                  bid: bid,
                                  textTheme: textTheme,
                                  isAuctionActive: isTimerActive,
                                  onBidUpdated: _auctionHelper.updateBid,
                                  onBidAccepted: _auctionHelper.acceptBid,
                                  isSmallScreen: isSmallScreen,
                                  isLargeScreen: isLargeScreen,
                                  isDark: isDark,
                                );
                              },
                            ),
                          DeliveryRequestBidsError(message: final message) =>
                            CustomErrorWidget(
                              errorMessage: message,
                              isDark: isDark,
                              onRetry: () {
                                // _auctionHelper.loadBids(auctionId);
                              },
                            ),
                        };
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
