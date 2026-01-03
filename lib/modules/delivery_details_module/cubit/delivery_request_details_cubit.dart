import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:throw_user/core/models/delivery_request_model.dart';
import 'package:throw_user/core/repository/delivery_request_repository.dart';

part 'delivery_request_details_state.dart';
part 'delivery_request_details_cubit.freezed.dart';

class DeliveryRequestDetailsCubit extends Cubit<DeliveryRequestDetailsState> {
  final DeliveryRequestRepository _deliveryRequestRepository;
  DeliveryRequestDetailsCubit({
    required DeliveryRequestRepository deliveryRequestRepository,
  }) : _deliveryRequestRepository = deliveryRequestRepository,
       super(const DeliveryRequestDetailsState.initial());

  Future<void> getDeliveryRequestDetails(String deliveryRequestId) async {
    emit(const DeliveryRequestDetailsState.loading());
    try {
      final deliveryRequest = await _deliveryRequestRepository
          .getDeliveryRequestByRequestId(deliveryRequestId);
      if (deliveryRequest == null) {
        emit(
          const DeliveryRequestDetailsState.error('Delivery request not found'),
        );
        return;
      }
      emit(DeliveryRequestDetailsState.success(deliveryRequest));
    } catch (e) {
      emit(DeliveryRequestDetailsState.error(e.toString()));
    }
  }
}
