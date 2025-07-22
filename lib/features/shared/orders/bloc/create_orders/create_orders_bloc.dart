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
    on<_CreateOrdersWithCashOnDelivery>(_onCreateOrders);
    on<_CreateOrdersWithKhalti>(_onCreateOrderWithKhalti);
  }

  Future<void> _onCreateOrders(
    _CreateOrdersWithCashOnDelivery event,
    Emitter<CreateOrdersState> emit,
  ) async {
    emit(CreateOrdersState.loading());

    final result = await _orderRepository.createOrder(event.payload);

    await result.fold(
      (failure) async => emit(CreateOrdersState.failure(failure)),
      (order) async {
        await _codPayment(emit, order.id);
      },
    );
  }

  Future<void> _codPayment(Emitter<CreateOrdersState> emit, int orderId) async {
    final confirmCODPaymentResult = await _orderRepository.confirmCodPayment(
      orderId,
    );

    confirmCODPaymentResult.fold(
      (failure) => emit(CreateOrdersState.failure(failure)),
      (msg) => emit(CreateOrdersState.loaded(msg)),
    );
  }

  Future<void> _onCreateOrderWithKhalti(
    _CreateOrdersWithKhalti event,
    Emitter<CreateOrdersState> emit,
  ) async {
    emit(CreateOrdersState.loading());

    final result = await _orderRepository.createOrder(event.payload);

    result.fold((failure) => emit(CreateOrdersState.failure(failure)), (order) {
      emit(CreateOrdersState.loaded(order.id.toString()));
      
    });

    // if (success) {
    //   final confirmCODPaymentResult = await _orderRepository.verifyKhalti(
    //     orderId,
    //   );

    //   confirmCODPaymentResult.fold(
    //     (failure) => emit(CreateOrdersState.failure(failure)),
    //     (confirmedOrder) => emit(
    //       CreateOrdersState.loaded(
    //         'Order created successfully with COD payment: ${confirmedOrder.paymentMethod}',
    //       ),
    //     ),
    //   );
    // }
  }
}
