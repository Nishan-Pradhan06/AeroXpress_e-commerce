class CategoryModel {
  final int id;
  final String name;
  final String slug;
  final String description;
  final String image;
  final int? parentId;
  final bool isFeatured;
  final int? featuredOrder;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int productCount;
  final int subcategoryCount;

  CategoryModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.image,
    required this.parentId,
    required this.isFeatured,
    required this.featuredOrder,
    required this.createdAt,
    required this.updatedAt,
    required this.productCount,
    required this.subcategoryCount,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'],
      name: map['name'],
      slug: map['slug'],
      description: map['description'],
      image: map['image'],
      parentId: map['parentId'],
      isFeatured: map['isFeatured'],
      featuredOrder: map['featuredOrder'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      productCount: map['productCount'],
      subcategoryCount: map['subcategoryCount'],
    );
  }
}
