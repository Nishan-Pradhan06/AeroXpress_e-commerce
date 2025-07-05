part of 'delete_cart_bloc.dart';

@freezed
class DeleteCartEvent with _$DeleteCartEvent {
  const factory DeleteCartEvent.deleteCart() = _DeleteCart;
}