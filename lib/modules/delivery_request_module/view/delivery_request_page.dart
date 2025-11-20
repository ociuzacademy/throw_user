// delivery_request_page.dart (updated)
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:throw_user/modules/delivery_request_module/providers/delivery_request_provider.dart';
import 'package:throw_user/modules/delivery_request_module/services/delivery_request_service.dart';
import 'package:throw_user/modules/delivery_request_module/widgets/delivery_request_body.dart';

class DeliveryRequestPage extends StatefulWidget {
  const DeliveryRequestPage({super.key});

  @override
  State<DeliveryRequestPage> createState() => _DeliveryRequestPageState();

  static Route route() =>
      MaterialPageRoute(builder: (context) => const DeliveryRequestPage());
}

class _DeliveryRequestPageState extends State<DeliveryRequestPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late DeliveryRequestService _deliveryRequestService;

  @override
  void initState() {
    super.initState();
    _deliveryRequestService = DeliveryRequestService(context);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DeliveryRequestProvider(),
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF101a22)
            : const Color(0xFFf6f7f8),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Create Delivery Request',
            style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.width < 375 ? 18 : 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF2694ed),
          elevation: 0,
        ),
        body: Consumer<DeliveryRequestProvider>(
          builder: (context, provider, child) {
            return DeliveryRequestBody(
              formKey: _formKey,
              deliveryRequestService: _deliveryRequestService,
              context: context,
              provider: provider,
            );
          },
        ),
      ),
    );
  }
}
