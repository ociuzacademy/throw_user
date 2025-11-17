// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:throw_user/modules/delivery_details_module/enums/delivery_status.dart';
import 'package:throw_user/modules/delivery_details_module/utils/delivery_details_helper.dart';
import 'package:throw_user/modules/delivery_details_module/widgets/location_section.dart';
import 'package:throw_user/modules/delivery_details_module/widgets/package_details_grid.dart';
import 'package:throw_user/modules/delivery_details_module/widgets/progress_timeline.dart';

class DeliveryDetailsPage extends StatefulWidget {
  const DeliveryDetailsPage({super.key});

  static route() => MaterialPageRoute(builder: (_) => DeliveryDetailsPage());

  @override
  State<DeliveryDetailsPage> createState() => _DeliveryDetailsPageState();
}

class _DeliveryDetailsPageState extends State<DeliveryDetailsPage> {
  late final DeliveryDetailsHelper _deliveryDetailsHelper;
  final ValueNotifier<DeliveryStatus> _deliveryStatus =
      ValueNotifier<DeliveryStatus>(DeliveryStatus.pickUp);
  final ValueNotifier<String?> _otp = ValueNotifier<String?>(null);

  @override
  void initState() {
    super.initState();
    _deliveryDetailsHelper = DeliveryDetailsHelper(
      deliveryStatus: _deliveryStatus,
      otp: _otp,
    );
  }

  @override
  void dispose() {
    _deliveryStatus.dispose();
    _otp.dispose();
    super.dispose();
  }

  // Add this method to handle OTP shared callback
  void _onOtpShared() {
    // Update delivery status to delivered when OTP is successfully shared
    _deliveryStatus.value = DeliveryStatus.delivered;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final isSmallScreen = screenWidth < 600;

    // Responsive dimensions
    final horizontalPadding = isSmallScreen ? 16.0 : 24.0;
    final cardPadding = isSmallScreen ? 16.0 : 24.0;
    final titleFontSize = isSmallScreen ? 18.0 : 20.0;
    final spacing = isSmallScreen ? 16.0 : 24.0;

    // Color definitions based on HTML
    final primaryColor = const Color(0xFF2694ed);
    final backgroundLight = const Color(0xFFf6f7f8);
    final backgroundDark = const Color(0xFF101a22);
    final cardLight = Colors.white;
    final cardDark = const Color(0xFF182430);
    final textPrimaryLight = const Color(0xFF111518);
    final textPrimaryDark = const Color(0xFFf6f7f8);
    final textSecondaryLight = const Color(0xFF617789);
    final textSecondaryDark = const Color(0xFF9badbd);

    final backgroundColor = isDark ? backgroundDark : backgroundLight;
    final cardColor = isDark ? cardDark : cardLight;
    final textPrimaryColor = isDark ? textPrimaryDark : textPrimaryLight;
    final textSecondaryColor = isDark ? textSecondaryDark : textSecondaryLight;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 4,
        shadowColor: Colors.black.withValues(alpha: 0.1),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(
          'Delivery Details',
          style: TextStyle(
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(horizontalPadding),
          child: Column(
            children: [
              SizedBox(height: spacing),

              // Delivery Progress Card
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(cardPadding),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                    if (isDark)
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delivery Progress',
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: textPrimaryColor,
                      ),
                    ),
                    SizedBox(height: spacing),

                    // Progress Timeline
                    ValueListenableBuilder<DeliveryStatus>(
                      valueListenable: _deliveryStatus,
                      builder: (context, status, child) {
                        return ValueListenableBuilder(
                          valueListenable: _otp,
                          builder: (context, otp, child) {
                            return ProgressTimeline(
                              isDark: isDark,
                              primaryColor: primaryColor,
                              textPrimaryColor: textPrimaryColor,
                              textSecondaryColor: textSecondaryColor,
                              deliveryStatus: status,
                              otp: otp,
                              onStartPressed:
                                  _deliveryDetailsHelper.startPickup,
                              onOtpShared:
                                  _onOtpShared, // Pass the callback here
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing),

              // Delivery Details Card
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(cardPadding),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                    if (isDark)
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delivery Details',
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: textPrimaryColor,
                      ),
                    ),
                    SizedBox(height: spacing),

                    // Pickup Section
                    LocationSection(
                      title: 'Pickup',
                      address:
                          '12, HSR Layout, Sector 6, Bengaluru, Karnataka 560102',
                      remark: '"Leave with security guard"',
                      date: 'July 05, 2024 at 10:30 AM',
                      primaryColor: primaryColor,
                      textSecondaryColor: textSecondaryColor,
                    ),

                    // Divider
                    Container(
                      height: 1,
                      margin: EdgeInsets.symmetric(
                        vertical: isSmallScreen ? 16.0 : 20.0,
                      ),
                      color: isDark
                          ? const Color(0xFF374151)
                          : const Color(0xFFe5e7eb),
                    ),

                    // Drop-off Section
                    LocationSection(
                      title: 'Drop-off',
                      address:
                          'A-45, Block A, Connaught Place, New Delhi, Delhi 110001',
                      phone: 'Phone: +91 98765 43210',
                      remark: '"Call upon arrival, flat no. 3B"',
                      date: 'Estimated: Evening',
                      primaryColor: primaryColor,
                      textSecondaryColor: textSecondaryColor,
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing),

              // Package Details Card
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(cardPadding),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                    if (isDark)
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Package Details',
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: textPrimaryColor,
                      ),
                    ),
                    SizedBox(height: isSmallScreen ? 16.0 : 20.0),

                    // Package Details Grid
                    PackageDetailsGrid(
                      textSecondaryColor: textSecondaryColor,
                      textPrimaryColor: textPrimaryColor,
                      isSmallScreen: isSmallScreen,
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing),
            ],
          ),
        ),
      ),
    );
  }
}
