// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:throw_user/core/constants/app_colors.dart';

import 'package:throw_user/core/models/bid.dart';
import 'package:throw_user/modules/auction_module/typedefs/submit_bargain.dart';

class BargainBottomSheet extends StatefulWidget {
  final BuildContext context;
  final Bid bid;
  final TextTheme textTheme;
  final SubmitBargain submitBargain;
  const BargainBottomSheet({
    super.key,
    required this.context,
    required this.bid,
    required this.textTheme,
    required this.submitBargain,
  });

  @override
  State<BargainBottomSheet> createState() => _BargainBottomSheetState();
}

class _BargainBottomSheetState extends State<BargainBottomSheet> {
  final TextEditingController _bargainController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Pre-fill with current price if no bargain exists, or with bargained price if it does
    _bargainController.text =
        widget.bid.bargainedPrice?.toStringAsFixed(2) ??
        widget.bid.price.toStringAsFixed(2);
  }

  @override
  void dispose() {
    super.dispose();
    _bargainController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Bid bid = widget.bid;
    final TextTheme textTheme = widget.textTheme;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bargain with ${bid.name}',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 16),

            // Show current bid price
            Text(
              'Current Bid: \u20B9${bid.price.toStringAsFixed(2)}',
              style: textTheme.bodyMedium!.copyWith(
                color: isDark ? Colors.white : Colors.black,
              ),
            ),

            // Show previous bargained price if exists
            if (bid.bargainedPrice != null) ...[
              const SizedBox(height: 8),
              Text(
                'Previous Bargain: \u20B9${bid.bargainedPrice!.toStringAsFixed(2)}',
                style: textTheme.bodyMedium?.copyWith(color: Colors.green),
              ),
            ],

            const SizedBox(height: 16),
            TextFormField(
              controller: _bargainController,
              style: TextStyle(color: isDark ? Colors.white : Colors.black),
              decoration: const InputDecoration(
                labelText: 'Your Bargain Amount',
                hintText: 'Enter your counter offer',
                border: OutlineInputBorder(),
                prefixText: '\u20B9',
              ),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 24),

            Row(
              children: [
                // Cancel button
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.grey,
                      side: const BorderSide(color: Colors.grey),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 12),

                // Submit bargain button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      final double? bargainAmount = double.tryParse(
                        _bargainController.text,
                      );
                      if (bargainAmount != null && bargainAmount > 0) {
                        Navigator.of(context).pop();
                        widget.submitBargain(bargainAmount);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter a valid amount'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text('Submit Bargain'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
