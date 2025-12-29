// time_slot_button.dart
import 'package:flutter/material.dart';
import 'package:throw_user/core/constants/app_colors.dart';

class TimeSlotButton extends StatelessWidget {
  final String time;
  final String selectedTime;
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
    final isSelected = time == selectedTime;
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: InkWell(
          onTap: onSelectingTimeSlot,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              time,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : mutedTextColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
