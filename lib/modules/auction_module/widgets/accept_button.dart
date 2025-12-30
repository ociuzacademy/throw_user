// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:throw_user/core/constants/app_colors.dart';

class AcceptButton extends StatelessWidget {
  const AcceptButton({
    super.key,
    required this.isAuctionActive,
    required this.agentLeftAuction,
    required this.showAcceptBidDialog,
    required this.fontSize,
    required this.horizontalPadding,
    required this.verticalPadding,
  });

  final bool isAuctionActive;
  final bool agentLeftAuction;
  final VoidCallback showAcceptBidDialog;
  final double fontSize;
  final double horizontalPadding;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isAuctionActive && !agentLeftAuction
          ? () {
              showAcceptBidDialog();
            }
          : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        'Accept',
        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600),
      ),
    );
  }
}
