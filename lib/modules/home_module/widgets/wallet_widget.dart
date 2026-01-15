// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:throw_user/core/exports/bloc_exports.dart';
import 'package:throw_user/core/exports/custom_widget_exports.dart';
import 'package:throw_user/modules/home_module/utils/wallet_widget_helper.dart';

import 'package:throw_user/modules/home_module/widgets/wallet_content.dart';
import 'package:throw_user/modules/home_module/widgets/wallet_header.dart';

class WalletWidget extends StatefulWidget {
  const WalletWidget({super.key});

  @override
  State<WalletWidget> createState() => _WalletWidgetState();
}

class _WalletWidgetState extends State<WalletWidget> {
  late final WalletWidgetHelper _walletWidgetHelper;

  @override
  void initState() {
    super.initState();
    _walletWidgetHelper = WalletWidgetHelper(context: context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _walletWidgetHelper.getUserDeliveryRequests();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 375;
    final isLargeScreen = screenSize.width > 600;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocBuilder<UserDeliveryRequestsCubit, UserDeliveryRequestsState>(
      builder: (context, state) {
        return switch (state) {
          UserDeliveryRequestsLoading() => const CustomLoaderWidget(
            message: 'Loading wallet data...',
          ),
          UserDeliveryRequestsLoaded(:final deliveryRequests) => Column(
            children: [
              // Header Section
              WalletHeader(
                isDark: isDark,
                isSmallScreen: isSmallScreen,
                balance: WalletWidgetHelper.calculateBalance(deliveryRequests),
              ),

              // Main Content
              Expanded(
                child: WalletContent(
                  isDark: isDark,
                  isSmallScreen: isSmallScreen,
                  isLargeScreen: isLargeScreen,
                  deliveryRequests: deliveryRequests,
                ),
              ),
            ],
          ),
          UserDeliveryRequestsError(message: final errorMessage) =>
            CustomErrorWidget(
              errorMessage: errorMessage,
              isDark: isDark,
              onRetry: _walletWidgetHelper.getUserDeliveryRequests,
            ),
          UserDeliveryRequestsEmpty() => CustomEmptyWidget(
            message: 'Wallet details empty.',
            isDark: isDark,
          ),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }
}
