import 'package:deal_sell/features/cutomers/products/models/image_model.dart';

import '../../category/models/category_model.dart';
import 'vendor_model.dart';

class ProductModel {
  final int? id;
  final int? vendorId;
  final int? categoryId;
  final String name;
  final String? slug;
  final String? description;
  final String? shortDescription;
  final String? price;
  final dynamic salePrice;
  final dynamic costPrice;
  final String? sku;
  final int? stockQuantity;
  final String? status;
  final bool? isFeatured;
  final double? weight;
  final dynamic length;
  final dynamic width;
  final dynamic height;
  final int? rating;
  final int? reviewCount;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic updatedBy;
  final VendorModel? vendor;
  final CategoryModel? category;
  final ImageModel? image;
  final List<ImageModel>? images;

  ProductModel({
    this.id,
    this.vendorId,
    this.categoryId,
    required this.name,
    this.slug,
    this.description,
    this.shortDescription,
    this.price,
    this.salePrice,
    this.costPrice,
    this.sku,
    this.stockQuantity,
    this.status,
    this.isFeatured,
    this.weight,
    this.length,
    this.width,
    this.height,
    this.rating,
    this.reviewCount,
    this.createdAt,
    this.updatedAt,
    this.updatedBy,
    this.vendor,
    this.category,
    this.image,
    this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final List<ImageModel>? parsedImages =
        (json['images'] as List<dynamic>?)
            ?.map((e) => ImageModel.fromJson(e))
            .toList();

    // Safely get primary image if available
    ImageModel? primaryImage = ImageModel.fromJson(json['image'] ?? {});

    return ProductModel(
      id: json['id'],
      vendorId: json['vendor_id'],
      categoryId: json['category_id'],
      name: json['name'],
      slug: json['slug'],
      description: json['description'],
      shortDescription: json['short_description'],
      price: json['price']?.toString(),
      salePrice: json['sale_price'],
      costPrice: json['cost_price'],
      sku: json['sku'],
      stockQuantity: json['stock_quantity'],
      status: json['status'],
      isFeatured: json['is_featured'],
      weight:
          json['weight'] != null
              ? double.tryParse(json['weight'].toString())
              : null,
      length: json['length'],
      width: json['width'],
      height: json['height'],
      rating: json['rating'],
      reviewCount: json['review_count'],
      createdAt:
          json['created_at'] != null
              ? DateTime.tryParse(json['created_at'])
              : null,
      updatedAt:
          json['updated_at'] != null
              ? DateTime.tryParse(json['updated_at'])
              : null,
      updatedBy: json['updated_by'],
      vendor:
          json['vendor'] != null ? VendorModel.fromJson(json['vendor']) : null,
      category:
          json['category'] != null
              ? CategoryModel.fromJson(json['category'])
              : null,
      images: parsedImages,
      image: primaryImage,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'vendor_id': vendorId,
      'category_id': categoryId,
      'name': name,
      'slug': slug,
      'description': description,
      'short_description': shortDescription,
      'price': price,
      'sale_price': salePrice,
      'cost_price': costPrice,
      'sku': sku,
      'stock_quantity': stockQuantity,
      'status': status,
      'is_featured': isFeatured,
      'weight': weight,
      'length': length,
      'width': width,
      'height': height,
      'rating': rating,
      'review_count': reviewCount,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'updated_by': updatedBy,
      'vendor': vendor?.toJson(),
      'category': category?.toJson(),
      'images': images?.map((e) => e.toJson()).toList(),
    };
  }
}

// class Vendor {
//   final int? id;
//   final String? businessName;
//   final String? slug;

//   Vendor({this.id, this.businessName, this.slug});

//   Vendor copyWith({int? id, String? businessName, String? slug}) => Vendor(
//     id: id ?? this.id,
//     businessName: businessName ?? this.businessName,
//     slug: slug ?? this.slug,
//   );
// }
