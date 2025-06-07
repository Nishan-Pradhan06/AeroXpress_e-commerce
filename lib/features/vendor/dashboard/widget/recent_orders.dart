import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../../core/theme/app_theme.dart';
import 'dashboard_card.dart';


class EvRecentOrders extends StatelessWidget {
  const EvRecentOrders({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = [
      _OrderData(
        id: '#12345',
        customer: 'John Smith',
        amount: '\$125.00',
        status: 'Completed',
        statusColor: AppColors.success,
        time: '2 hours ago',
      ),
      _OrderData(
        id: '#12346',
        customer: 'Sarah Wilson',
        amount: '\$89.50',
        status: 'Processing',
        statusColor: AppColors.warning,
        time: '4 hours ago',
      ),
      _OrderData(
        id: '#12347',
        customer: 'Mike Johnson',
        amount: '\$234.75',
        status: 'Shipped',
        statusColor: AppColors.info,
        time: '1 day ago',
      ),
      _OrderData(
        id: '#12348',
        customer: 'Emma Davis',
        amount: '\$67.25',
        status: 'Pending',
        statusColor: AppColors.orange500,
        time: '2 days ago',
      ),
      _OrderData(
        id: '#12349',
        customer: 'Chris Brown',
        amount: '\$156.00',
        status: 'Cancelled',
        statusColor: AppColors.error,
        time: '3 days ago',
      ),
    ];

    return EvDashboardCard(
      title: 'Recent Orders',
      icon: PhosphorIconsRegular.shoppingCart,
      iconColor: AppColors.info,
      trailing: TextButton(
        onPressed: () {},
        child: Text(
          'View All',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      child: Column(
        children: [
          // Header Row
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Order',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Customer',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Status',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Amount',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.6),
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),

          const Divider(),

          // Orders List
          ...orders.asMap().entries.map(
            (entry) => _buildOrderRow(context, entry.value)
                .animate(delay: (entry.key * 50).ms)
                .fadeIn(duration: 300.ms)
                .slideY(begin: 0.2, end: 0),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderRow(BuildContext context, _OrderData order) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
      child: Row(
        children: [
          // Order ID & Time
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.id,
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
                Text(order.time, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),

          // Customer
          Expanded(
            flex: 2,
            child: Text(
              order.customer,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),

          // Status
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: order.statusColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: order.statusColor.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Text(
                order.status,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: order.statusColor,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          // Amount
          Expanded(
            child: Text(
              order.amount,
              style: Theme.of(
                context,
              ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}

class _OrderData {
  final String id;
  final String customer;
  final String amount;
  final String status;
  final Color statusColor;
  final String time;

  const _OrderData({
    required this.id,
    required this.customer,
    required this.amount,
    required this.status,
    required this.statusColor,
    required this.time,
  });
}
