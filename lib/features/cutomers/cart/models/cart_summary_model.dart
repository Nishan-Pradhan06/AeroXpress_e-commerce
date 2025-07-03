class CartSummaryModel {
  final int subtotal;
  final int shippingFee;
  final int taxAmount;
  final int discountAmount;
  final int total;
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
      subtotal: map['subtotal'] ?? 0,
      shippingFee: map['shippingFee'] ?? 0,
      taxAmount: map['taxAmount'] ?? 0,
      discountAmount: map['discountAmount'] ?? 0,
      total: map['total'] ?? 0,
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
