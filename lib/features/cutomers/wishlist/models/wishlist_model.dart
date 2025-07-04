class WishlistProduct {
  final int id;
  final String name;
  final String description;
  final double price;
  final String sku;
  final int stockQuantity;
  final String vendorName;
  final String vendorWebsite;

  WishlistProduct({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.sku,
    required this.stockQuantity,
    required this.vendorName,
    required this.vendorWebsite,
  });

  factory WishlistProduct.fromJson(Map<String, dynamic> json) {
    final product = json['product'] as Map<String, dynamic>;
    final vendor = product['vendor'] as Map<String, dynamic>;

    return WishlistProduct(
      id: json['productId'],
      name: product['name'],
      description: product['description'],
      price: product['price'].toDouble(),
      sku: product['sku'],
      stockQuantity: product['stockQuantity'],
      vendorName: vendor['businessName'],
      vendorWebsite: vendor['website'],
    );
  }
}
