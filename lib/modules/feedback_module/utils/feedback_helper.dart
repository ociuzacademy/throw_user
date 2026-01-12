// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:throw_user/core/exports/bloc_exports.dart';

class FeedbackHelper {
  final BuildContext context;
  final String deliveryRequestId;
  final ValueNotifier<int> selectedRating;
  final TextEditingController commentController;
  const FeedbackHelper({
    required this.context,
    required this.deliveryRequestId,
    required this.selectedRating,
    required this.commentController,
  });

  void updateRating(int rating) {
    selectedRating.value = rating;
  }

  void submitFeedback() {
    final rating = selectedRating.value;
    final comment = commentController.text.trim();

    final FeedbackBloc bloc = context.read<FeedbackBloc>();
    bloc.add(
      FeedbackEvent.submittingFeedback(
        deliveryRequestId: deliveryRequestId,
        feedbackText: comment,
        rating: rating,
      ),
    );
  }
}
