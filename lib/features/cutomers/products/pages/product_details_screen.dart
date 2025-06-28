import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widget/top_round_container.dart';
import '../blocs/get_products_by_slug/get_product_by_slug_bloc.dart';
import '../widgets/product_description.dart';
import '../widgets/product_images.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String slug;

  const ProductDetailsScreen({super.key, required this.slug});

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
            loaded:
                (product) => ListView(
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
                ),
          );
        },
      ),
      bottomNavigationBar: TopRoundedContainer(
        color: Colors.white,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: const Color(0xFFFF7643),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 48),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
              ),
              onPressed: () {},
              child: const Text("Add To Cart"),
            ),
          ),
        ),
      ),
    );
  }
}
