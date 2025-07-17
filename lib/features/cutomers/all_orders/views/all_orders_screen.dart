import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Sample orders data
  final List<Map<String, dynamic>> _allOrders = [
    {
      "orderNumber": "ORD-1001",
      "status": "DRAFT",
      "total": "NPR 25",
      "items": ["Hydrating Moisturizer"],
      "date": "July 16, 2025",
      "paymentMethod": "KHALTI",
      "paymentStatus": "PENDING",
      "shippingAddress": "123 Main St, Kathmandu",
    },
    {
      "orderNumber": "ORD-1002",
      "status": "PENDING",
      "total": "NPR 20",
      "items": ["Matte Lipstick Red"],
      "date": "July 15, 2025",
      "paymentMethod": "KHALTI",
      "paymentStatus": "PENDING",
      "shippingAddress": "456 Office Rd, Lalitpur",
    },
    {
      "orderNumber": "ORD-1005",
      "status": "SHIPPED",
      "total": "NPR 23",
      "items": ["Men's Face Wash"],
      "date": "July 12, 2025",
      "paymentMethod": "COD",
      "paymentStatus": "PENDING",
      "shippingAddress": "123 Main St, Kathmandu",
    },
    {
      "orderNumber": "ORD-1007",
      "status": "CANCELLED",
      "total": "NPR 75",
      "items": ["Women's Kurta Set", "Hydrating Moisturizer"],
      "date": "July 10, 2025",
      "paymentMethod": "KHALTI",
      "paymentStatus": "FAILED",
      "shippingAddress": "456 Office Rd, Lalitpur",
    },
    {
      "orderNumber": "ORD-1009",
      "status": "DELIVERED",
      "total": "NPR 35",
      "items": ["Platform Vitamin C Serum"],
      "date": "July 8, 2025",
      "paymentMethod": "KHALTI",
      "paymentStatus": "COMPLETED",
      "shippingAddress": "123 Main St, Kathmandu",
    },
  ];

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

  List<Map<String, dynamic>> _getFilteredOrders(String status) {
    if (status == "ALL") {
      return _allOrders;
    }
    return _allOrders.where((order) => order['status'] == status).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Material(
          elevation: 0.1,
          color: Colors.white,
          child: AppBar(
            automaticallyImplyLeading: true,
            scrolledUnderElevation: 0,
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "My Orders",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
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
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOrdersList(_getFilteredOrders("ALL")),
          _buildOrdersList(_getFilteredOrders("PENDING")),
          _buildOrdersList(_getFilteredOrders("SHIPPED")),
          _buildOrdersList(_getFilteredOrders("DELIVERED")),
          _buildOrdersList(_getFilteredOrders("CANCELLED")),
          _buildOrdersList(_getFilteredOrders("DRAFT")),
        ],
      ),
    );
  }

  Widget _buildOrdersList(List<Map<String, dynamic>> orders) {
    if (orders.isEmpty) {
      return Center(
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
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppTheme.space4),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return Padding(
          padding: EdgeInsets.only(
            bottom: index == orders.length - 1 ? 0 : AppTheme.space4,
          ),
          child: _buildOrderCard(
            orderNumber: order['orderNumber'],
            status: order['status'],
            total: order['total'],
            items: List<String>.from(order['items']),
            date: order['date'],
            paymentMethod: order['paymentMethod'],
            paymentStatus: order['paymentStatus'],
            shippingAddress: order['shippingAddress'],
          ),
        );
      },
    );
  }

  Widget _buildOrderCard({
    required String orderNumber,
    required String status,
    required String total,
    required List<String> items,
    required String date,
    required String paymentMethod,
    required String paymentStatus,
    required String shippingAddress,
  }) {
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
            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  orderNumber,
                  style: const TextStyle(
                    fontSize: AppTheme.fontSizeLg,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.foreground,
                  ),
                ),
                _buildStatusChip(status),
              ],
            ),
            const SizedBox(height: AppTheme.space3),

            // Order Details
            Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                  size: 16,
                  color: AppTheme.mutedForeground,
                ),
                const SizedBox(width: AppTheme.space2),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: AppTheme.fontSizeSm,
                    color: AppTheme.mutedForeground,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppTheme.space2),

            // Items
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        items
                            .map(
                              (item) => Padding(
                                padding: const EdgeInsets.only(bottom: 2),
                                child: Text(
                                  item,
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

            // Shipping Address
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.location_on,
                  size: 16,
                  color: AppTheme.mutedForeground,
                ),
                const SizedBox(width: AppTheme.space2),
                Expanded(
                  child: Text(
                    shippingAddress,
                    style: const TextStyle(
                      fontSize: AppTheme.fontSizeSm,
                      color: AppTheme.mutedForeground,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppTheme.space3),

            // Payment Info
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
                        paymentMethod,
                        style: const TextStyle(
                          fontSize: AppTheme.fontSizeSm,
                          color: AppTheme.foreground,
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
                      _buildPaymentStatusChip(paymentStatus),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppTheme.space3),

            // Total and Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: $total',
                  style: const TextStyle(
                    fontSize: AppTheme.fontSizeLg,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primary,
                  ),
                ),
                if (status == "DELIVERED")
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
                if (status == "SHIPPED")
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
    Color backgroundColor;
    Color textColor;

    switch (status) {
      case "DELIVERED":
        backgroundColor = Colors.green.shade100;
        textColor = Colors.green.shade800;
        break;
      case "SHIPPED":
        backgroundColor = Colors.blue.shade100;
        textColor = Colors.blue.shade800;
        break;
      case "PENDING":
        backgroundColor = Colors.orange.shade100;
        textColor = Colors.orange.shade800;
        break;
      case "CANCELLED":
        backgroundColor = Colors.red.shade100;
        textColor = Colors.red.shade800;
        break;
      case "DRAFT":
        backgroundColor = Colors.grey.shade100;
        textColor = Colors.grey.shade800;
        break;
      default:
        backgroundColor = AppTheme.muted;
        textColor = AppTheme.mutedForeground;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.space2,
        vertical: AppTheme.space1,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppTheme.radiusSm),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontSize: AppTheme.fontSizeXs,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }

  Widget _buildPaymentStatusChip(String paymentStatus) {
    Color backgroundColor;
    Color textColor;

    switch (paymentStatus) {
      case "COMPLETED":
        backgroundColor = Colors.green.shade100;
        textColor = Colors.green.shade800;
        break;
      case "PENDING":
        backgroundColor = Colors.orange.shade100;
        textColor = Colors.orange.shade800;
        break;
      case "FAILED":
        backgroundColor = Colors.red.shade100;
        textColor = Colors.red.shade800;
        break;
      default:
        backgroundColor = AppTheme.muted;
        textColor = AppTheme.mutedForeground;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.space2,
        vertical: AppTheme.space1,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppTheme.radiusSm),
      ),
      child: Text(
        paymentStatus,
        style: TextStyle(
          fontSize: AppTheme.fontSizeXs,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }
}
