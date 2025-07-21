part of 'create_orders_bloc.dart';

@freezed
class CreateOrdersEvent with _$CreateOrdersEvent {
  // Include payload for creating order
  const factory CreateOrdersEvent.createOrders({
    required Map<String, dynamic> payload,
  }) = _CreateOrders;
}
