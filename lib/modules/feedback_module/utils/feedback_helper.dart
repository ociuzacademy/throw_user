// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:throw_user/core/widgets/snackbars/custom_snackbar.dart';
import 'package:throw_user/modules/home_module/view/home_page.dart';

class FeedbackHelper {
  final BuildContext context;
  final ValueNotifier<int> selectedRating;
  final TextEditingController commentController;
  const FeedbackHelper({
    required this.context,
    required this.selectedRating,
    required this.commentController,
  });

  void updateRating(int rating) {
    selectedRating.value = rating;
  }

  void submitFeedback() {
    final rating = selectedRating.value;
    final comment = commentController.text.trim();

    // Here you would typically send the feedback to your backend
    debugPrint('Rating: $rating stars');
    debugPrint('Comment: $comment');

    // Show confirmation dialog or snackbar
    CustomSnackbar.showSuccess(
      context: context,
      message: 'Thank you for your feedback!',
    );

    // Optionally navigate back
    Navigator.pushAndRemoveUntil(context, HomePage.route(), (_) => false);
  }
}
