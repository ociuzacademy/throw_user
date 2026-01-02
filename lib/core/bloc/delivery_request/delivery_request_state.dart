part of 'delivery_request_bloc.dart';

@freezed
sealed class DeliveryRequestState with _$DeliveryRequestState {
  const factory DeliveryRequestState.initial() = DeliveryRequestInitial;
  const factory DeliveryRequestState.loading() = DeliveryRequestLoading;
  const factory DeliveryRequestState.createDeliveryRequestSuccess({
    required String requestId,
  }) = CreateDeliveryRequestSuccess;
  const factory DeliveryRequestState.cancelRequestSuccess({
    required String requestId,
  }) = CancelRequestSuccess;
  const factory DeliveryRequestState.acceptRequestSuccess({
    required BidModel bid,
  }) = AcceptRequestSuccess;
  const factory DeliveryRequestState.payEscrowAmountSuccess({
    required String requestId,
  }) = PayEscrowAmountSuccess;
  const factory DeliveryRequestState.setDeliveryOnTheWaySuccess({
    required String requestId,
  }) = SetDeliveryOnTheWaySuccess;
  const factory DeliveryRequestState.error({required String message}) =
      DeliveryRequestError;
}
