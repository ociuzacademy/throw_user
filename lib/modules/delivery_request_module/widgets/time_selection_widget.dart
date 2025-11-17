// time_selection_widget.dart
import 'package:flutter/material.dart';
import 'package:throw_user/modules/delivery_request_module/widgets/time_slot_button.dart';

class TimeSelectionWidget extends StatelessWidget {
  final String selectedTime;
  final Function(String) onSelectingTime;

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
            color: isDark ? const Color(0xFFf9fafb) : const Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1f2937) : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isDark ? const Color(0xFF374151) : const Color(0xFFe5e7eb),
            ),
          ),
          child: Row(
            children: [
              TimeSlotButton(
                time: 'Morning',
                selectedTime: selectedTime,
                mutedTextColor: isDark
                    ? const Color(0xFF9ca3af)
                    : const Color(0xFF6b7280),
                onSelectingTimeSlot: () => onSelectingTime('Morning'),
              ),
              TimeSlotButton(
                time: 'Afternoon',
                selectedTime: selectedTime,
                mutedTextColor: isDark
                    ? const Color(0xFF9ca3af)
                    : const Color(0xFF6b7280),
                onSelectingTimeSlot: () => onSelectingTime('Afternoon'),
              ),
              TimeSlotButton(
                time: 'Evening',
                selectedTime: selectedTime,
                mutedTextColor: isDark
                    ? const Color(0xFF9ca3af)
                    : const Color(0xFF6b7280),
                onSelectingTimeSlot: () => onSelectingTime('Evening'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
