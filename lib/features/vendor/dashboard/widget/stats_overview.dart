import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../models/stat_data_model.dart';

class EvStatsOverview extends StatelessWidget {
  const EvStatsOverview({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = [
      StatData(
        title: 'Total Revenue',
        value: '\$45,231.89',
        change: '+20.1%',
        isPositive: true,
        icon: PhosphorIconsRegular.trendUp,
        color: Colors.green,
      ),
      StatData(
        title: 'Orders',
        value: '1,234',
        change: '+12.5%',
        isPositive: true,
        icon: PhosphorIconsRegular.shoppingCart,
        color: Colors.blue,
      ),
      StatData(
        title: 'Products',
        value: '567',
        change: '+2',
        isPositive: true,
        icon: PhosphorIconsRegular.package,
        color: Colors.orange,
      ),
      StatData(
        title: 'Customers',
        value: '2,345',
        change: '-1.2%',
        isPositive: false,
        icon: PhosphorIconsRegular.users,
        color: Colors.deepPurple,
      ),
    ];

    return Column(
      children: [
        _buildStatCard(
          context,
          stats[0],
        ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.3, end: 0),

        _buildStatCard(context, stats[1])
            .animate(delay: 100.ms)
            .fadeIn(duration: 400.ms)
            .slideY(begin: 0.3, end: 0),

        _buildStatCard(context, stats[2])
            .animate(delay: 200.ms)
            .fadeIn(duration: 400.ms)
            .slideY(begin: 0.3, end: 0),
        _buildStatCard(context, stats[3])
            .animate(delay: 300.ms)
            .fadeIn(duration: 400.ms)
            .slideY(begin: 0.3, end: 0),
      ],
    );
  }
}

Widget _buildStatCard(BuildContext context, StatData stat) {
  return Card(
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: stat.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(stat.icon, size: 20, color: stat.color),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: (stat.isPositive ? Colors.green : Colors.red)
                      .withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      stat.isPositive
                          ? PhosphorIconsRegular.trendUp
                          : PhosphorIconsRegular.trendDown,
                      size: 12,
                      color: stat.isPositive ? Colors.green : Colors.red,
                    ),
                    const Gap(4),
                    Text(
                      stat.change,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: stat.isPositive ? Colors.green : Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const Gap(16),

          Text(
            stat.title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            ),
          ),

          const Gap(4),

          Text(
            stat.value,
            style: Theme.of(
              context,
            ).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    ),
  );
}

