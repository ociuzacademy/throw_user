part of 'user_delivery_requests_cubit.dart';

@freezed
sealed class UserDeliveryRequestsState with _$UserDeliveryRequestsState {
  const factory UserDeliveryRequestsState.initial() =
      UserDeliveryRequestsInitial;
  const factory UserDeliveryRequestsState.loading() =
      UserDeliveryRequestsLoading;
  const factory UserDeliveryRequestsState.loaded(
    List<DeliveryRequestModel> deliveryRequests,
  ) = UserDeliveryRequestsLoaded;
  const factory UserDeliveryRequestsState.empty() = UserDeliveryRequestsEmpty;
  const factory UserDeliveryRequestsState.error(String message) =
      UserDeliveryRequestsError;
}
