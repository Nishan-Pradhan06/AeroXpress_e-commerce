import 'package:deal_sell/core/state/bloc_base_state.dart';
import 'package:deal_sell/features/shared/orders/model/order_model.dart';
import 'package:deal_sell/features/shared/orders/repository/orders_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendor_orders_event.dart';
part 'vendor_orders_state.dart';
part 'vendor_orders_bloc.freezed.dart';

class VendorOrdersBloc extends Bloc<VendorOrdersEvent, VendorOrdersState> {
  final OrderRepository _orderRepository;
  VendorOrdersBloc({required OrderRepository repo})
    : _orderRepository = repo,
      super(VendorOrdersState.initial()) {
    on<_VendorOrders>(_onVendorOrder);
  }

  Future<void> _onVendorOrder(
    _VendorOrders event,
    Emitter<VendorOrdersState> emit,
  ) async {
    emit(VendorOrdersState.loading());

    final result = await _orderRepository.getVendorOrders();

    result.fold(
      (failure) => emit(VendorOrdersState.failure(failure)),
      (getVendorOrder) => emit(VendorOrdersState.loaded(getVendorOrder)),
    );
  }
}
