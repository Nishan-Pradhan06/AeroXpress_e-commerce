import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../core/helpers/no_internet_widget.dart';
import '../../../../core/theme/app_color.dart';
import '../../../shared/products/blocs/get_vendors_products/get_vendors_products_bloc.dart';
import '../widgets/ev_add_product_fab.dart';
import '../widgets/ev_product_card.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();
    context.read<GetVendorsProductsBloc>().add(
      GetVendorsProductsEvent.getVendorProducts(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Material(
          elevation: 0.1,
          child: AppBar(
            centerTitle: false,
            scrolledUnderElevation: 0,
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Products"),
                Text(
                  'Manage your inventory and product catalog',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ),
      ),
      body: BlocBuilder<GetVendorsProductsBloc, GetVendorsProductsState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            failure: (failure) {
              return Center(child: NoInternetWidget(message: failure.message));
            },

            loaded: (products) {
              return ListView(
                padding: const EdgeInsets.all(10),
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildStatCard(
                          'Total Products',
                          '${products.length}',
                          PhosphorIconsRegular.package,
                          Colors.blue[500]!,
                          context,
                        ),
                      ),
                      Expanded(
                        child: _buildStatCard(
                          'Low Stock',
                          '${products.where((p) => p.stockQuantity < 10 && p.stockQuantity > 0).length}',
                          PhosphorIconsRegular.warning,
                          Colors.orange,
                          context,
                        ),
                      ),
                      Expanded(
                        child: _buildStatCard(
                          'Out of Stock',
                          '${products.where((p) => p.stockQuantity == 0).length}',
                          PhosphorIconsRegular.x,
                          AppColors.darkTheme.statusError,
                          context,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ...products.asMap().entries.map((entry) {
                    final index = entry.key;
                    final product = entry.value;

                    final productMap = {
                      'id': product.slug,
                      'name': product.name,
                      'category': product.categoryName,
                      'price': double.tryParse(product.price) ?? 0,
                      'stock': product.stockQuantity,
                      'status': product.status,
                      'image':
                          (product.images?.isNotEmpty ?? false)
                              ? product.images!.first.url
                              : null,
                      'sales': 0,
                    };

                    return EvProductCard(
                          product: productMap,
                          onEdit: () {},
                          onDelete: () {},
                        )
                        .animate()
                        .fadeIn(duration: 500.ms, delay: (index * 100).ms)
                        .slideX(begin: 0.3, end: 0);
                  }),
                ],
              );
            },
          );
        },
      ),
      floatingActionButton: const EvAddProductFab(isExtended: false),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
    BuildContext context,
  ) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, size: 20, color: color),
                ),
                const Spacer(),
              ],
            ),
            const Gap(12),
            Text(
              value,
              style: Theme.of(
                context,
              ).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            const Gap(4),
            Text(title, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
