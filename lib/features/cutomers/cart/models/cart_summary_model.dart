class CartSummaryModel {
  final double subtotal;
  final double shippingFee;
  final double taxAmount;
  final double discountAmount;
  final double total;
  final int itemCount;

  CartSummaryModel({
    required this.subtotal,
    required this.shippingFee,
    required this.taxAmount,
    required this.discountAmount,
    required this.total,
    required this.itemCount,
  });

  factory CartSummaryModel.fromMap(Map<String, dynamic> map) {
    return CartSummaryModel(
      subtotal: (map['subtotal'] ?? 0).toDouble(),
      shippingFee: (map['shippingFee'] ?? 0).toDouble(),
      taxAmount: (map['taxAmount'] ?? 0).toDouble(),
      discountAmount: (map['discountAmount'] ?? 0).toDouble(),
      total: (map['total'] ?? 0).toDouble(),
      itemCount: map['itemCount'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() => {
    'subtotal': subtotal,
    'shippingFee': shippingFee,
    'taxAmount': taxAmount,
    'discountAmount': discountAmount,
    'total': total,
    'itemCount': itemCount,
  };
}
