// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:throw_user/core/exports/bloc_exports.dart';
import 'package:throw_user/core/widgets/snackbars/custom_snackbar.dart';
import 'package:throw_user/modules/delivery_request_module/providers/delivery_request_provider.dart';

class DeliveryRequestHelper {
  final BuildContext context;

  const DeliveryRequestHelper({required this.context});

  // Form submission method
  void submitForm(
    DeliveryRequestProvider provider,
    GlobalKey<FormState> formKey,
  ) {
    FocusScope.of(context).unfocus();
    if (!provider.validateForm(formKey)) {
      CustomSnackbar.showError(
        context: context,
        message: 'Please fill all the fields',
      );
      return;
    }
    final deliveryRequestData = provider.getDeliveryRequestData(formKey);
    if (deliveryRequestData == null) {
      CustomSnackbar.showError(
        context: context,
        message: 'Please fill all the fields',
      );
      return;
    }
    final DeliveryRequestBloc bloc = context.read<DeliveryRequestBloc>();
    bloc.add(DeliveryRequestEvent.createDeliveryRequest(deliveryRequestData));
  }
}
