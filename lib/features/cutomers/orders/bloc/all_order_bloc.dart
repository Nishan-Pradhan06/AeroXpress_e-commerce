import 'package:deal_sell/core/state/bloc_base_state.dart';
import 'package:deal_sell/features/cutomers/orders/model/order_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../repository/all_orders_repository.dart';

part 'all_order_event.dart';
part 'all_order_state.dart';
part 'all_order_bloc.freezed.dart';

class AllOrderBloc extends Bloc<AllOrderEvent, AllOrderState> {
  final OrderRepository _orderRepository;
  AllOrderBloc({required OrderRepository repo})
    : _orderRepository = repo,
      super(AllOrderState.initial()) {
    on<_GetAllOrder>(_onGetAllOrder);
  }

  Future<void> _onGetAllOrder(
    _GetAllOrder event,
    Emitter<AllOrderState> emit,
  ) async {
    emit(AllOrderState.loading());

    final result = await _orderRepository.getOrders();

    result.fold(
      (failure) => emit(AllOrderState.failure(failure)),
      (getAllOrder) => emit(AllOrderState.loaded(getAllOrder)),
    );
  }
}
