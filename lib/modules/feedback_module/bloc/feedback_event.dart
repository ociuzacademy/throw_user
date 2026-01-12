part of 'feedback_bloc.dart';

@freezed
sealed class FeedbackEvent with _$FeedbackEvent {
  const factory FeedbackEvent.started() = _Started;
  const factory FeedbackEvent.submittingFeedback({
    required String deliveryRequestId,
    required String feedbackText,
    required int rating,
  }) = _SubmittingFeedback;
}
