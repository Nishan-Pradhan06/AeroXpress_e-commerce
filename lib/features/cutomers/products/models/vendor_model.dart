class VendorModel {
  final int id;
  final int userId;
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
  final DateTime createdAt;
  final DateTime updatedAt;

  VendorModel({
    required this.id,
    required this.userId,
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
    required this.createdAt,
    required this.updatedAt,
  });

  factory VendorModel.fromJson(Map<String, dynamic> json) {
    return VendorModel(
      id: json['id'],
      userId: json['userId'],
      businessName: json['businessName'],
      businessEmail: json['businessEmail'],
      businessPhone: json['businessPhone'],
      slug: json['slug'],
      taxId: json['taxId'],
      description: json['description'],
      logo: json['logo'],
      banner: json['banner'],
      website: json['website'],
      facebook: json['facebook'],
      instagram: json['instagram'],
      twitter: json['twitter'],
      isApproved: json['isApproved'],
      approvedAt: json['approvedAt'],
      rating: (json['rating'] as num).toDouble(),
      totalReviews: json['totalReviews'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
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
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };
}
