import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:throw_user/core/repository/delivery_request_repository.dart';
import 'package:throw_user/modules/delivery_request_module/data/delivery_request_data.dart';

part 'delivery_request_event.dart';
part 'delivery_request_state.dart';
part 'delivery_request_bloc.freezed.dart';

class DeliveryRequestBloc
    extends Bloc<DeliveryRequestEvent, DeliveryRequestState> {
  final DeliveryRequestRepository deliveryRequestRepository;
  DeliveryRequestBloc({required this.deliveryRequestRepository})
    : super(const DeliveryRequestInitial()) {
    on<_CreateDeliveryRequest>(_onCreateDeliveryRequest);
    on<_CancelRequest>(_onCancelRequest);
    on<_AcceptRequest>(_onAcceptRequest);
    on<_PayEscrowAmount>(_onPayEscrowAmount);
    on<_SetDeliveryOnTheWay>(_onSetDeliveryOnTheWay);
    on<_Reset>(_onReset);
  }

  Future<void> _onCreateDeliveryRequest(
    _CreateDeliveryRequest event,
    Emitter<DeliveryRequestState> emit,
  ) async {
    emit(const DeliveryRequestState.loading());
    try {
      final requestId = await deliveryRequestRepository.createDeliveryRequest(
        event.deliveryRequestData,
      );
      emit(
        DeliveryRequestState.createDeliveryRequestSuccess(requestId: requestId),
      );
    } catch (e) {
      emit(DeliveryRequestState.error(message: e.toString()));
    }
  }

  Future<void> _onCancelRequest(
    _CancelRequest event,
    Emitter<DeliveryRequestState> emit,
  ) async {
    emit(const DeliveryRequestState.loading());
    try {
      await deliveryRequestRepository.cancelRequest(event.requestId);
      emit(
        DeliveryRequestState.cancelRequestSuccess(requestId: event.requestId),
      );
    } catch (e) {
      emit(DeliveryRequestState.error(message: e.toString()));
    }
  }

  Future<void> _onAcceptRequest(
    _AcceptRequest event,
    Emitter<DeliveryRequestState> emit,
  ) async {
    emit(const DeliveryRequestState.loading());
    try {
      await deliveryRequestRepository.acceptRequest(
        event.requestId,
        event.deliveryAgentId,
        event.agreedDeliveryCharge,
      );
      emit(
        DeliveryRequestState.acceptRequestSuccess(requestId: event.requestId),
      );
    } catch (e) {
      emit(DeliveryRequestState.error(message: e.toString()));
    }
  }

  Future<void> _onPayEscrowAmount(
    _PayEscrowAmount event,
    Emitter<DeliveryRequestState> emit,
  ) async {
    emit(const DeliveryRequestState.loading());
    try {
      await deliveryRequestRepository.payEscrowAmount(event.requestId);
      emit(
        DeliveryRequestState.payEscrowAmountSuccess(requestId: event.requestId),
      );
    } catch (e) {
      emit(DeliveryRequestState.error(message: e.toString()));
    }
  }

  Future<void> _onSetDeliveryOnTheWay(
    _SetDeliveryOnTheWay event,
    Emitter<DeliveryRequestState> emit,
  ) async {
    emit(const DeliveryRequestState.loading());
    try {
      await deliveryRequestRepository.setDeliveryOnTheWay(event.requestId);
      emit(
        DeliveryRequestState.setDeliveryOnTheWaySuccess(
          requestId: event.requestId,
        ),
      );
    } catch (e) {
      emit(DeliveryRequestState.error(message: e.toString()));
    }
  }

  Future<void> _onReset(
    _Reset event,
    Emitter<DeliveryRequestState> emit,
  ) async {
    emit(const DeliveryRequestState.initial());
  }
}
