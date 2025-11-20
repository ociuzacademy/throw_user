// delivery_request_page.dart (updated)

import 'package:flutter/material.dart';
import 'package:throw_user/modules/delivery_request_module/providers/delivery_request_provider.dart';

class WeightFieldWidget extends StatelessWidget {
  const WeightFieldWidget({
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
        color: isDark ? const Color(0xFF1f2937) : Colors.white,
        border: Border.all(
          color: isDark ? const Color(0xFF374151) : const Color(0xFFe5e7eb),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        controller: provider.weightController,
        keyboardType: TextInputType.number,
        style: TextStyle(color: isDark ? Colors.white : Colors.black),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          hintText: 'Weight (kg)',
          hintStyle: TextStyle(
            color: isDark ? const Color(0xFF9ca3af) : const Color(0xFF6b7280),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter weight';
          }
          final weight = double.tryParse(value);
          if (weight == null || weight <= 0) {
            return 'Please enter a valid weight';
          }
          return null;
        },
      ),
    );
  }
}
