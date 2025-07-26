import 'package:flutter/material.dart';
import 'widget/stats_overview.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

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
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Dashboard"),
                Text(
                  "Welcome back! Here's what's happening with  your store.",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ),
      ),
      body: EvStatsOverview(),
    );
  }

  // Widget _buildInventoryAlert() {
  //   return EvDashboardCard(
  //         title: 'Inventory Alerts',
  //         icon: PhosphorIconsRegular.warning,
  //         iconColor: Colors.orange,
  //         child: Column(
  //           children: [
  //             _buildAlertItem(
  //               'Low Stock',
  //               '3 products need restocking',
  //               Colors.orange,
  //             ),
  //             const Gap(12),
  //             _buildAlertItem(
  //               'Out of Stock',
  //               '1 product unavailable',
  //               Colors.red,
  //             ),
  //             const Gap(12),
  //             _buildAlertItem(
  //               'Expiring Soon',
  //               '2 products expire in 7 days',
  //               Colors.blue,
  //             ),
  //           ],
  //         ),
  //       )
  //       .animate()
  //       .fadeIn(duration: 500.ms, delay: 300.ms)
  //       .slideX(begin: 0.3, end: 0);
  // }

  // Widget _buildAlertItem(String title, String subtitle, Color color) {
  //   return Container(
  //     padding: const EdgeInsets.all(12),
  //     decoration: BoxDecoration(
  //       color: color.withOpacity(0.1),
  //       borderRadius: BorderRadius.circular(8),
  //       border: Border.all(color: color.withOpacity(0.2)),
  //     ),
  //     child: Row(
  //       children: [
  //         Container(
  //           width: 8,
  //           height: 8,
  //           decoration: BoxDecoration(color: color, shape: BoxShape.circle),
  //         ),
  //         const Gap(12),
  //         Expanded(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [Text(title), Text(subtitle)],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
