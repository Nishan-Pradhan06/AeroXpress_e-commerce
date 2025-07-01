import '../../products/models/products_model.dart';

class CartItemModel {
  final int id;
  final int cartId;
  final int productId;
  final int? variantId;
  final int quantity;
  final DateTime createdAt;
  final DateTime updatedAt;
  final ProductModel product;

  CartItemModel({
    required this.id,
    required this.cartId,
    required this.productId,
    this.variantId,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
    required this.product,
  });

  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    return CartItemModel(
      id: map['id'],
      cartId: map['cartId'],
      productId: map['productId'],
      variantId: map['variantId'],
      quantity: map['quantity'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      product: ProductModel.fromJson(map['product']),
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'cartId': cartId,
    'productId': productId,
    'variantId': variantId,
    'quantity': quantity,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
    'product': product.toMap(),
  };
}
