class CategoryModel {
  final int id;
  final String name;
  final String slug;
  final String description;
  final String? image;
  final bool isFeatured;
  final int productCount;
  final int subcategoryCount;

  CategoryModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    this.image,
    required this.isFeatured,
    required this.productCount,
    required this.subcategoryCount,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      description: json['description'] ?? '',
      image: json['image'],
      isFeatured: json['isFeatured'] ?? false,
      productCount: json['productCount'] ?? 0,
      subcategoryCount: json['subcategoryCount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'description': description,
      'image': image,
      'isFeatured': isFeatured,
      'productCount': productCount,
      'subcategoryCount': subcategoryCount,
    };
  }
}
