import 'package:deal_sell/routes/app_route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widget/padding.dart';
import '../../home/widgets/product_card.dart';
import '../../home/widgets/section_title.dart';
import '../blocs/all_products/products_bloc.dart';
import '../models/products_model.dart';
import '../widgets/product_loading_skeleton.dart';

class GetAllProducts extends StatelessWidget {
  const GetAllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(title: "Recently Added Products", onTap: () {}),
        BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const ProductCardSkeleton(),
              failure: (failure) => const ProductCardSkeleton(),
              loaded: (products) {
                // Optionally limit to max 5 items
                final displayedProducts =
                    products.length > 5 ? products.sublist(0, 5) : products;

                return CustomPadding(
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: displayedProducts.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 0.75,
                          crossAxisSpacing: 16,
                        ),
                    itemBuilder: (context, index) {
                      final product = displayedProducts[index];
                      return ProductCard(
                        product: ProductModel(
                          id: product.id,
                          name: product.name,
                          price: product.price,
                          image: product.image,
                          // add other required fields if any
                        ),
                        onPress: () {
                          context.pushNamed(AppRoutesName.productDetailsScreen);
                        },
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
