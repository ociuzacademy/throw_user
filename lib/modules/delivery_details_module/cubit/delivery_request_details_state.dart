part of 'delivery_request_details_cubit.dart';

@freezed
sealed class DeliveryRequestDetailsState with _$DeliveryRequestDetailsState {
  const factory DeliveryRequestDetailsState.initial() =
      DeliveryRequestDetailsInitial;
  const factory DeliveryRequestDetailsState.loading() =
      DeliveryRequestDetailsLoading;
  const factory DeliveryRequestDetailsState.success(
    DeliveryRequestModel deliveryRequest,
  ) = DeliveryRequestDetailsSuccess;
  const factory DeliveryRequestDetailsState.error(String message) =
      DeliveryRequestDetailsError;
}
