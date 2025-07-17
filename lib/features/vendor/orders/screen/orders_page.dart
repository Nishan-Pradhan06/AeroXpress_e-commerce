import 'package:flutter/material.dart';

class VendorOrderPage extends StatefulWidget {
  const VendorOrderPage({super.key});

  @override
  State<VendorOrderPage> createState() => _VendorOrderPageState();
}

class _VendorOrderPageState extends State<VendorOrderPage> {
  String selectedFilter = 'ALL';
  late List<Map<String, dynamic>> _allOrders;
  late List<Map<String, dynamic>> _filteredOrders;

  @override
  void initState() {
    super.initState();
    _allOrders = _generateSampleOrders();
    _applyFilter();
  }

  void _applyFilter() {
    if (selectedFilter == 'ALL') {
      _filteredOrders = List.from(_allOrders);
    } else {
      _filteredOrders =
          _allOrders
              .where((order) => order['status'] == selectedFilter)
              .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vendor Orders'),
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.filter_list), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          // Filter Chips
          Container(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip('ALL', 'All Orders'),
                  const SizedBox(width: 8),
                  _buildFilterChip('PENDING', 'Pending'),
                  const SizedBox(width: 8),
                  _buildFilterChip('SHIPPED', 'Shipped'),
                  const SizedBox(width: 8),
                  _buildFilterChip('DELIVERED', 'Delivered'),
                  const SizedBox(width: 8),
                  _buildFilterChip('CANCELLED', 'Cancelled'),
                  const SizedBox(width: 8),
                  _buildFilterChip('RETURNED', 'Returned'),
                ],
              ),
            ),
          ),

          // Orders List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _filteredOrders.length,
              itemBuilder: (context, index) {
                final order = _filteredOrders[index];
                return _buildOrderCard(
                  orderNumber: order["orderNumber"],
                  customerName: order["customerName"],
                  status: order["status"],
                  paymentMethod: order["paymentMethod"],
                  paymentStatus: order["paymentStatus"],
                  total: order["total"],
                  items: order["items"],
                  createdAt: order["createdAt"],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String value, String label) {
    bool isSelected = selectedFilter == value;
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (bool selected) {
        setState(() {
          selectedFilter = selected ? value : 'ALL';
          _applyFilter();
        });
      },
      backgroundColor: Colors.grey[200],
      selectedColor: Colors.blue[100],
      checkmarkColor: Colors.blue[700],
    );
  }

  Widget _buildOrderCard({
    required String orderNumber,
    required String customerName,
    required String status,
    required String paymentMethod,
    required String paymentStatus,
    required String total,
    required List<Map<String, dynamic>> items,
    required String createdAt,
  }) {
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
                  orderNumber,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[700],
                  ),
                ),
                _buildStatusChip(status),
              ],
            ),
            const SizedBox(height: 8),

            // Customer Info
            Row(
              children: [
                Icon(Icons.person, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  customerName,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Order Items
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Items:',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  ...items.map(
                    (item) => Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "${item['name']} x${item['quantity']}",
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                          Text(
                            "Rs. ${item['price']}",
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Payment and Total Info
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.payment, size: 16, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Text(
                          paymentMethod,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    _buildPaymentStatusChip(paymentStatus),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      'Rs. $total',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[700],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Date and Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formatDate(createdAt),
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('View Details'),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.blue[700],
                      ),
                    ),
                    if (status == 'PENDING') ...[
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Process'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[700],
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    Color color;
    switch (status) {
      case 'PENDING':
        color = Colors.orange;
        break;
      case 'SHIPPED':
        color = Colors.blue;
        break;
      case 'DELIVERED':
        color = Colors.green;
        break;
      case 'CANCELLED':
        color = Colors.red;
        break;
      case 'RETURNED':
        color = Colors.purple;
        break;
      case 'DRAFT':
        color = Colors.grey;
        break;
      default:
        color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildPaymentStatusChip(String paymentStatus) {
    Color color =
        paymentStatus == 'COMPLETED'
            ? Colors.green
            : paymentStatus == 'FAILED'
            ? Colors.red
            : Colors.orange;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        paymentStatus,
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  String _formatDate(String dateString) {
    DateTime date = DateTime.parse(dateString);
    return "${date.day}/${date.month}/${date.year}";
  }

  List<Map<String, dynamic>> _generateSampleOrders() {
    return [
      {
        "orderNumber": "ORD-1752724154015",
        "customerName": "Anita Sharma",
        "status": "PENDING",
        "paymentMethod": "COD",
        "paymentStatus": "PENDING",
        "total": "250.1",
        "items": [
          {"name": "Men's Beard Oil", "quantity": 1, "price": "20"},
          {"name": "Platform Wireless Mouse", "quantity": 2, "price": "25"},
        ],
        "createdAt": "2025-07-17T03:49:14.018Z",
      },
      {
        "orderNumber": "ORD-1006",
        "customerName": "Suman Thapa",
        "status": "DELIVERED",
        "paymentMethod": "KHALTI",
        "paymentStatus": "COMPLETED",
        "total": "50",
        "items": [
          {"name": "Women's Kurta Set", "quantity": 1, "price": "45"},
        ],
        "createdAt": "2025-07-11T04:15:00.000Z",
      },
      {
        "orderNumber": "ORD-1007",
        "customerName": "Anita Sharma",
        "status": "CANCELLED",
        "paymentMethod": "KHALTI",
        "paymentStatus": "FAILED",
        "total": "75",
        "items": [
          {"name": "Women's Kurta Set", "quantity": 1, "price": "45"},
          {"name": "Hydrating Moisturizer", "quantity": 1, "price": "20"},
        ],
        "createdAt": "2025-07-10T08:15:00.000Z",
      },
      {
        "orderNumber": "ORD-1008",
        "customerName": "Suman Thapa",
        "status": "RETURNED",
        "paymentMethod": "COD",
        "paymentStatus": "PENDING",
        "total": "35",
        "items": [
          {"name": "Men's Casual Shirt", "quantity": 1, "price": "30"},
        ],
        "createdAt": "2025-07-09T03:15:00.000Z",
      },
      // Add more orders here if needed...
    ];
  }
}
