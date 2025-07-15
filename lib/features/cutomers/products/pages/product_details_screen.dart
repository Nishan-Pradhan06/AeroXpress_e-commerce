import 'dart:developer';

import 'package:deal_sell/core/theme/app_color.dart';
import 'package:deal_sell/core/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../../../../core/constant/api.dart';
import '../../../../core/widget/custom_toast.dart';
import '../../../../core/widget/top_round_container.dart';
import '../../cart/bloc/add_to_cart/add_to_cart_bloc.dart';
import '../../cart/bloc/get_cart/get_cart_bloc.dart';
import '../blocs/get_products_by_slug/get_product_by_slug_bloc.dart';
import '../models/image_model.dart';
import '../models/products_model.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String slug;

  const ProductDetailsScreen({super.key, required this.slug});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int productId = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Main content (ListView from BlocBuilder)
          BlocBuilder<GetProductBySlugBloc, GetProductBySlugState>(
            builder: (context, state) {
              return state.when(
                initial: () => const Center(child: Text('Initializing...')),
                loading: () => const Center(child: CircularProgressIndicator()),
                failure: (error) => Center(child: Text('Error: $error')),
                loaded: (product) {
                  productId = product.id ?? 0;
                  return ListView(
                    children: [
                      // Product Images Section
                      // ProductImages(product: product),
                      _buildProductImages(product),

                      TopRoundedContainer(
                        color: Colors.white,
                        child: Column(
                          children: [
                            // Product Details Section
                            _buildProductDetails(product),

                            // Additional Info Section
                            TopRoundedContainer(
                              color: const Color(0xFFF6F7F9),
                              child: _buildAdditionalInfo(product),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),

          // Top-left back button
          Positioned(
            top: 30,
            // left: 6,
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: EdgeInsets.zero,
                  elevation: 4,
                  backgroundColor: AppColors.darkTheme.brandPrimary,
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: TopRoundedContainer(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          child: Row(
            spacing: 10,
            children: [
              Expanded(
                child: CustomButtonPrimary(
                  height: 40,
                  title: "Buy Now",
                  onPressed: () {},
                ),
              ),
              BlocConsumer<AddToCartBloc, AddToCartState>(
                listener: (context, state) {
                  state.whenOrNull(
                    loaded: (data) {
                      CustomToast.showSuccess('Added to Cart!');
                      context.read<GetCartBloc>().add(GetCartEvent.getCart());
                    },
                    failure: (error) {
                      CustomToast.showError(error.message);
                    },
                  );
                },
                builder: (context, state) {
                  final isLoading = state == const AddToCartState.loading();

                  return Expanded(
                    child: CustomButtonOutline(
                      height: 40,
                      isLoading: isLoading,
                      leadingIcon: Icon(LucideIcons.shoppingCart),
                      title: 'Add to Cart',
                      onPressed:
                          isLoading
                              ? null
                              : () {
                                context.read<AddToCartBloc>().add(
                                  AddToCartEvent.addToCart(
                                    productId: productId,
                                    quantity: 1,
                                  ),
                                );
                                // log(message)
                                log(productId.toString());
                                // sl<GetCartBloc>().add(GetCartEvent.getCart());
                              },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildProductImages(ProductModel product) {
  //   // Note: The API response shows 'images' as an array, but the model only has 'image' (single)
  //   // You may need to update your model to handle multiple images
  //   return SizedBox(
  //     height: 250,
  //     child:
  //         product.image != null
  //             ? Container(
  //               child: Image.network(
  //                 product.image?.url.replaceFirst('localhost', LOCAL_IP) ?? '',
  //                 fit: BoxFit.cover,
  //                 errorBuilder:
  //                     (context, error, stackTrace) =>
  //                         const Icon(Icons.broken_image),
  //               ),
  //             )
  //             : Icon(Icons.image, size: 100, color: Colors.grey[400]),
  //   );
  // }
  Widget _buildProductImages(ProductModel product) {
    // Use images array if available, otherwise fall back to single image
    List<ImageModel> imagesToShow =
        (product.images?.isNotEmpty == true)
            ? product.images!
            : (product.image != null ? [product.image!] : []);

    if (imagesToShow.isEmpty) {
      return SizedBox(
        height: 250,
        child: Center(
          child: Icon(Icons.image, size: 100, color: Colors.grey[400]),
        ),
      );
    }

    // If only one image, show it simply
    if (imagesToShow.length == 1) {
      return SizedBox(
        height: 250,
        child: Container(
          width: double.infinity,
          child: Image.network(
            imagesToShow.first.url.replaceFirst('localhost', LOCAL_IP),
            fit: BoxFit.cover,
            errorBuilder:
                (context, error, stackTrace) =>
                    const Center(child: Icon(Icons.broken_image)),
          ),
        ),
      );
    }

    // Multiple images - show as horizontal scrollable list
    return Column(
      children: [
        // Main image display
        SizedBox(
          height: 200,
          child: Container(
            width: double.infinity,
            child: Image.network(
              imagesToShow.first.url.replaceFirst('localhost', LOCAL_IP),
              fit: BoxFit.cover,
              errorBuilder:
                  (context, error, stackTrace) =>
                      const Center(child: Icon(Icons.broken_image)),
            ),
          ),
        ),

        // Thumbnail scrollable row
        if (imagesToShow.length > 1)
          Container(
            height: 50,
            margin: const EdgeInsets.only(top: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: imagesToShow.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: index == 0 ? Colors.blue : Colors.grey[300]!,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      imagesToShow[index].url.replaceFirst(
                        'localhost',
                        LOCAL_IP,
                      ),
                      fit: BoxFit.cover,
                      errorBuilder:
                          (context, error, stackTrace) =>
                              const Icon(Icons.broken_image, size: 20),
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }

  Widget _buildProductDetails(ProductModel product) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Name
          Text(
            product.name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          // Brand
          if (product.brand != null)
            Text(
              'Brand: ${product.brand!.name}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),

          const SizedBox(height: 8),

          // Price Section
          Row(
            children: [
              Text(
                product.price.toStringAsFixed(2),
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(width: 12),
              if (product.salePrice != null)
                Text(
                  product.salePrice!.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 20,
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey[500],
                  ),
                ),
            ],
          ),

          const SizedBox(height: 6),

          // Rating and Reviews
          Row(
            children: [
              Row(
                children: List.generate(5, (index) {
                  final rating = product.rating ?? 0;
                  return Icon(
                    index < rating ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                    size: 20,
                  );
                }),
              ),
              const SizedBox(width: 8),
              Text(
                '(${product.reviewCount ?? 0} reviews)',
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Stock Status
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color:
                  (product.stockQuantity ?? 0) > 0
                      ? Colors.green.withOpacity(0.1)
                      : Colors.red.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              (product.stockQuantity ?? 0) > 0
                  ? 'In Stock (${product.stockQuantity} available)'
                  : 'Out of Stock',
              style: TextStyle(
                color:
                    (product.stockQuantity ?? 0) > 0
                        ? Colors.green[700]
                        : Colors.red[700],
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Description
          const Text(
            'Description',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            product.description ?? 'No description available',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
              height: 1.5,
            ),
          ),

          if (product.shortDescription != null) ...[
            const SizedBox(height: 12),
            Text(
              product.shortDescription!,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildAdditionalInfo(ProductModel product) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Vendor Information
          if (product.vendor != null) ...[
            const Text(
              'Sold by',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Row(
                children: [
                  Icon(Icons.store, color: Colors.grey[600]),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.vendor!.businessName,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        if (product.vendor!.rating > 0)
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 16),
                              const SizedBox(width: 4),
                              Text(
                                product.vendor!.rating.toString(),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],

          const SizedBox(height: 16),

          // Category
          if (product.category != null) ...[
            const Text(
              'Category',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                product.category!.name,
                style: TextStyle(
                  color: Colors.blue[700],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
          const SizedBox(height: 16),

          // Product Details
          const Text(
            'Product Details',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          _buildDetailRow('SKU', product.sku ?? 'N/A'),
          _buildDetailRow('Status', product.status ?? 'N/A'),
          if (product.weight != null)
            _buildDetailRow('Weight', '${product.weight} kg'),
          if (product.length != null ||
              product.width != null ||
              product.height != null)
            _buildDetailRow(
              'Dimensions',
              '${product.length ?? 0} × ${product.width ?? 0} × ${product.height ?? 0} cm',
            ),

          const SizedBox(height: 16),

          // Features
          if (product.isFeatured == true)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star, color: Colors.orange[700], size: 16),
                  const SizedBox(width: 4),
                  Text(
                    'Featured Product',
                    style: TextStyle(
                      color: Colors.orange[700],
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
