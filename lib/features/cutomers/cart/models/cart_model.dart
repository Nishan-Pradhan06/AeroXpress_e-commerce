import 'cart_item_model.dart';
import 'cart_summary_model.dart';

class CartModel {
  final List<CartItemModel> items;
  final CartSummaryModel summary;

  CartModel({required this.items, required this.summary});

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      items:
          (map['items'] as List<dynamic>?)
              ?.map((x) => CartItemModel.fromMap(x))
              .toList() ??
          [],
      summary: CartSummaryModel.fromMap(map['summary'] ?? {}),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'items': items.map((x) => x.toMap()).toList(),
      'summary': summary.toMap(),
    };
  }
}
