// package_type_selection_widget.dart
import 'package:flutter/material.dart';
import 'package:throw_user/core/constants/app_colors.dart';

class PackageTypeSelectionWidget extends StatelessWidget {
  final String? selectedPackageType;
  final Function(String?) onSelectingPackageType;

  const PackageTypeSelectionWidget({
    super.key,
    required this.selectedPackageType,
    required this.onSelectingPackageType,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return DropdownButtonFormField<String>(
      value: selectedPackageType,
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        hintText: 'Package Type',
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
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a package type';
        }
        return null;
      },
      items: const [
        DropdownMenuItem(value: 'Document', child: Text('Document')),
        DropdownMenuItem(value: 'Small Box', child: Text('Small Box')),
        DropdownMenuItem(value: 'Large Box', child: Text('Large Box')),
        DropdownMenuItem(value: 'Fragile', child: Text('Fragile')),
      ],
      onChanged: onSelectingPackageType,
    );
  }
}
