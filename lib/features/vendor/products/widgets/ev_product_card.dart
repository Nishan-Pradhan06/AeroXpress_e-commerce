import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../../core/theme/app_color.dart';

class EvProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const EvProductCard({
    super.key,
    required this.product,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            // Product Image
            Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(product['image']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Gap(10),
                _buildStatusBadge(context),
              ],
            ),

            const Gap(16),

            // Product Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          product['name'],
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  const Gap(4),
                  Text(
                    product['category'],
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                  const Gap(8),
                  Row(
                    children: [
                      Text(
                        '\$${product['price'].toStringAsFixed(2)}',
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Stock: ${product['stock']}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: _getStockColor(context),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Gap(16),

            // Actions
            PopupMenuButton(
              color: Theme.of(context).cardTheme.color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              itemBuilder:
                  (context) => [
                    PopupMenuItem(
                      onTap: onEdit,
                      child: Row(
                        children: [
                          Icon(PhosphorIconsRegular.pencil, size: 16),
                          const Gap(8),
                          const Text('Edit'),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      onTap: onDelete,
                      child: Row(
                        children: [
                          Icon(
                            PhosphorIconsRegular.trash,
                            size: 16,
                            color: AppColors.darkTheme.statusError,
                          ),
                          const Gap(8),
                          Text(
                            'Delete',
                            style: TextStyle(
                              color: AppColors.darkTheme.statusError,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Theme.of(
                          context,
                        ).colorScheme.outline.withOpacity(0.3),
                      ),
                    ),
                    child: Icon(
                      PhosphorIconsRegular.dotsThreeVertical,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBadge(BuildContext context) {
    Color statusColor;
    String statusText = product['status'];

    switch (product['status']) {
      case 'Active':
        statusColor = AppColors.darkTheme.statusSuccess;
        break;
      case 'Low Stock':
        statusColor = Colors.orange;
        break;
      case 'Out of Stock':
        statusColor = AppColors.darkTheme.statusError;

        break;
      default:
        statusColor = AppColors.darkTheme.statusInfo;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: statusColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: statusColor.withOpacity(0.3)),
      ),
      child: Text(
        statusText,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: statusColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Color _getStockColor(BuildContext context) {
    if (product['stock'] == 0) return AppColors.darkTheme.statusError;
    if (product['stock'] < 10) return Colors.orange;
    return AppColors.darkTheme.statusSuccess;
  }
}
