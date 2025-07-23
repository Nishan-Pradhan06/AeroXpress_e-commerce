import 'image_model.dart';

class VendorProductModel {
  final String name;
  final String slug;
  final String description;
  final String shortDescription;
  final String price;
  final String sku;
  final int stockQuantity;
  final String status;
  final bool isFeatured;
  final double? weight;
  final double? length;
  final double? width;
  final double? height;
  final int rating;
  final int reviewCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? updatedBy;
  final String categoryName;
  final List<ImageModel>? images;

  VendorProductModel({
    required this.name,
    required this.slug,
    required this.description,
    required this.shortDescription,
    required this.price,
    required this.sku,
    required this.stockQuantity,
    required this.status,
    required this.isFeatured,
    this.weight,
    this.length,
    this.width,
    this.height,
    required this.rating,
    required this.reviewCount,
    required this.createdAt,
    required this.updatedAt,
    required this.updatedBy,
    required this.categoryName,
    required this.images,
  });

  factory VendorProductModel.fromJson(Map<String, dynamic> json) {
    final List<ImageModel>? parsedImages =
        (json['images'] as List<dynamic>?)
            ?.map((e) => ImageModel.fromJson(e))
            .toList();

    // Safely get primary image if available
    ImageModel? primaryImage = ImageModel.fromJson(json['image'] ?? {});

    return VendorProductModel(
      name: json['name'],
      slug: json['slug'],
      description: json['description'],
      shortDescription: json['shortDescription'],
      price: json['price'],
      sku: json['sku'],
      stockQuantity: json['stockQuantity'],
      status: json['status'],
      isFeatured: json['isFeatured'],
      weight: (json['weight'] as num?)?.toDouble(),
      length: (json['length'] as num?)?.toDouble(),
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      rating: json['rating'],
      reviewCount: json['reviewCount'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      updatedBy: json['updatedBy'],
      categoryName: json['category']['name'],
      images: parsedImages,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'slug': slug,
      'description': description,
      'shortDescription': shortDescription,
      'price': price,
      'sku': sku,
      'stockQuantity': stockQuantity,
      'status': status,
      'isFeatured': isFeatured,
      'weight': weight,
      'length': length,
      'width': width,
      'height': height,
      'rating': rating,
      'reviewCount': reviewCount,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'updatedBy': updatedBy,
      'category': {'name': categoryName},
      'images': images?.map((e) => e.toJson()).toList(),
    };
  }
}
