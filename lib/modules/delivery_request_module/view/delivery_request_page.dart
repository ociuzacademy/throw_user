// delivery_request_page.dart (updated)
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:throw_user/core/constants/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:throw_user/core/widgets/loaders/overlay_loader.dart';
import 'package:throw_user/core/widgets/snackbars/custom_snackbar.dart';
import 'package:throw_user/modules/auction_module/view/auction_page.dart';
import 'package:throw_user/modules/delivery_request_module/providers/delivery_request_provider.dart';
import 'package:throw_user/modules/delivery_request_module/services/delivery_request_service.dart';
import 'package:throw_user/modules/delivery_request_module/utils/delivery_request_helper.dart';
import 'package:throw_user/modules/delivery_request_module/widgets/delivery_request_body.dart';

import '../../../core/exports/bloc_exports.dart';

class DeliveryRequestPage extends StatefulWidget {
  const DeliveryRequestPage({super.key});

  @override
  State<DeliveryRequestPage> createState() => _DeliveryRequestPageState();

  static Route route() =>
      MaterialPageRoute(builder: (context) => const DeliveryRequestPage());
}

class _DeliveryRequestPageState extends State<DeliveryRequestPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final DeliveryRequestService _deliveryRequestService;
  late final DeliveryRequestHelper _deliveryRequestHelper;

  @override
  void initState() {
    super.initState();
    _deliveryRequestService = DeliveryRequestService(context);
    _deliveryRequestHelper = DeliveryRequestHelper(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DeliveryRequestProvider(),
      child: Scaffold(
        backgroundColor: AppColors.getBackgroundColor(
          Theme.of(context).brightness == Brightness.dark,
        ),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(
            'Create Delivery Request',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.primary,
          elevation: 0,
        ),
        body: BlocListener<DeliveryRequestBloc, DeliveryRequestState>(
          listener: (context, state) {
            switch (state) {
              case DeliveryRequestLoading():
                OverlayLoader.show(
                  context,
                  message: 'Creating delivery request...',
                );
                break;
              case DeliveryRequestError(message: final message):
                OverlayLoader.hide();
                CustomSnackbar.showError(context: context, message: message);
                break;
              case CreateDeliveryRequestSuccess(requestId: final requestId):
                OverlayLoader.hide();
                CustomSnackbar.showSuccess(
                  context: context,
                  message: 'Delivery request created successfully',
                );
                Navigator.push(context, AuctionPage.route(requestId));
                break;
              default:
            }
          },
          child: Consumer<DeliveryRequestProvider>(
            builder: (context, provider, child) {
              return DeliveryRequestBody(
                formKey: _formKey,
                deliveryRequestService: _deliveryRequestService,
                provider: provider,
                onSubmit: () {
                  _deliveryRequestHelper.submitForm(provider, _formKey);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
