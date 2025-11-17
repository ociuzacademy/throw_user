// phone_field.dart
import 'package:flutter/material.dart';

class PhoneField extends StatelessWidget {
  final TextEditingController phoneController;

  const PhoneField({super.key, required this.phoneController});

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
        controller: phoneController,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          hintText: "Recipient's phone number",
          hintStyle: TextStyle(
            color: isDark ? const Color(0xFF9ca3af) : const Color(0xFF6b7280),
          ),
          prefixIcon: Icon(
            Icons.phone,
            color: isDark ? const Color(0xFF9ca3af) : const Color(0xFF6b7280),
            size: 20,
          ),
        ),
        style: TextStyle(
          color: isDark ? const Color(0xFFf9fafb) : const Color(0xFF111827),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter phone number';
          }
          return null;
        },
      ),
    );
  }
}
