part of 'feedback_bloc.dart';

@freezed
sealed class FeedbackState with _$FeedbackState {
  const factory FeedbackState.initial() = FeedbackInitial;
  const factory FeedbackState.loading() = FeedbackLoading;
  const factory FeedbackState.success() = FeedbackSuccess;
  const factory FeedbackState.error(String errorMessage) = FeedbackError;
}
