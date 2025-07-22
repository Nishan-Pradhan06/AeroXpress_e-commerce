import 'package:deal_sell/core/state/bloc_base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repository/orders_repository.dart';

part 'create_orders_event.dart';
part 'create_orders_state.dart';
part 'create_orders_bloc.freezed.dart';

class CreateOrdersBloc extends Bloc<CreateOrdersEvent, CreateOrdersState> {
  final OrderRepository _orderRepository;

  CreateOrdersBloc({required OrderRepository repo})
    : _orderRepository = repo,
      super(CreateOrdersState.initial()) {
    on<_CreateOrders>(_onCreateOrders);
  }

  Future<void> _onCreateOrders(
    _CreateOrders event,
    Emitter<CreateOrdersState> emit,
  ) async {
    emit(CreateOrdersState.loading());

    final result = await _orderRepository.createOrder(event.payload);

    result.fold(
      (failure) => emit(CreateOrdersState.failure(failure)),
      (order) => emit(
        CreateOrdersState.loaded(
          'order created successfully ${order.paymentMethod}',
        ),
      ),
    );
  }
}
