// preferred_date_field.dart
import 'package:flutter/material.dart';

class PreferredDateField extends StatelessWidget {
  final TextEditingController? preferredDateController;
  final VoidCallback? onPreferredDateTap;

  const PreferredDateField({
    super.key,
    required this.preferredDateController,
    required this.onPreferredDateTap,
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
        controller: preferredDateController,
        readOnly: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          hintText: 'Date',
          hintStyle: TextStyle(
            color: isDark ? const Color(0xFF9ca3af) : const Color(0xFF6b7280),
          ),
          prefixIcon: Icon(
            Icons.calendar_today,
            color: isDark ? const Color(0xFF9ca3af) : const Color(0xFF6b7280),
            size: 20,
          ),
        ),
        style: TextStyle(
          color: isDark ? const Color(0xFFf9fafb) : const Color(0xFF111827),
        ),
        onTap: onPreferredDateTap,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select date';
          }
          return null;
        },
      ),
    );
  }
}
