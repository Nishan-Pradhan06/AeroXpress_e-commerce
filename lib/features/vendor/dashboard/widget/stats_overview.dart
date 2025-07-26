import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../cubit/vendor_stats_cubit.dart';
import '../models/stat_data_model.dart';

class EvStatsOverview extends StatefulWidget {
  const EvStatsOverview({super.key});

  @override
  State<EvStatsOverview> createState() => _EvStatsOverviewState();
}

class _EvStatsOverviewState extends State<EvStatsOverview> {
  @override
  void initState() {
    super.initState();
    context.read<VendorStatsCubit>().loadVendorStats();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VendorStatsCubit, VendorStatsState>(
      builder: (context, state) {
        if (state.status == 'loading') {
          return const Center(
            child: Column(children: [CircularProgressIndicator()]),
          );
        }

        if (state.status == 'failure') {
          return const Center(child: Text("Failed to load statistics"));
        }

        final stats = [
          StatData(
            title: 'Total Revenue',
            value: 'Rs. ${state.totalEarnings?.toStringAsFixed(2) ?? '0.00'}',
            change: '+0.0%', // You can calculate this later
            isPositive: true,
            icon: PhosphorIconsRegular.trendUp,
            color: Colors.green,
          ),
          StatData(
            title: 'Orders',
            value: '${state.totalOrders ?? 0}',
            change: '+0', // or any order change % logic
            isPositive: true,
            icon: PhosphorIconsRegular.shoppingCart,
            color: Colors.blue,
          ),
          StatData(
            title: 'Products',
            value: '${state.totalProducts ?? 0}',
            change: '+0', // optional
            isPositive: true,
            icon: PhosphorIconsRegular.package,
            color: Colors.orange,
          ),
          StatData(
            title: 'Customers',
            value: '${state.totalCustomers ?? 0}',
            change: '+0', // optional
            isPositive: true,
            icon: PhosphorIconsRegular.users,
            color: Colors.deepPurple,
          ),
        ];

        return RefreshIndicator(
          onRefresh: () async {
            await context.read<VendorStatsCubit>().loadVendorStats();
          },
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 12),
            itemCount: stats.length,
            itemBuilder: (context, index) {
              return _buildStatCard(context, stats[index])
                  .animate(delay: (index * 100).ms)
                  .fadeIn(duration: 400.ms)
                  .slideY(begin: 0.3, end: 0);
            },
          ),
        );
      },
    );
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
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
}
