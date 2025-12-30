// urgency_dropdown.dart
import 'package:flutter/material.dart';
import 'package:throw_user/core/constants/app_colors.dart';

class UrgencyDropdown extends StatelessWidget {
  final String? selectedUrgency;
  final Function(String?) onSelectingUrgency;
  final String? Function(String?)? validator;

  const UrgencyDropdown({
    super.key,
    required this.selectedUrgency,
    required this.onSelectingUrgency,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return DropdownButtonFormField<String>(
      initialValue: selectedUrgency,
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        hintText: 'Urgency',
        hintStyle: TextStyle(
          color: isDark
              ? AppColors.textSecondaryDark
              : AppColors.textSecondaryLight,
        ),
      ),
      dropdownColor: isDark ? AppColors.inactiveBackgroundDark : Colors.white,
      style: TextStyle(
        color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
      ),
      icon: Icon(
        Icons.arrow_drop_down,
        color: isDark
            ? AppColors.textSecondaryDark
            : AppColors.textSecondaryLight,
      ),
      validator: validator,
      items: const [
        DropdownMenuItem(value: 'Standard', child: Text('Standard')),
        DropdownMenuItem(value: 'Express', child: Text('Express')),
        DropdownMenuItem(value: 'Overnight', child: Text('Overnight')),
      ],
      onChanged: onSelectingUrgency,
    );
  }
}
