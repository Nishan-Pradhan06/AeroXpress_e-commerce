import 'package:flutter/material.dart';
import '../../../../core/constant/api.dart';
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
  //TODO: FIXX
  late final List<String> imageUrls;

  @override
  void initState() {
    super.initState();

    imageUrls = [];

    // For primary image
    if (widget.product.image != null && widget.product.image!.url.isNotEmpty) {
      imageUrls.add('$BASE_URL${widget.product.image!.url}');
    }

    // // OR: If your model uses a list of images instead (like in your raw JSON):
    // if (widget.product. != null && widget.product.image!.isNotEmpty) {
    //   imageUrls =
    //       widget.product.images!.map((img) => '$BASE_URL${img.url}').toList();
    // }
  }

  @override
  Widget build(BuildContext context) {
    if (imageUrls.isEmpty) {
      return const Center(child: Icon(Icons.image_not_supported, size: 80));
    }

    return Column(
      children: [
        SizedBox(
          width: 238,
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.network(
              imageUrls[selectedImage],
              fit: BoxFit.cover,
              errorBuilder:
                  (context, error, stackTrace) =>
                      const Icon(Icons.broken_image),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              imageUrls.length,
              (index) => SmallProductImage(
                isSelected: index == selectedImage,
                press: () {
                  setState(() {
                    selectedImage = index;
                  });
                },
                image: imageUrls[index],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
