part of 'add_to_cart_bloc.dart';

@freezed
class AddToCartEvent with _$AddToCartEvent {
  const factory AddToCartEvent.addToCart({
    required int productId,
    required int quantity,
  }) = _AddToCart;
}
