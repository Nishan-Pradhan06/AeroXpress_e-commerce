import 'brand_model.dart';
import 'category_model.dart';
import 'vendor_model.dart';

class ProductModel {
  final int id;
  final String name;
  final String slug;
  final String description;
  final String shortDescription;
  final double price;
  final String sku;
  final int stockQuantity;
  final String status;
  final bool isFeatured;
  final bool hasVariants;
  final int rating;
  final int reviewCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final VendorModel vendor;
  final CategoryModel category;
  final BrandModel brand;

  ProductModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.shortDescription,
    required this.price,
    required this.sku,
    required this.stockQuantity,
    required this.status,
    required this.isFeatured,
    required this.hasVariants,
    required this.rating,
    required this.reviewCount,
    required this.createdAt,
    required this.updatedAt,
    required this.vendor,
    required this.category,
    required this.brand,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      description: json['description'],
      shortDescription: json['shortDescription'],
      price: (json['price'] as num).toDouble(),
      sku: json['sku'],
      stockQuantity: json['stockQuantity'],
      status: json['status'],
      isFeatured: json['isFeatured'],
      hasVariants: json['hasVariants'],
      rating: json['rating'],
      reviewCount: json['reviewCount'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      vendor: VendorModel.fromJson(json['vendor']),
      category: CategoryModel.fromJson(json['category']),
      brand: BrandModel.fromJson(json['brand']),
    );
  }
}

// Repeat similarly for VendorModel, CategoryModel, and BrandModel
