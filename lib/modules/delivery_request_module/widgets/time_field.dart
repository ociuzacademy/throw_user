// time_field.dart
import 'package:flutter/material.dart';

class TimeField extends StatelessWidget {
  final TextEditingController? timeController;
  final VoidCallback? onTimeTap;

  const TimeField({
    super.key,
    required this.timeController,
    required this.onTimeTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1f2937) : const Color(0xFFf6f7f8),
        border: Border.all(
          color: isDark ? const Color(0xFF374151) : const Color(0xFFe5e7eb),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        controller: timeController,
        readOnly: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          hintText: 'Time',
          hintStyle: TextStyle(
            color: isDark ? const Color(0xFF9ca3af) : const Color(0xFF6b7280),
          ),
          prefixIcon: Icon(
            Icons.schedule,
            color: isDark ? const Color(0xFF9ca3af) : const Color(0xFF6b7280),
            size: 20,
          ),
        ),
        style: TextStyle(
          color: isDark ? const Color(0xFFf9fafb) : const Color(0xFF111827),
        ),
        onTap: onTimeTap,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select time';
          }
          return null;
        },
      ),
    );
  }
}
