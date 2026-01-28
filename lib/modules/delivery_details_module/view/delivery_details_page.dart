// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:throw_user/core/constants/app_colors.dart';
import 'package:throw_user/core/exports/bloc_exports.dart';
import 'package:throw_user/core/exports/custom_widget_exports.dart';
import 'package:throw_user/modules/delivery_details_module/utils/delivery_details_helper.dart';
import 'package:throw_user/modules/delivery_details_module/widgets/delivery_location_section.dart';
import 'package:throw_user/modules/delivery_details_module/widgets/package_details_grid.dart';
import 'package:throw_user/modules/delivery_details_module/widgets/progress_timeline.dart';
import 'package:throw_user/modules/home_module/view/home_page.dart';

class DeliveryDetailsPage extends StatefulWidget {
  final String deliveryRequestId;
  const DeliveryDetailsPage({super.key, required this.deliveryRequestId});

  static MaterialPageRoute route({required String deliveryRequestId}) =>
      MaterialPageRoute(
        builder: (_) =>
            DeliveryDetailsPage(deliveryRequestId: deliveryRequestId),
      );

  @override
  State<DeliveryDetailsPage> createState() => _DeliveryDetailsPageState();
}

class _DeliveryDetailsPageState extends State<DeliveryDetailsPage> {
  late final DeliveryDetailsHelper _deliveryDetailsHelper;

  @override
  void initState() {
    super.initState();
    _deliveryDetailsHelper = DeliveryDetailsHelper(
      deliveryRequestId: widget.deliveryRequestId,
      context: context,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _deliveryDetailsHelper.deliveryRequestDetailsInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final isSmallScreen = screenWidth < 600;

    // Responsive dimensions

    // Color definitions based on HTML
    const primaryColor = AppColors.primary;
    const backgroundLight = AppColors.backgroundLight;
    const backgroundDark = AppColors.backgroundDark;
    const cardLight = AppColors.cardLight;
    const cardDark = AppColors.cardDark;
    const textPrimaryLight = AppColors.textPrimaryLight;
    const textPrimaryDark = AppColors.textPrimaryDark;
    const textSecondaryLight = AppColors.textSecondaryLight;
    const textSecondaryDark = AppColors.textSecondaryDark;

    final backgroundColor = isDark ? backgroundDark : backgroundLight;
    final cardColor = isDark ? cardDark : cardLight;
    final textPrimaryColor = isDark ? textPrimaryDark : textPrimaryLight;
    final textSecondaryColor = isDark ? textSecondaryDark : textSecondaryLight;

    final DateFormat dateFormat = DateFormat('dd MMM, yyyy');

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 24,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text(
          'Delivery Details',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<DeliveryRequestBloc, DeliveryRequestState>(
            listener: (context, state) {
              switch (state) {
                case DeliveryRequestLoading():
                  OverlayLoader.show(
                    context,
                    message: 'Initiating delivery pickup...',
                  );
                  break;
                case DeliveryRequestError(message: final message):
                  OverlayLoader.hide();
                  CustomSnackbar.showError(context: context, message: message);
                  break;
                case SetDeliveryOnTheWaySuccess(requestId: final requestId):
                  OverlayLoader.hide();
                  CustomSnackbar.showSuccess(
                    context: context,
                    message:
                        'Delivery with requestId $requestId pickup initiated successfully.',
                  );
                  Navigator.pushAndRemoveUntil(
                    context,
                    HomePage.route(),
                    (_) => false,
                  );
                  break;
                default:
                  OverlayLoader.hide();
                  break;
              }
            },
          ),
          BlocListener<SendOtpBloc, SendOtpState>(
            listener: (context, state) {
              switch (state) {
                case SendOtpLoading():
                  OverlayLoader.show(context, message: 'Sending OTP...');
                  break;
                case SendOtpError(error: final error):
                  OverlayLoader.hide();
                  CustomSnackbar.showError(context: context, message: error);
                  break;
                case SendOtpSuccess():
                  OverlayLoader.hide();
                  CustomSnackbar.showSuccess(
                    context: context,
                    message: 'OTP sent successfully.',
                  );
                  break;
                default:
                  OverlayLoader.hide();
                  break;
              }
            },
          ),
        ],
        child: BlocBuilder<DeliveryRequestDetailsCubit, DeliveryRequestDetailsState>(
          builder: (context, state) {
            return switch (state) {
              DeliveryRequestDetailsLoading() => const CustomLoaderWidget(
                message: 'Loading delivery request details...',
              ),
              DeliveryRequestDetailsError(message: final message) =>
                CustomErrorWidget(
                  errorMessage: message,
                  isDark: isDark,
                  onRetry: _deliveryDetailsHelper.deliveryRequestDetailsInit,
                ),
              DeliveryRequestDetailsSuccess(:final deliveryRequest) => Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          // Delivery Progress Card
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: cardColor,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.05),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Delivery Progress',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: textPrimaryColor,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                ProgressTimeline(
                                  deliveryId: widget.deliveryRequestId,
                                  isDark: isDark,
                                  primaryColor: primaryColor,
                                  textPrimaryColor: textPrimaryColor,
                                  textSecondaryColor: textSecondaryColor,
                                  deliveryStatus:
                                      deliveryRequest.deliveryStatus,
                                  otp: deliveryRequest.otp,
                                  onStartPressed:
                                      _deliveryDetailsHelper.startPickup,
                                  onOtpShared: () {
                                    if (deliveryRequest.otp != null) {
                                      _deliveryDetailsHelper.shareOtp(
                                        deliveryRequest.dropOffPhoneNumber,
                                        deliveryRequest.otp!,
                                      );
                                    }
                                  },
                                  feedbackSubmitted:
                                      deliveryRequest.feedbackSubmitted ??
                                      false,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Location Details Card
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: cardColor,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.05),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Location Details',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: textPrimaryColor,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                DeliveryLocationSection(
                                  title: 'Pickup',
                                  icon: Icons.location_on,
                                  address: deliveryRequest.pickupAddress,
                                  remark: deliveryRequest.pickupRemarks,
                                  date: dateFormat.format(
                                    deliveryRequest.pickupDate.toDate(),
                                  ),
                                  primaryColor: primaryColor,
                                  textSecondaryColor: textSecondaryColor,
                                  textPrimaryColor: textPrimaryColor,
                                ),
                                const SizedBox(height: 16),
                                Divider(color: Colors.grey[200]),
                                const SizedBox(height: 16),
                                DeliveryLocationSection(
                                  title: 'Drop-off',
                                  icon: Icons.flag,
                                  address: deliveryRequest.dropOffAddress,
                                  phone:
                                      'Phone: ${deliveryRequest.dropOffPhoneNumber}',
                                  remark: deliveryRequest.dropOffRemarks,
                                  date:
                                      'Estimated: ${deliveryRequest.preferredDeliveryTime.value}',
                                  primaryColor: primaryColor,
                                  textSecondaryColor: textSecondaryColor,
                                  textPrimaryColor: textPrimaryColor,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Package Details Card
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: cardColor,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.05),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Package Details',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: textPrimaryColor,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                PackageDetailsGrid(
                                  textSecondaryColor: textSecondaryColor,
                                  textPrimaryColor: textPrimaryColor,
                                  isSmallScreen: isSmallScreen,
                                  packageType: deliveryRequest.packageType,
                                  weight: deliveryRequest.packageWeight,
                                  urgency: deliveryRequest.urgency,
                                  imageUrl: deliveryRequest.itemImageUrl,
                                  remarks: deliveryRequest.itemRemarks,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              _ => const SizedBox.shrink(),
            };
          },
        ),
      ),
    );
  }
}
