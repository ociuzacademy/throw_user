import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:throw_user/core/constants/app_colors.dart';
import 'package:throw_user/core/exports/bloc_exports.dart';
import 'package:throw_user/core/exports/custom_widget_exports.dart';
import 'package:throw_user/modules/home_module/utils/recent_deliveries_widget_helper.dart';
import 'package:throw_user/modules/home_module/widgets/delivery_card.dart';

class RecentDeliveriesWidget extends StatefulWidget {
  const RecentDeliveriesWidget({super.key});

  @override
  State<RecentDeliveriesWidget> createState() => _RecentDeliveriesWidgetState();
}

class _RecentDeliveriesWidgetState extends State<RecentDeliveriesWidget> {
  late final RecentDeliveriesWidgetHelper _recentDeliveriesWidgetHelper;

  @override
  void initState() {
    super.initState();
    _recentDeliveriesWidgetHelper = RecentDeliveriesWidgetHelper(
      context: context,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _recentDeliveriesWidgetHelper.getUserDeliveryRequests();
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isSmallScreen = mediaQuery.size.width < 600;
    final _ = mediaQuery.size.width < 400;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Color definitions
    final backgroundColor = AppColors.getBackgroundColor(isDark);
    final textPrimaryColor = AppColors.getTextPrimaryColor(isDark);

    // Responsive dimensions
    final padding = isSmallScreen ? 16.0 : 24.0;
    final spacing = isSmallScreen ? 16.0 : 24.0;
    final titleFontSize = isSmallScreen ? 20.0 : 24.0;

    return BlocBuilder<UserDeliveryRequestsCubit, UserDeliveryRequestsState>(
      builder: (context, state) {
        return switch (state) {
          UserDeliveryRequestsLoading() => const CustomLoaderWidget(
            message: 'Fetching user delivery requests...',
          ),
          UserDeliveryRequestsError(message: final message) =>
            CustomErrorWidget(
              errorMessage: message,
              isDark: isDark,
              onRetry: _recentDeliveriesWidgetHelper.getUserDeliveryRequests,
            ),
          UserDeliveryRequestsEmpty() => CustomEmptyWidget(
            message: 'No delivery requests',
            subMessage: 'Your delivery requests will appear here',
            icon: Icons.local_shipping_outlined,
            isDark: isDark,
          ),
          UserDeliveryRequestsLoaded(
            deliveryRequests: final deliveryRequests,
          ) =>
            Container(
              color: backgroundColor,
              child: ListView.separated(
                padding: EdgeInsets.all(padding),
                itemCount: deliveryRequests.length + 1,
                separatorBuilder: (context, index) => SizedBox(height: spacing),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Text(
                      'Delivery Requests',
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: textPrimaryColor,
                      ),
                    );
                  }

                  final request = deliveryRequests[index - 1];
                  return DeliveryCard(
                    deliveryRequestId: request.deliveryRequestId,
                    status:
                        request.deliveryStatus.value[0].toUpperCase() +
                        request.deliveryStatus.value
                            .substring(1)
                            .replaceAll('_', ' '),
                    title: request.packageType.value,
                    description: request.dropOffAddress,
                  );
                },
              ),
            ),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }
}
