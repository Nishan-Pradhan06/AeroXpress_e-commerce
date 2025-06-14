import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../core/theme/app_color.dart';
import '../widgets/ev_add_product_fab.dart';
import '../widgets/ev_product_card.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> mockProducts = [
      {
        'id': 'prod-1',
        'name': 'iPhone 15 Pro',
        'category': 'Electronics',
        'price': 999.00,
        'stock': 25,
        'status': 'Active',
        'image':
            'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=300',
        'sales': 45,
      },
      {
        'id': 'prod-2',
        'name': 'MacBook Air M2',
        'category': 'Electronics',
        'price': 1299.00,
        'stock': 0,
        'status': 'Out of Stock',
        'image':
            'https://images.unsplash.com/photo-1541807084-5c52b6b3adef?w=300',
        'sales': 23,
      },
      {
        'id': 'prod-3',
        'name': 'Nike Air Max',
        'category': 'Fashion',
        'price': 129.99,
        'stock': 50,
        'status': 'Active',
        'image':
            'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=300',
        'sales': 78,
      },
      {
        'id': 'prod-4',
        'name': 'Organic Coffee Beans',
        'category': 'Food',
        'price': 24.99,
        'stock': 5,
        'status': 'Low Stock',
        'image':
            'https://images.unsplash.com/photo-1559056199-641a0ac8b55e?w=300',
        'sales': 120,
      },
    ];

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
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
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
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  'Total Products',
                  '${mockProducts.length}',
                  PhosphorIconsRegular.package,
                  Colors.blue[500]!,
                  context,
                ),
              ),
              Expanded(
                child: _buildStatCard(
                  'Low Stock',
                  '${mockProducts.where((p) => p['stock'] < 10 && p['stock'] > 0).length}',
                  PhosphorIconsRegular.warning,
                  Colors.orange,
                  context,
                ),
              ),
              Expanded(
                child: _buildStatCard(
                  'Out of Stock',
                  '${mockProducts.where((p) => p['stock'] == 0).length}',
                  PhosphorIconsRegular.x,
                  AppColors.darkTheme.statusError,
                  context,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ...mockProducts.asMap().entries.map((entry) {
            final index = entry.key;
            final product = entry.value;
            return EvProductCard(
                  product: product,
                  onEdit: () {},
                  onDelete: () {},
                )
                .animate()
                .fadeIn(duration: 500.ms, delay: (index * 100).ms)
                .slideX(begin: 0.3, end: 0);
          }),
        ],
      ),
      floatingActionButton: const EvAddProductFab(),
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
