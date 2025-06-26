import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../widgets/category_tile.dart';

class CategoryScreen extends StatelessWidget {
  final List<CategoryModel> categories = [
    CategoryModel(
      id: 1,
      name: "Electronics",
      slug: "electronics",
      description: "Electronic devices",
      image: "http://localhost:5000/images/categories/electronics.jpg",
      isFeatured: true,
      productCount: 3,
      subcategoryCount: 1,
    ),
    CategoryModel(
      id: 2,
      name: "Fashion",
      slug: "fashion",
      description: "Clothing and accessories",
      image: "http://localhost:5000/images/categories/fashion.jpg",
      isFeatured: true,
      productCount: 1,
      subcategoryCount: 0,
    ),
    CategoryModel(
      id: 3,
      name: "Mobiles",
      slug: "mobiles",
      description: "Mobile phones",
      image: "http://localhost:5000/images/categories/mobiles.jpg",
      isFeatured: false,
      productCount: 1,
      subcategoryCount: 0,
    ),
  ];

  CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.8,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategoryTile(
            imageLink: category.image,
            label: category.name,
            onTap: () {
              // Navigate or handle tap
            },
          );
        },
      ),
    );
  }
}
