import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:throw_user/core/repository/feedback_repository.dart';

part 'feedback_event.dart';
part 'feedback_state.dart';
part 'feedback_bloc.freezed.dart';

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  final FeedbackRepository _feedbackRepository;
  FeedbackBloc({required FeedbackRepository feedbackRepository})
    : _feedbackRepository = feedbackRepository,
      super(const FeedbackState.initial()) {
    on<_SubmittingFeedback>(_onSubmittingFeedback);
  }

  Future<void> _onSubmittingFeedback(
    _SubmittingFeedback event,
    Emitter<FeedbackState> emit,
  ) async {
    emit(const FeedbackLoading());
    try {
      await _feedbackRepository.submitFeedback(
        deliveryRequestId: event.deliveryRequestId,
        feedbackText: event.feedbackText,
        rating: event.rating,
      );
      emit(const FeedbackSuccess());
    } catch (e) {
      emit(FeedbackError(e.toString()));
    }
  }
}
