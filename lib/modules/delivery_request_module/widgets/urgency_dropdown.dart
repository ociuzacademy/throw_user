// urgency_dropdown.dart
import 'package:flutter/material.dart';

class UrgencyDropdown extends StatelessWidget {
  final String? selectedUrgency;
  final Function(String?) onSelectingUrgency;

  const UrgencyDropdown({
    super.key,
    required this.selectedUrgency,
    required this.onSelectingUrgency,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return DropdownButtonFormField<String>(
      value: selectedUrgency,
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        hintText: 'Urgency',
        hintStyle: TextStyle(
          color: isDark ? const Color(0xFF9ca3af) : const Color(0xFF6b7280),
        ),
      ),
      dropdownColor: isDark ? const Color(0xFF1f2937) : Colors.white,
      style: TextStyle(
        color: isDark ? const Color(0xFFf9fafb) : const Color(0xFF111827),
      ),
      icon: Icon(
        Icons.arrow_drop_down,
        color: isDark ? const Color(0xFF9ca3af) : const Color(0xFF6b7280),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select urgency';
        }
        return null;
      },
      items: const [
        DropdownMenuItem(value: 'Standard', child: Text('Standard')),
        DropdownMenuItem(value: 'Express', child: Text('Express')),
        DropdownMenuItem(value: 'Overnight', child: Text('Overnight')),
      ],
      onChanged: onSelectingUrgency,
    );
  }
}
