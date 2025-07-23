import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SmallProductImage extends StatefulWidget {
  const SmallProductImage({
    super.key,
    required this.isSelected,
    required this.press,
    required this.image,
  });

  final bool isSelected;
  final VoidCallback press;
  final String image;

  @override
  State<SmallProductImage> createState() => _SmallProductImageState();
}

class _SmallProductImageState extends State<SmallProductImage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.press,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const EdgeInsets.only(right: 16),
        padding: const EdgeInsets.all(8),
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color(
              0xFFFF7643,
            ).withOpacity(widget.isSelected ? 1 : 0),
          ),
        ),
        child: CachedNetworkImage(
          imageUrl: widget.image,
          fit: BoxFit.cover,
          placeholder:
              (context, url) => const Center(
                child: SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
          errorWidget:
              (context, url, error) =>
                  const Icon(Icons.broken_image, size: 24, color: Colors.grey),
        ),
      ),
    );
  }
}
