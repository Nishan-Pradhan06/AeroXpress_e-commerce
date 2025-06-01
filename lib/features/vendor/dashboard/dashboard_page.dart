import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
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

              const Gap(24),

              // Right Sidebar
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    _buildInventoryAlert(),
                    const Gap(24),
                    _buildRecentActivity(),
                  ],
                ),
              ),
            ],
          ),
        ] else ...[
          // Mobile/Tablet Layout
          EvRecentOrders(),
          const Gap(24),
          EvQuickActions(),
          const Gap(24),
          _buildInventoryAlert(),
          const Gap(24),
          _buildRecentActivity(),
        ],
      ],
    );
  }

  Widget _buildInventoryAlert() {
    return EvDashboardCard(
          title: 'Inventory Alerts',
          icon: PhosphorIconsRegular.warning,
          iconColor: AppColors.warning,
          child: Column(
            children: [
              _buildAlertItem(
                'Low Stock',
                '3 products need restocking',
                AppColors.warning,
              ),
              const Gap(12),
              _buildAlertItem(
                'Out of Stock',
                '1 product unavailable',
                AppColors.error,
              ),
              const Gap(12),
              _buildAlertItem(
                'Expiring Soon',
                '2 products expire in 7 days',
                AppColors.info,
              ),
            ],
          ),
        )
        .animate()
        .fadeIn(duration: 500.ms, delay: 300.ms)
        .slideX(begin: 0.3, end: 0);
  }

  Widget _buildAlertItem(String title, String subtitle, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const Gap(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.labelLarge),
                Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentActivity() {
    return EvDashboardCard(
          title: 'Recent Activity',
          icon: PhosphorIconsRegular.clockCounterClockwise,
          iconColor: AppTheme.primaryPurple,
          child: Column(
            children: [
              _buildActivityItem(
                'New order received',
                '#12345 - \$125.00',
                '2 min ago',
                PhosphorIconsRegular.shoppingCart,
                AppColors.success,
              ),
              const Gap(16),
              _buildActivityItem(
                'Product updated',
                'iPhone 15 Pro - Stock updated',
                '15 min ago',
                PhosphorIconsRegular.package,
                AppColors.info,
              ),
              const Gap(16),
              _buildActivityItem(
                'Customer review',
                'Great service! 5 stars',
                '1 hour ago',
                PhosphorIconsRegular.star,
                AppColors.warning,
              ),
            ],
          ),
        )
        .animate()
        .fadeIn(duration: 600.ms, delay: 400.ms)
        .slideX(begin: 0.4, end: 0);
  }

  Widget _buildActivityItem(
    String title,
    String subtitle,
    String time,
    IconData icon,
    Color color,
  ) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 16, color: color),
        ),
        const Gap(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.labelLarge),
              Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
        Text(
          time,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
