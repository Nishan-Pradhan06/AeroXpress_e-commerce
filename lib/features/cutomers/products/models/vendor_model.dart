class VendorModel {
  final int id;
  final String businessName;
  final String slug;

  VendorModel({
    required this.id,
    required this.businessName,
    required this.slug,
  });

  factory VendorModel.fromJson(Map<String, dynamic> json) {
    return VendorModel(
      id: json['id'],
      businessName: json['businessName'],
      slug: json['slug'],
    );
  }
}
