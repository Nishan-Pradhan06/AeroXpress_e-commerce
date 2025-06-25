import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/widget/padding.dart'; // Make sure this exists and wraps padding

class ProductCardSkeleton extends StatelessWidget {
  final double width;
  final double aspectRatio;

  const ProductCardSkeleton({
    super.key,
    this.width = 140,
    this.aspectRatio = 1.02,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPadding(
      child: GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 0.72, // slightly reduced to prevent overflow
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: aspectRatio,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 14,
                        width: width * 0.8,
                        color: Colors.grey.shade300,
                      ),
                      const SizedBox(height: 6),
                      Container(
                        height: 14,
                        width: width * 0.6,
                        color: Colors.grey.shade300,
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 16,
                            width: 40,
                            color: Colors.grey.shade300,
                          ),
                          Container(
                            height: 24,
                            width: 24,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
