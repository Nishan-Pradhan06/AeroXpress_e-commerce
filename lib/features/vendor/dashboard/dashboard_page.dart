import 'package:deal_sell/features/vendor/dashboard/widget/bottom_nav.dart';
import 'package:deal_sell/features/vendor/dashboard/widget/dashboard_card.dart';
import 'package:deal_sell/features/vendor/dashboard/widget/quick_action.dart';
import 'package:deal_sell/features/vendor/dashboard/widget/recent_orders.dart';
import 'package:deal_sell/features/vendor/dashboard/widget/stats_overview.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../../../core/theme/app_theme.dart';
import 'widget/navigation_rail.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
//     return Scaffold(body: EvQuickActions());
//   }
// }
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth > 1024;
          final isTablet =
              constraints.maxWidth > 600 && constraints.maxWidth <= 1024;
          final isMobile = constraints.maxWidth <= 600;

          return Row(
            children: [
              // Desktop Navigation Rail
              if (isDesktop) ...[
                EvNavigationRail(
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (index) {
                    setState(() => selectedIndex = index);
                    _navigateToScreen(index);
                  },
                ),
                const VerticalDivider(width: 1, thickness: 1),
              ],

              // Main Content
              Expanded(
                child: Column(
                  children: [
                    // Header
                    Container(
                          padding: EdgeInsets.all(isDesktop ? 32 : 20),
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            border: Border(
                              bottom: BorderSide(
                                color: Theme.of(context).colorScheme.outline,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              if (!isDesktop)
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(PhosphorIconsRegular.list),
                                ),
                              if (!isDesktop) const Gap(12),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Dashboard',
                                    style:
                                        Theme.of(
                                          context,
                                        ).textTheme.displaySmall,
                                  ),
                                  const Gap(4),
                                  Text(
                                    'Welcome back! Here\'s what\'s happening with your store.',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium?.copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurface.withOpacity(0.7),
                                    ),
                                  ),
                                ],
                              ),

                              const Spacer(),

                              // Profile Avatar
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      AppTheme.primaryPurple,
                                      AppTheme.primaryPurpleLight,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        )
                        .animate()
                        .fadeIn(duration: 300.ms)
                        .slideY(begin: -0.2, end: 0),

                    // Content
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.all(isDesktop ? 32 : 20),
                        child: _buildContent(isDesktop, isTablet, isMobile),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),

      // Bottom Navigation for Mobile/Tablet
      bottomNavigationBar: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1024) return const SizedBox.shrink();
          return EvBottomNav(
            selectedIndex: selectedIndex,
            onDestinationSelected: (index) {
              setState(() => selectedIndex = index);
              _navigateToScreen(index);
            },
          );
        },
      ),
    );
  }

  void _navigateToScreen(int index) {
    switch (index) {
      case 0:
        context.go('/dashboard');
        break;
      case 1:
        context.go('/products');
        break;
      case 2:
        context.go('/orders');
        break;
      case 3:
        context.go('/customers');
        break;
      case 4:
        context.go('/analytics');
        break;
      case 5:
        context.go('/settings');
        break;
    }
  }

  Widget _buildContent(bool isDesktop, bool isTablet, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Stats Overview
        EvStatsOverview(isDesktop: isDesktop, isTablet: isTablet)
            .animate()
            .fadeIn(duration: 400.ms, delay: 100.ms)
            .slideY(begin: 0.3, end: 0),

        const Gap(32),

        // Main Content Grid
        if (isDesktop) ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Column
              Expanded(
                flex: 2,
                child: Column(
                  children: [EvRecentOrders(), const Gap(24), EvQuickActions()],
                ),
              ),
            ],
          ),
        ] else ...[
          // Mobile/Tablet Layout
          EvRecentOrders(),
          const Gap(24),
          EvQuickActions(),
        ],
      ],
    );
  }
}
