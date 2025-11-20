// delivery_request_page.dart (updated)

import 'package:flutter/material.dart';
import 'package:throw_user/modules/delivery_request_module/providers/delivery_request_provider.dart';
import 'package:throw_user/modules/delivery_request_module/widgets/urgency_dropdown_widget.dart';
import 'package:throw_user/modules/delivery_request_module/widgets/weight_field_widget.dart';

class WeightAndUrgencySection extends StatelessWidget {
  const WeightAndUrgencySection({
    super.key,
    required this.isMediumScreen,
    required this.isSmallScreen,
    required this.isDark,
    required this.provider,
  });

  final bool isMediumScreen;
  final bool isSmallScreen;
  final bool isDark;
  final DeliveryRequestProvider provider;

  @override
  Widget build(BuildContext context) {
    if (isMediumScreen) {
      return Column(
        children: [
          WeightFieldWidget(isDark: isDark, provider: provider),
          SizedBox(height: isSmallScreen ? 12 : 16),
          UrgencyDropdownWidget(isDark: isDark, provider: provider),
        ],
      );
    } else {
      return Row(
        children: [
          Expanded(
            child: WeightFieldWidget(isDark: isDark, provider: provider),
          ),
          SizedBox(width: isSmallScreen ? 12 : 16),
          Expanded(
            child: UrgencyDropdownWidget(isDark: isDark, provider: provider),
          ),
        ],
      );
    }
  }
}
