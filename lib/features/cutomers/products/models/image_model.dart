class ImageModel {
  final int? id;
  final int? productId;
  final String url;
  final String? altText;
  final bool? isPrimary;
  final int? order;
  final DateTime? createdAt;

  ImageModel({
    this.id,
    this.productId,
    required this.url,
    this.altText,
    this.isPrimary,
    this.order,
    this.createdAt,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'] as int?,
      productId: json['productId'] as int?,
      url: json['url'] as String? ?? '',
      altText: json['altText'] as String?,
      isPrimary: json['isPrimary'] as bool?,
      order: json['order'] as int?,
      createdAt:
          json['createdAt'] != null
              ? DateTime.tryParse(json['createdAt'])
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'url': url,
      'altText': altText,
      'isPrimary': isPrimary,
      'order': order,
      'createdAt': createdAt?.toIso8601String(),
    };
  }
}
