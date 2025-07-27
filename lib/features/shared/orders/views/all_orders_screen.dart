import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_theme.dart';
import '../bloc/customer_orders/all_order_bloc.dart';
import '../model/order_model.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<OrderModel> _filterOrders(List<OrderModel> orders, String status) {
    if (status == "ALL") return orders;
    return orders.where((o) => o.status == status).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: _buildAppBar(),
      body: BlocBuilder<AllOrderBloc, AllOrderState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded:
                (orders) => TabBarView(
                  controller: _tabController,
                  children: [
                    _buildOrdersList(_filterOrders(orders, "ALL")),
                    _buildOrdersList(_filterOrders(orders, "PENDING")),
                    _buildOrdersList(_filterOrders(orders, "SHIPPED")),
                    _buildOrdersList(_filterOrders(orders, "DELIVERED")),
                    _buildOrdersList(_filterOrders(orders, "CANCELLED")),
                    _buildOrdersList(_filterOrders(orders, "DRAFT")),
                  ],
                ),
            failure: (f) => Center(child: Text(f.message)),
            orElse: () => const SizedBox(),
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: Material(
        elevation: 0.1,
        color: Colors.white,
        child: AppBar(
          automaticallyImplyLeading: true,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "My Orders",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            indicatorColor: AppTheme.primary,
            labelColor: AppTheme.primary,
            unselectedLabelColor: AppTheme.mutedForeground,
            labelStyle: const TextStyle(
              fontSize: AppTheme.fontSizeSm,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: AppTheme.fontSizeSm,
              fontWeight: FontWeight.w400,
            ),
            tabs: const [
              Tab(text: "All"),
              Tab(text: "Pending"),
              Tab(text: "Shipped"),
              Tab(text: "Delivered"),
              Tab(text: "Cancelled"),
              Tab(text: "Draft"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrdersList(List<OrderModel> orders) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<AllOrderBloc>().add(const AllOrderEvent.getAllOrder());
      },
      child:
          orders.isEmpty
              ? ListView(
                // RefreshIndicator needs a scrollable child even if empty
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_bag_outlined,
                            size: 64,
                            color: AppTheme.mutedForeground,
                          ),
                          const SizedBox(height: AppTheme.space4),
                          Text(
                            'No orders found',
                            style: TextStyle(
                              fontSize: AppTheme.fontSizeLg,
                              color: AppTheme.mutedForeground,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
              : ListView.builder(
                padding: const EdgeInsets.all(AppTheme.space4),
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: index == orders.length - 1 ? 0 : AppTheme.space4,
                    ),
                    child: _buildOrderCard(order),
                  );
                },
              ),
    );
  }

  Widget _buildOrderCard(OrderModel order) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.card,
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        boxShadow: AppTheme.shadow,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.space4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  order.orderNumber,
                  style: const TextStyle(
                    fontSize: AppTheme.fontSizeLg,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.foreground,
                  ),
                ),
                _buildStatusChip(order.status),
              ],
            ),
            const SizedBox(height: AppTheme.space3),
            Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                  size: 16,
                  color: AppTheme.mutedForeground,
                ),
                const SizedBox(width: AppTheme.space2),
                Text(
                  order.createdAt.toLocal().toString().split(' ')[0],
                  style: const TextStyle(
                    fontSize: AppTheme.fontSizeSm,
                    color: AppTheme.mutedForeground,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppTheme.space2),
            Row(
              children: [
                const Icon(
                  Icons.shopping_bag,
                  size: 16,
                  color: AppTheme.mutedForeground,
                ),
                const SizedBox(width: AppTheme.space2),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                        order.items
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.only(bottom: 2),
                                child: Text(
                                  e.productSnapshot.name,
                                  style: const TextStyle(
                                    fontSize: AppTheme.fontSizeSm,
                                    color: AppTheme.foreground,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppTheme.space2),
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  size: 16,
                  color: AppTheme.mutedForeground,
                ),
                const SizedBox(width: AppTheme.space2),
                Expanded(
                  child: Text(
                    '${order.shippingAddress.street}, ${order.shippingAddress.city}',
                    style: const TextStyle(
                      fontSize: AppTheme.fontSizeSm,
                      color: AppTheme.mutedForeground,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppTheme.space3),
            Container(
              padding: const EdgeInsets.all(AppTheme.space3),
              decoration: BoxDecoration(
                color: AppTheme.muted,
                borderRadius: BorderRadius.circular(AppTheme.radius),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Payment Method',
                        style: TextStyle(
                          fontSize: AppTheme.fontSizeXs,
                          color: AppTheme.mutedForeground,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        order.paymentMethod,
                        style: const TextStyle(
                          fontSize: AppTheme.fontSizeSm,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Status',
                        style: TextStyle(
                          fontSize: AppTheme.fontSizeXs,
                          color: AppTheme.mutedForeground,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      if (order.paymentMethod == 'KHALTI')
                        _buildPaymentStatusChip('COMPLETED'),
                      if (order.paymentMethod == 'COD')
                        _buildPaymentStatusChip(order.paymentStatus),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppTheme.space3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: ${order.total}',
                  style: const TextStyle(
                    fontSize: AppTheme.fontSizeLg,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primary,
                  ),
                ),
                if (order.status == "DELIVERED")
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primary,
                      foregroundColor: AppTheme.primaryForeground,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppTheme.space4,
                        vertical: AppTheme.space2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppTheme.radius),
                      ),
                    ),
                    child: const Text(
                      'Reorder',
                      style: TextStyle(fontSize: AppTheme.fontSizeSm),
                    ),
                  ),
                if (order.status == "SHIPPED")
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppTheme.primary,
                      side: const BorderSide(color: AppTheme.primary),
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppTheme.space4,
                        vertical: AppTheme.space2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppTheme.radius),
                      ),
                    ),
                    child: const Text(
                      'Track Order',
                      style: TextStyle(fontSize: AppTheme.fontSizeSm),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    Color bg, fg;
    switch (status) {
      case "DELIVERED":
        bg = Colors.green.shade100;
        fg = Colors.green.shade800;
        break;
      case "SHIPPED":
        bg = Colors.blue.shade100;
        fg = Colors.blue.shade800;
        break;
      case "PENDING":
        bg = Colors.orange.shade100;
        fg = Colors.orange.shade800;
        break;
      case "CANCELLED":
        bg = Colors.red.shade100;
        fg = Colors.red.shade800;
        break;
      case "DRAFT":
        bg = Colors.grey.shade100;
        fg = Colors.grey.shade800;
        break;
      default:
        bg = AppTheme.muted;
        fg = AppTheme.mutedForeground;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.space2,
        vertical: AppTheme.space1,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(AppTheme.radiusSm),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontSize: AppTheme.fontSizeXs,
          fontWeight: FontWeight.w600,
          color: fg,
        ),
      ),
    );
  }

  Widget _buildPaymentStatusChip(String status) {
    Color bg, fg;
    switch (status) {
      case "COMPLETED":
        bg = Colors.green.shade100;
        fg = Colors.green.shade800;
        break;
      case "PENDING":
        bg = Colors.orange.shade100;
        fg = Colors.orange.shade800;
        break;
      case "FAILED":
        bg = Colors.red.shade100;
        fg = Colors.red.shade800;
        break;
      default:
        bg = AppTheme.muted;
        fg = AppTheme.mutedForeground;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.space2,
        vertical: AppTheme.space1,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(AppTheme.radiusSm),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontSize: AppTheme.fontSizeXs,
          fontWeight: FontWeight.w600,
          color: fg,
        ),
      ),
    );
  }
}
