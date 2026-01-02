part of 'delivery_request_bloc.dart';

@freezed
sealed class DeliveryRequestEvent with _$DeliveryRequestEvent {
  const factory DeliveryRequestEvent.started() = _Started;
  const factory DeliveryRequestEvent.createDeliveryRequest(
    DeliveryRequestData deliveryRequestData,
  ) = _CreateDeliveryRequest;
  const factory DeliveryRequestEvent.cancelRequest(String requestId) =
      _CancelRequest;
  const factory DeliveryRequestEvent.acceptRequest(
    String requestId,
    BidModel bid,
  ) = _AcceptRequest;
  const factory DeliveryRequestEvent.payEscrowAmount(String requestId) =
      _PayEscrowAmount;
  const factory DeliveryRequestEvent.setDeliveryOnTheWay(String requestId) =
      _SetDeliveryOnTheWay;
  const factory DeliveryRequestEvent.reset() = _Reset;
}
