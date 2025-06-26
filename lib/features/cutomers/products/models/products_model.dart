import '../../category/models/category_model.dart';
import 'brand_model.dart';
import 'vendor_model.dart';

class ProductModel {
  final int? id;
  final String name;
  final String? slug;
  final String? description;
  final String? shortDescription;
  final double price;
  final String? sku;
  final int? stockQuantity;
  final String? status;
  final bool? isFeatured;
  final bool? hasVariants;
  final int? rating;
  final int? reviewCount;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final VendorModel? vendor;
  final CategoryModel? category;
  final BrandModel? brand;

  ProductModel({
    this.id,
    required this.name,
    this.slug,
    this.description,
    this.shortDescription,
    required this.price,
    this.sku,
    this.stockQuantity,
    this.status,
    this.isFeatured,
    this.hasVariants,
    this.rating,
    this.reviewCount,
    this.createdAt,
    this.updatedAt,
    this.vendor,
    this.category,
    this.brand,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int?,
      name: json['name'] as String? ?? '',
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      shortDescription: json['shortDescription'] as String?,
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      sku: json['sku'] as String?,
      stockQuantity: json['stockQuantity'] as int?,
      status: json['status'] as String?,
      isFeatured: json['isFeatured'] as bool?,
      hasVariants: json['hasVariants'] as bool?,
      rating: json['rating'] as int?,
      reviewCount: json['reviewCount'] as int?,
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
    );
  }
}
