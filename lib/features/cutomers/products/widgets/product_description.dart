import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/widget/svg.dart';
import '../models/products_model.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
    required this.product,
    this.pressOnSeeMore,
  });

  final ProductModel product;
  final GestureTapCallback? pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            product.name ?? '',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: const EdgeInsets.all(16),
            width: 48,
            decoration: BoxDecoration(
              color:
              // product.isFavourite ?
              const Color(0xFFFFE6E6),
              // : const Color(0xFFF5F6F9),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: SvgPicture.string(
              heartIcon,
              colorFilter: ColorFilter.mode(
                // product.isFavourite
                // ?
                const Color(0xFFFF4848),
                // : const Color(0xFFDBDEE4),
                BlendMode.srcIn,
              ),
              height: 16,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 64),
          child: Text(product.description ?? '', maxLines: 3),
        ),
      ],
    );
  }
}
