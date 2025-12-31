// time_slot_button.dart
import 'package:flutter/material.dart';
import 'package:throw_user/core/constants/app_colors.dart';
import 'package:throw_user/core/exports/enum_exports.dart';

class TimeSlotButton extends StatelessWidget {
  final PreferedDeliveryTime time;
  final PreferedDeliveryTime selectedTime;
  final Color mutedTextColor;
  final VoidCallback onSelectingTimeSlot;

  const TimeSlotButton({
    super.key,
    required this.time,
    required this.selectedTime,
    required this.mutedTextColor,
    required this.onSelectingTimeSlot,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = selectedTime == time;

    return GestureDetector(
      onTap: onSelectingTimeSlot,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        alignment: Alignment.center,
        child: Text(
          time.value,
          style: TextStyle(
            color: isSelected ? Colors.white : mutedTextColor,
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
