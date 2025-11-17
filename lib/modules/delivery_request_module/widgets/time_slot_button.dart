// time_slot_button.dart
import 'package:flutter/material.dart';

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
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF2694ed) : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xFF2694ed).withValues(alpha: 0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: TextButton(
          onPressed: onSelectingTimeSlot,
          child: Text(
            time,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : mutedTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
