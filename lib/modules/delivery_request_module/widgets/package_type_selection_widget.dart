// package_type_selection_widget.dart
import 'package:flutter/material.dart';
import 'package:throw_user/core/constants/app_colors.dart';
import 'package:throw_user/core/exports/enum_exports.dart';

class PackageTypeSelectionWidget extends StatelessWidget {
  final PackageType? selectedPackageType;
  final Function(PackageType?) onSelectingPackageType;
  final String? Function(PackageType?)? validator;

  const PackageTypeSelectionWidget({
    super.key,
    required this.selectedPackageType,
    required this.onSelectingPackageType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : Colors.white,
        border: Border.all(color: AppColors.getBorderColor(isDark)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonFormField<PackageType>(
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
        dropdownColor: isDark ? AppColors.cardDark : Colors.white,
        style: TextStyle(
          color: isDark
              ? AppColors.textPrimaryDark
              : AppColors.textPrimaryLight,
        ),
        icon: Icon(
          Icons.arrow_drop_down,
          color: isDark
              ? AppColors.textSecondaryDark
              : AppColors.textSecondaryLight,
        ),
        validator: validator,
        items: PackageType.values
            .map(
              (type) => DropdownMenuItem(value: type, child: Text(type.value)),
            )
            .toList(),
        onChanged: onSelectingPackageType,
      ),
    );
  }
}
