import 'package:deal_sell/features/shared/orders/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/orders/bloc/vendor_orders/vendor_orders_bloc.dart';

class VendorOrderPage extends StatefulWidget {
  const VendorOrderPage({super.key});

  @override
  State<VendorOrderPage> createState() => _VendorOrderPageState();
}

class _VendorOrderPageState extends State<VendorOrderPage> {
  String selectedFilter = 'ALL';
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Material(
          elevation: 0,
          color: Colors.white,
          child: AppBar(
            automaticallyImplyLeading: false,
            scrolledUnderElevation: 0,
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Text(
              "View Orders",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1),
              child: Container(height: 1, color: Colors.grey.withOpacity(0.1)),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          _buildFilterChips(),
          Expanded(
            child: BlocBuilder<VendorOrdersBloc, VendorOrdersState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const Center(child: Text("Initializing...")),
                  loading:
                      () => const Center(child: CircularProgressIndicator()),
                  failure:
                      (failure) =>
                          Center(child: Text("Error: ${failure.message}")),
                  loaded: (orders) {
                    final filtered =
                        selectedFilter == 'ALL'
                            ? orders
                            : orders
                                .where((o) => o.status == selectedFilter)
                                .toList();

                    if (filtered.isEmpty) {
                      return const Center(child: Text("No orders found"));
                    }

                    return RefreshIndicator(
                      onRefresh: () async {
                        context.read<VendorOrdersBloc>().add(
                          const VendorOrdersEvent.getVendorOrders(),
                        );
                      },
                      child: ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: filtered.length,
                        itemBuilder: (context, index) {
                          final order = filtered[index];
                          return _buildOrderCard(order);
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips() {
    const filters = [
      'ALL',
      'PENDING',
      'SHIPPED',
      'DELIVERED',
      'CANCELLED',
      'RETURNED',
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(16),
      child: Row(
        children:
            filters
                .map(
                  (filter) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      label: Text(
                        filter[0] + filter.substring(1).toLowerCase(),
                      ),
                      selected: selectedFilter == filter,
                      onSelected: (_) {
                        setState(() => selectedFilter = filter);
                      },
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }

  Widget _buildOrderCard(OrderModel order) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  order.orderNumber,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[700],
                  ),
                ),
                _buildStatusChip(order.status),
              ],
            ),
            const SizedBox(height: 8),

            // Customer
            Row(
              children: [
                Icon(Icons.person, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  order.shippingAddress.recipientName ?? '-',
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Items
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Items:',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                ...order.items.map(
                  (item) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${item.productSnapshot.name} x${item.quantity}"),
                      Text("Rs. ${item.price}"),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Payment & Total
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Payment: ${order.paymentMethod}"),
                Text(
                  "Total: Rs. ${order.total}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Date & Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_formatDate(order.createdAt)),
                if (order.status == 'PENDING')
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Process"),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    final color = switch (status) {
      'PENDING' => Colors.orange,
      'SHIPPED' => Colors.blue,
      'DELIVERED' => Colors.green,
      'CANCELLED' => Colors.red,
      'RETURNED' => Colors.purple,
      _ => Colors.grey,
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(status, style: TextStyle(color: color, fontSize: 12)),
    );
  }

  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }
}
