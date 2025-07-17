class OrderModel {
  final int id;
  final String orderNumber;
  final String status;
  final String paymentMethod;
  final String paymentStatus;
  final String subtotal;
  final String shippingFee;
  final String total;
  final ShippingAddressModel shippingAddress;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<OrderItemModel> items;

  OrderModel({
    required this.id,
    required this.orderNumber,
    required this.status,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.subtotal,
    required this.shippingFee,
    required this.total,
    required this.shippingAddress,
    required this.createdAt,
    required this.updatedAt,
    required this.items,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      orderNumber: json['orderNumber'],
      status: json['status'],
      paymentMethod: json['paymentMethod'],
      paymentStatus: json['paymentStatus'],
      subtotal: json['subtotal'],
      shippingFee: json['shippingFee'],
      total: json['total'],
      shippingAddress: ShippingAddressModel.fromJson(json['shippingAddress']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      items:
          (json['items'] as List)
              .map((e) => OrderItemModel.fromJson(e))
              .toList(),
    );
  }
}

class OrderItemModel {
  final int id;
  final int orderId;
  final int productId;
  final int quantity;
  final String price;
  final dynamic salePrice;
  final ProductSnapshotModel productSnapshot;

  OrderItemModel({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.quantity,
    required this.price,
    required this.salePrice,
    required this.productSnapshot,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      id: json['id'],
      orderId: json['orderId'],
      productId: json['productId'],
      quantity: json['quantity'],
      price: json['price'],
      salePrice: json['salePrice'],
      productSnapshot: ProductSnapshotModel.fromJson(json['productSnapshot']),
    );
  }
}

class ProductSnapshotModel {
  final int id;
  final String name;
  final String slug;
  final num price;
  final dynamic salePrice;
  final String sku;

  ProductSnapshotModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.price,
    required this.salePrice,
    required this.sku,
  });

  factory ProductSnapshotModel.fromJson(Map<String, dynamic> json) {
    return ProductSnapshotModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      price: json['price'],
      salePrice: json['salePrice'],
      sku: json['sku'],
    );
  }
}

class ShippingAddressModel {
  final String? label;
  final String? recipientName;
  final String? street;
  final String? city;
  final String? state;
  final String? postalCode;
  final String? country;
  final String? phone;

  ShippingAddressModel({
    this.label,
    this.recipientName,
    this.street,
    this.city,
    this.state,
    this.postalCode,
    this.country,
    this.phone,
  });

  factory ShippingAddressModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return ShippingAddressModel();

    return ShippingAddressModel(
      label: json['label'],
      recipientName: json['recipientName'],
      street: json['street'],
      city: json['city'],
      state: json['state'],
      postalCode: json['postalCode'],
      country: json['country'],
      phone: json['phone'],
    );
  }
}

