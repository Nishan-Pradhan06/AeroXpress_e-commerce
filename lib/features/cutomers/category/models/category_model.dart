class CategoryModel {
  final int id;
  final String name;
  final String slug;
  final String description;
  final String image;
  final bool isFeatured;
  final int productCount;
  final int subcategoryCount;

  CategoryModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.image,
    required this.isFeatured,
    required this.productCount,
    required this.subcategoryCount,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      description: json['description'],
      image: json['image'],
      isFeatured: json['isFeatured'],
      productCount: json['productCount'],
      subcategoryCount: json['subcategoryCount'],
    );
  }
}
