import '../../category/models/category_model.dart';
import 'brand_model.dart';
import 'image_model.dart';
import 'vendor_model.dart';

class ProductModel {
  final int? id;
  final String name;
  final String? slug;
  final String? description;
  final String? shortDescription;
  final double price;
  final double? salePrice;
  final double? costPrice;
  final String? sku;
  final int? stockQuantity;
  final String? status;
  final bool? isFeatured;
  final bool? hasVariants;
  final int? rating;
  final int? reviewCount;
  final double? weight;
  final double? length;
  final double? width;
  final double? height;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final VendorModel? vendor;
  final CategoryModel? category;
  final BrandModel? brand;
  final ImageModel? image;

  ProductModel({
    this.id,
    required this.name,
    this.slug,
    this.description,
    this.shortDescription,
    required this.price,
    this.salePrice,
    this.costPrice,
    this.sku,
    this.stockQuantity,
    this.status,
    this.isFeatured,
    this.hasVariants,
    this.rating,
    this.reviewCount,
    this.weight,
    this.length,
    this.width,
    this.height,
    this.createdAt,
    this.updatedAt,
    this.vendor,
    this.category,
    this.brand,
    this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int?,
      name: json['name'] as String? ?? '',
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      shortDescription: json['shortDescription'] as String?,
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      salePrice: (json['salePrice'] as num?)?.toDouble(),
      costPrice: (json['costPrice'] as num?)?.toDouble(),
      sku: json['sku'] as String?,
      stockQuantity: json['stockQuantity'] as int?,
      status: json['status'] as String?,
      isFeatured: json['isFeatured'] as bool?,
      hasVariants: json['hasVariants'] as bool?,
      rating: json['rating'] as int?,
      reviewCount: json['reviewCount'] as int?,
      weight: (json['weight'] as num?)?.toDouble(),
      length: (json['length'] as num?)?.toDouble(),
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      createdAt:
          json['createdAt'] != null
              ? DateTime.tryParse(json['createdAt'] as String)
              : null,
      updatedAt:
          json['updatedAt'] != null
              ? DateTime.tryParse(json['updatedAt'] as String)
              : null,
      vendor:
          json['vendor'] != null
              ? VendorModel.fromJson(json['vendor'] as Map<String, dynamic>)
              : null,
      category:
          json['category'] != null
              ? CategoryModel.fromJson(json['category'] as Map<String, dynamic>)
              : null,
      brand:
          json['brand'] != null
              ? BrandModel.fromJson(json['brand'] as Map<String, dynamic>)
              : null,
      image:
          json['image'] != null
              ? ImageModel.fromJson(json['image'] as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'description': description,
      'shortDescription': shortDescription,
      'price': price,
      'salePrice': salePrice,
      'costPrice': costPrice,
      'sku': sku,
      'stockQuantity': stockQuantity,
      'status': status,
      'isFeatured': isFeatured,
      'hasVariants': hasVariants,
      'rating': rating,
      'reviewCount': reviewCount,
      'weight': weight,
      'length': length,
      'width': width,
      'height': height,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'vendor': vendor?.toJson(),
      'category': category?.toJson(),
      'brand': brand?.toJson(),
      'image': image?.toJson(),
    };
  }

  /// Alias for toJson to support toMap calls
  Map<String, dynamic> toMap() => toJson();
}
