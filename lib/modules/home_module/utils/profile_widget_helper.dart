import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:throw_user/core/exports/bloc_exports.dart';

class ProfileWidgetHelper {
  final BuildContext context;

  const ProfileWidgetHelper(this.context);

  void userProfileInit() {
    final UserProfileCubit userProfileCubit = context.read<UserProfileCubit>();
    userProfileCubit.getUserProfile();
  }

  void getUserDeliveryRequests() {
    final UserDeliveryRequestsCubit cubit = context
        .read<UserDeliveryRequestsCubit>();
    cubit.getUserDeliveryRequests();
  }

  void logout() {
    final AuthBloc authBloc = context.read<AuthBloc>();
    authBloc.add(const AuthEvent.signOut());
  }
}
