// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:throw_user/core/constants/app_colors.dart';

class BargainButton extends StatelessWidget {
  const BargainButton({
    super.key,
    required this.isAuctionActive,
    required this.agentLeftAuction,
    required this.showBargainBottomSheet,
    required this.fontSize,
    required this.horizontalPadding,
    required this.verticalPadding,
  });

  final bool isAuctionActive;
  final bool agentLeftAuction;
  final VoidCallback showBargainBottomSheet;
  final double fontSize;
  final double horizontalPadding;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isAuctionActive && !agentLeftAuction
          ? showBargainBottomSheet
          : null,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: const BorderSide(color: AppColors.primary),
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        'Bargain',
        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600),
      ),
    );
  }
}
