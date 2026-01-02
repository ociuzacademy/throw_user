import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:throw_user/core/models/bid_model.dart';
import 'package:throw_user/core/repository/delivery_request_repository.dart';

part 'delivery_request_bids_state.dart';
part 'delivery_request_bids_cubit.freezed.dart';

class DeliveryRequestBidsCubit extends Cubit<DeliveryRequestBidsState> {
  final DeliveryRequestRepository _repository;
  StreamSubscription<List<BidModel>>? _subscription;

  DeliveryRequestBidsCubit(this._repository)
    : super(const DeliveryRequestBidsState.initial());

  void loadBids(String requestId) {
    emit(const DeliveryRequestBidsState.loading());
    _subscription?.cancel();
    _subscription = _repository
        .getDeliveryRequestBids(requestId)
        .listen(
          (bids) {
            if (bids.isEmpty) {
              emit(const DeliveryRequestBidsState.empty());
            } else {
              emit(DeliveryRequestBidsState.loaded(bids));
            }
          },
          onError: (error) {
            emit(DeliveryRequestBidsState.error(error.toString()));
          },
        );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
