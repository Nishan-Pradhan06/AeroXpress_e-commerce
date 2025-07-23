import 'package:deal_sell/core/state/bloc_base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repository/orders_repository.dart';

part 'update_vendor_order_status_event.dart';
part 'update_vendor_order_status_state.dart';
part 'update_vendor_order_status_bloc.freezed.dart';

class UpdateVendorOrderStatusBloc
    extends Bloc<UpdateVendorOrderStatusEvent, UpdateVendorOrderStatusState> {
  final OrderRepository _orderRepository;
  UpdateVendorOrderStatusBloc({required OrderRepository repo})
    : _orderRepository = repo,
      super(UpdateVendorOrderStatusState.initial()) {
    on<_UpdateVendorOrderStatus>(_onUpdateVendorOrderStatus);
  }

  Future<void> _onUpdateVendorOrderStatus(
    _UpdateVendorOrderStatus event,
    Emitter<UpdateVendorOrderStatusState> emit,
  ) async {
    emit(UpdateVendorOrderStatusState.loading());

    final response = await _orderRepository.updateVendorOrderStatus(
      orderId: event.orderId,
      status: event.status,
    );

    response.fold(
      (failure) => emit(UpdateVendorOrderStatusState.failure(failure)),
      (successMessage) =>
          emit(UpdateVendorOrderStatusState.loaded(successMessage)),
    );
  }
}
