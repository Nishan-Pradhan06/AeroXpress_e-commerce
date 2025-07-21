import 'package:cached_network_image/cached_network_image.dart';
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
    if (widget.product.image != null && widget.product.image!.url!.isNotEmpty) {
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
            child: CachedNetworkImage(
              imageUrl: imageUrls[selectedImage],
              fit: BoxFit.cover,
              placeholder:
                  (context, url) => const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
              errorWidget:
                  (context, url, error) => const Icon(
                    Icons.broken_image,
                    size: 32,
                    color: Colors.grey,
                  ),
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
