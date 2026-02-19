// urgency_dropdown.dart
import 'package:flutter/material.dart';
import 'package:throw_user/core/constants/app_colors.dart';
import 'package:throw_user/core/exports/enum_exports.dart';

class UrgencyDropdown extends StatelessWidget {
  final Urgency? selectedUrgency;
  final Function(Urgency?) onSelectingUrgency;
  final String? Function(Urgency?)? validator;

  const UrgencyDropdown({
    super.key,
    required this.selectedUrgency,
    required this.onSelectingUrgency,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return DropdownButtonFormField<Urgency>(
      value: selectedUrgency,
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
      items: Urgency.values
          .map(
            (urgency) =>
                DropdownMenuItem(value: urgency, child: Text(urgency.value)),
          )
          .toList(),
      onChanged: onSelectingUrgency,
    );
  }
}
