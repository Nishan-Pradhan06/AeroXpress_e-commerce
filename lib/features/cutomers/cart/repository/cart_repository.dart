import 'package:dartz/dartz.dart';
import 'package:deal_sell/common/typedef/either_type.dart';
import 'package:deal_sell/core/network/api_services.dart';
import '../models/cart_model.dart';

//##-------------------CART REPOSITORY-------------------------##
abstract interface class CartRepository {
  /// Get current user's cart
  FutureEither<CartModel> getCart();

  FutureEither<CartModel> addToCart(
    int productId,
    int quantity, [
    int? variantId,
  ]);
}

//##-------------------CART REPOSITORY IMPLEMENTATION-------------------------##
class CartRepositoryImpl implements CartRepository {
  final ApiService _apiService;

  CartRepositoryImpl({required ApiService apiService})
    : _apiService = apiService;

  @override
  FutureEither<CartModel> getCart() async {
    final response = await _apiService.get<Map>('cart');

    return response.fold((failure) => Left(failure), (data) {
      final cartData = data['data']['cart'];
      final cart = CartModel.fromMap(cartData);
      return Right(cart);
    });
  }

  //##---------------------ADD TO CART REPOSITORY IMPLEMENTATION----------####
  @override
  FutureEither<CartModel> addToCart(
    int productId,
    int quantity, [
    int? variantId,
  ]) async {
    final response = await _apiService.post<Map>(
      'cart/add',
      data: {
        'productId': productId,
        'quantity': quantity,
        if (variantId != null) 'variantId': variantId,
      },
    );

    return response.fold((failure) => Left(failure), (data) {
      final cartData = data['data'];
      final cart = CartModel.fromMap(cartData);
      return Right(cart);
    });
  }
}
