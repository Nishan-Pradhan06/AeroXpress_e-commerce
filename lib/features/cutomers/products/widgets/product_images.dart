import 'package:flutter/material.dart';
import '../models/products_model.dart';
import 'small_product_image.dart';

class ProductImages extends StatefulWidget {
  final ProductModel product;

  const ProductImages({super.key, required this.product});

  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 238,
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.network(widget.product.image!.url[selectedImage]),
          ),
        ),
        // SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              2,
              (index) => SmallProductImage(
                isSelected: index == selectedImage,
                press: () {
                  setState(() {
                    selectedImage = index;
                  });
                },
                image: widget.product.image!.url[index],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
