import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:deal_sell/features/cutomers/products/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/image_url_helper.dart';
import '../../../../core/theme/app_color.dart';
import '../views/home_screen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product,
    required this.onPress,
    this.isFavourite = false,
  });

  final double width, aspectRetio;
  final ProductModel product;
  final VoidCallback onPress;
  final bool isFavourite;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: GestureDetector(
        onTap: onPress,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.02,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF979797).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: _buildProductImage(),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.name,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rs.${product.price}",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.lightTheme.brandPrimary,
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      color:
                          isFavourite
                              ? const Color(0xFFFF7643).withOpacity(0.15)
                              : const Color(0xFF979797).withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.string(
                      heartIcon,
                      colorFilter: ColorFilter.mode(
                        isFavourite
                            ? const Color(0xFFFF4848)
                            : const Color(0xFFDBDEE4),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage() {
    // Try to get the primary image first
    String? imageUrl = product.image?.url;

    // If no primary image, try to get the first image from images list
    if (imageUrl == null &&
        product.images != null &&
        product.images!.isNotEmpty) {
      imageUrl = product.images!.first.url;
    }

    log("img$imageUrl");

    // If we have an image URL, display it
    if (imageUrl != null && imageUrl.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CachedNetworkImage(
          imageUrl: getProductImageUrl(imageUrl),
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          placeholder:
              (context, url) => Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.lightTheme.brandPrimary,
                ),
              ),
          errorWidget:
              (context, url, error) => Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF979797).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.broken_image,
                      size: 32,
                      color: const Color(0xFF979797).withOpacity(0.7),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'No Image',
                      style: TextStyle(
                        fontSize: 10,
                        color: const Color(0xFF979797).withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
        ),
      );
    }

    // If no image URL available, show placeholder
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF979797).withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image_not_supported,
            size: 32,
            color: const Color(0xFF979797).withOpacity(0.7),
          ),
          const SizedBox(height: 4),
          Text(
            'No Image',
            style: TextStyle(
              fontSize: 10,
              color: const Color(0xFF979797).withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}
