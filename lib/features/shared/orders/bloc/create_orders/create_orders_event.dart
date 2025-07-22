part of 'create_orders_bloc.dart';

@freezed
abstract class CreateOrdersEvent with _$CreateOrdersEvent {
  // Include payload for creating order
  const factory CreateOrdersEvent.createOrderWithCashOnDelivery({
    required Map<String, dynamic> payload,
  }) = _CreateOrdersWithCashOnDelivery;

  const factory CreateOrdersEvent.createORderWithKhalti({
    required Map<String, dynamic> payload,
  }) = _CreateOrdersWithKhalti;
}
