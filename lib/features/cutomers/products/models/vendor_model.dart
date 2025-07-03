class VendorModel {
  final int? id;
  final int? userId;
  final String businessName;
  final String businessEmail;
  final String businessPhone;
  final String slug;
  final String? taxId;
  final String description;
  final String logo;
  final String? banner;
  final String website;
  final String? facebook;
  final String? instagram;
  final String? twitter;
  final bool isApproved;
  final String? approvedAt;
  final double rating;
  final int totalReviews;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  VendorModel({
    this.id,
    this.userId,
    required this.businessName,
    required this.businessEmail,
    required this.businessPhone,
    required this.slug,
    this.taxId,
    required this.description,
    required this.logo,
    this.banner,
    required this.website,
    this.facebook,
    this.instagram,
    this.twitter,
    required this.isApproved,
    this.approvedAt,
    required this.rating,
    required this.totalReviews,
    this.createdAt,
    this.updatedAt,
  });

  factory VendorModel.fromJson(Map<String, dynamic> json) {
    return VendorModel(
      id: json['id'] as int?,
      userId: json['userId'] as int?,
      businessName: json['businessName'] ?? '',
      businessEmail: json['businessEmail'] ?? '',
      businessPhone: json['businessPhone'] ?? '',
      slug: json['slug'] ?? '',
      taxId: json['taxId'] as String?,
      description: json['description'] ?? '',
      logo: json['logo'] ?? '',
      banner: json['banner'] as String?,
      website: json['website'] ?? '',
      facebook: json['facebook'] as String?,
      instagram: json['instagram'] as String?,
      twitter: json['twitter'] as String?,
      isApproved: json['isApproved'] ?? false,
      approvedAt: json['approvedAt'] as String?,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      totalReviews: json['totalReviews'] as int? ?? 0,
      createdAt:
          json['createdAt'] != null
              ? DateTime.tryParse(json['createdAt'])
              : null,
      updatedAt:
          json['updatedAt'] != null
              ? DateTime.tryParse(json['updatedAt'])
              : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'userId': userId,
    'businessName': businessName,
    'businessEmail': businessEmail,
    'businessPhone': businessPhone,
    'slug': slug,
    'taxId': taxId,
    'description': description,
    'logo': logo,
    'banner': banner,
    'website': website,
    'facebook': facebook,
    'instagram': instagram,
    'twitter': twitter,
    'isApproved': isApproved,
    'approvedAt': approvedAt,
    'rating': rating,
    'totalReviews': totalReviews,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
  };
}
