class ImageModel {
  final int? id;
  final int? productId;
  final String? url;
  final String? altText;
  final bool? isPrimary;
  final int? order;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic updatedBy;

  ImageModel({
    this.id,
    this.productId,
    this.url,
    this.altText,
    this.isPrimary,
    this.order,
    this.createdAt,
    this.updatedAt,
    this.updatedBy,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'],
      productId: json['productId'], // Changed from 'product_id' to 'productId'
      url: json['url'],
      altText: json['altText'], // Changed from 'alt_text' to 'altText'
      isPrimary: json['isPrimary'], // Changed from 'is_primary' to 'isPrimary'
      order: json['order'],
      createdAt:
          json['createdAt'] !=
                  null // Changed from 'created_at' to 'createdAt'
              ? DateTime.tryParse(json['createdAt'])
              : null,
      updatedAt:
          json['updatedAt'] !=
                  null // Changed from 'updated_at' to 'updatedAt'
              ? DateTime.tryParse(json['updatedAt'])
              : null,
      updatedBy: json['updatedBy'], // Changed from 'updated_by' to 'updatedBy'
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId, // Changed to camelCase for consistency
      'url': url,
      'altText': altText, // Changed to camelCase for consistency
      'isPrimary': isPrimary, // Changed to camelCase for consistency
      'order': order,
      'createdAt':
          createdAt?.toIso8601String(), // Changed to camelCase for consistency
      'updatedAt':
          updatedAt?.toIso8601String(), // Changed to camelCase for consistency
      'updatedBy': updatedBy, // Changed to camelCase for consistency
    };
  }
}
