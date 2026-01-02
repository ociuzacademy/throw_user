part of 'delivery_request_bids_cubit.dart';

@freezed
sealed class DeliveryRequestBidsState with _$DeliveryRequestBidsState {
  const factory DeliveryRequestBidsState.initial() = DeliveryRequestBidsInitial;
  const factory DeliveryRequestBidsState.loading() = DeliveryRequestBidsLoading;
  const factory DeliveryRequestBidsState.loaded(List<BidModel> bids) =
      DeliveryRequestBidsLoaded;
  const factory DeliveryRequestBidsState.empty() = DeliveryRequestBidsEmpty;
  const factory DeliveryRequestBidsState.error(String message) =
      DeliveryRequestBidsError;
}
