// delivery_request_page.dart (updated)

import 'package:flutter/material.dart';
import 'package:throw_user/core/constants/app_colors.dart';
import 'package:throw_user/modules/delivery_request_module/providers/delivery_request_provider.dart';
import 'package:throw_user/modules/delivery_request_module/widgets/urgency_dropdown.dart';

class UrgencyDropdownWidget extends StatelessWidget {
  const UrgencyDropdownWidget({
    super.key,
    required this.isDark,
    required this.provider,
  });

  final bool isDark;
  final DeliveryRequestProvider provider;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: isDark ? AppColors.inactiveBackgroundDark : Colors.white,
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: UrgencyDropdown(
        selectedUrgency: provider.selectedUrgency,
        onSelectingUrgency: (value) {
          provider.setSelectedUrgency(value);
        },
        validator: provider.validateUrgency,
      ),
    );
  }
}
