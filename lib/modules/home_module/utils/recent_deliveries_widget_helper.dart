import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:throw_user/core/exports/bloc_exports.dart';

class RecentDeliveriesWidgetHelper {
  final BuildContext context;

  const RecentDeliveriesWidgetHelper({required this.context});

  void getUserDeliveryRequests() {
    final UserDeliveryRequestsCubit cubit = context
        .read<UserDeliveryRequestsCubit>();
    cubit.getUserDeliveryRequests();
  }
}
