// time_selection_widget.dart
import 'package:flutter/material.dart';
import 'package:throw_user/core/constants/app_colors.dart';
import 'package:throw_user/core/exports/enum_exports.dart';
import 'package:throw_user/modules/delivery_request_module/widgets/time_slot_button.dart';

class TimeSelectionWidget extends StatelessWidget {
  final PreferedDeliveryTime selectedTime;
  final Function(PreferedDeliveryTime) onSelectingTime;

  const TimeSelectionWidget({
    super.key,
    required this.selectedTime,
    required this.onSelectingTime,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Preferred Delivery Time',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isDark
                ? AppColors.textPrimaryDark
                : AppColors.textPrimaryLight,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: isDark ? AppColors.cardDark : Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: TimeSlotButton(
                  time: PreferedDeliveryTime.morning,
                  selectedTime: selectedTime,
                  mutedTextColor: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                  onSelectingTimeSlot: () =>
                      onSelectingTime(PreferedDeliveryTime.morning),
                ),
              ),
              Expanded(
                child: TimeSlotButton(
                  time: PreferedDeliveryTime.afternoon,
                  selectedTime: selectedTime,
                  mutedTextColor: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                  onSelectingTimeSlot: () =>
                      onSelectingTime(PreferedDeliveryTime.afternoon),
                ),
              ),
              Expanded(
                child: TimeSlotButton(
                  time: PreferedDeliveryTime.evening,
                  selectedTime: selectedTime,
                  mutedTextColor: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                  onSelectingTimeSlot: () =>
                      onSelectingTime(PreferedDeliveryTime.evening),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
