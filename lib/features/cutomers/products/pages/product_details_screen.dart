import 'dart:developer';

import 'package:deal_sell/core/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../../../../core/dl/dependency_injection.dart';
import '../../../../core/widget/custom_toast.dart';
import '../../../../core/widget/top_round_container.dart';
import '../../cart/bloc/add_to_cart/add_to_cart_bloc.dart';
import '../../cart/bloc/get_cart/get_cart_bloc.dart';
import '../blocs/get_products_by_slug/get_product_by_slug_bloc.dart';
import '../widgets/product_description.dart';
import '../widgets/product_images.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String slug;

  ProductDetailsScreen({super.key, required this.slug});
  int productId = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: EdgeInsets.zero,
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ),
      body: BlocBuilder<GetProductBySlugBloc, GetProductBySlugState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text('Initializing...')),
            loading: () => const Center(child: CircularProgressIndicator()),
            failure: (error) => Center(child: Text('Error: $error')),
            loaded: (product) {
              productId = product.id ?? 0;
              return ListView(
                children: [
                  ProductImages(product: product),
                  TopRoundedContainer(
                    color: Colors.white,
                    child: Column(
                      children: [
                        ProductDescription(
                          product: product,
                          pressOnSeeMore: () {},
                        ),
                        TopRoundedContainer(
                          color: const Color(0xFFF6F7F9),
                          child: Column(children: const []),
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
      bottomNavigationBar: TopRoundedContainer(
        color: Colors.white,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: BlocConsumer<AddToCartBloc, AddToCartState>(
              listener: (context, state) {
                state.whenOrNull(
                  loaded: (data) {
                    CustomToast.showSuccess('Added to Cart!');
                  },
                  failure: (error) {
                    CustomToast.showError(error.message);
                  },
                );
              },
              builder: (context, state) {
                final isLoading = state == const AddToCartState.loading();

                return CustomButtonPrimary(
                  isLoading: isLoading,
                  leadingIcon: Icon(LucideIcons.shoppingCart),
                  title: 'Add to Cart',
                  onPressed: () {
                    context.read<AddToCartBloc>().add(
                      AddToCartEvent.addToCart(
                        productId: productId,
                        quantity: 1,
                      ),
                    );
                    // log(message)
                    log(productId.toString());
                    sl<GetCartBloc>().add(GetCartEvent.getCart());
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
