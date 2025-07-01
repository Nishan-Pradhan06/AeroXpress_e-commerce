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

  factory VendorModel.fromMap(Map<String, dynamic> map) {
    return VendorModel(
      id: map['id'],
      userId: map['userId'],
      businessName: map['businessName'],
      businessEmail: map['businessEmail'],
      businessPhone: map['businessPhone'],
      slug: map['slug'],
      taxId: map['taxId'],
      description: map['description'],
      logo: map['logo'],
      banner: map['banner'],
      website: map['website'],
      facebook: map['facebook'],
      instagram: map['instagram'],
      twitter: map['twitter'],
      isApproved: map['isApproved'],
      approvedAt: map['approvedAt'],
      rating: map['rating'].toDouble(),
      totalReviews: map['totalReviews'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }

  Map<String, dynamic> toMap() => {
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
