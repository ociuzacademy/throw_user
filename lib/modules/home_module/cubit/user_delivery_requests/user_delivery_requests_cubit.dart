import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:throw_user/core/models/delivery_request_model.dart';
import 'package:throw_user/core/repository/delivery_request_repository.dart';
import 'package:throw_user/core/storage/auth_storage_functions.dart';

part 'user_delivery_requests_state.dart';
part 'user_delivery_requests_cubit.freezed.dart';

class UserDeliveryRequestsCubit extends Cubit<UserDeliveryRequestsState> {
  final DeliveryRequestRepository _deliveryRequestRepository;
  UserDeliveryRequestsCubit({
    required DeliveryRequestRepository deliveryRequestRepository,
  }) : _deliveryRequestRepository = deliveryRequestRepository,
       super(const UserDeliveryRequestsState.initial());

  Future<void> getUserDeliveryRequests() async {
    emit(const UserDeliveryRequestsState.loading());
    try {
      final String? userId = await AuthStorageFunctions().getUid();
      if (userId == null) {
        emit(const UserDeliveryRequestsState.error('User ID not found'));
        return;
      }
      final List<DeliveryRequestModel> deliveryRequests =
          await _deliveryRequestRepository.getDeliveryRequestsByUser(userId);
      if (deliveryRequests.isEmpty) {
        emit(const UserDeliveryRequestsState.empty());
      } else {
        emit(UserDeliveryRequestsState.loaded(deliveryRequests));
      }
    } catch (e) {
      emit(UserDeliveryRequestsState.error(e.toString()));
    }
  }
}
