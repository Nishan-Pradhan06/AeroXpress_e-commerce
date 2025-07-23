import 'package:deal_sell/core/widget/custom_toast.dart';
import 'package:deal_sell/features/shared/orders/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/orders/bloc/update_vendor_order_status/update_vendor_order_status_bloc.dart';
import '../../../shared/orders/bloc/vendor_orders/vendor_orders_bloc.dart';

// Order Status Enum
enum OrderStatus {
  DRAFT,
  PENDING,
  PROCESSING,
  SHIPPED,
  DELIVERED,
  CANCELLED,
  RETURNED,
}

extension OrderStatusExtension on OrderStatus {
  String get displayName {
    switch (this) {
      case OrderStatus.DRAFT:
        return 'Draft';
      case OrderStatus.PENDING:
        return 'Pending';
      case OrderStatus.PROCESSING:
        return 'Processing';
      case OrderStatus.SHIPPED:
        return 'Shipped';
      case OrderStatus.DELIVERED:
        return 'Delivered';
      case OrderStatus.CANCELLED:
        return 'Cancelled';
      case OrderStatus.RETURNED:
        return 'Returned';
    }
  }

  Color get color {
    switch (this) {
      case OrderStatus.DRAFT:
        return Colors.grey;
      case OrderStatus.PENDING:
        return Colors.orange;
      case OrderStatus.PROCESSING:
        return Colors.amber;
      case OrderStatus.SHIPPED:
        return Colors.blue;
      case OrderStatus.DELIVERED:
        return Colors.green;
      case OrderStatus.CANCELLED:
        return Colors.red;
      case OrderStatus.RETURNED:
        return Colors.purple;
    }
  }

  static OrderStatus fromString(String status) {
    return OrderStatus.values.firstWhere(
      (e) => e.name == status,
      orElse: () => OrderStatus.PENDING,
    );
  }
}

class ProcessOrderScreen extends StatefulWidget {
  final OrderModel order;

  const ProcessOrderScreen({super.key, required this.order});

  @override
  State<ProcessOrderScreen> createState() => _ProcessOrderScreenState();
}

class _ProcessOrderScreenState extends State<ProcessOrderScreen> {
  late OrderStatus selectedStatus;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    selectedStatus = OrderStatusExtension.fromString(widget.order.status);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<
      UpdateVendorOrderStatusBloc,
      UpdateVendorOrderStatusState
    >(
      listener: (context, state) {
        state.whenOrNull(
          loaded: (message) {
            CustomToast.show(message: message);
            context.read<VendorOrdersBloc>().add(
              VendorOrdersEvent.getVendorOrders(),
            );
            Navigator.pop(context, selectedStatus.name);
          },
          failure: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Failed: $error'),
                backgroundColor: Colors.red,
              ),
            );
          },
        );
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Process Order - ${widget.order.orderNumber}'),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1),
              child: Container(height: 1, color: Colors.grey.withOpacity(0.1)),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildOrderHeaderCard(),
                const SizedBox(height: 16),
                _buildCustomerDetailsCard(),
                const SizedBox(height: 16),
                _buildItemsCard(),
                const SizedBox(height: 16),
                _buildPaymentCard(),
                const SizedBox(height: 16),
                _buildStatusUpdateCard(),
                const SizedBox(height: 24),
                _buildActionButtons(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildOrderHeaderCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Order Number',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    Text(
                      widget.order.orderNumber,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[700],
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Current Status',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const SizedBox(height: 4),
                    _buildStatusChip(widget.order.status),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 8),
                Text(
                  'Order Date: ${_formatDate(widget.order.createdAt)}',
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomerDetailsCard() {
    final address = widget.order.shippingAddress;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Customer Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.person, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 8),
                Text(
                  address.recipientName ?? 'No name provided',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Row(
            //   children: [
            //     Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
            //     const SizedBox(width: 8),
            //     Expanded(
            //       child: Text(
            //         '${address.streetAddress}, ${address.city}, ${address.state} ${address.zipCode}',
            //         style: TextStyle(color: Colors.grey[700]),
            //       ),
            //     ),
            //   ],
            // ),
            // if (address.phoneNumber != null) ...[
            //   const SizedBox(height: 8),
            //   Row(
            //     children: [
            //       Icon(Icons.phone, size: 16, color: Colors.grey[600]),
            //       const SizedBox(width: 8),
            //       Text(
            //         address.phoneNumber!,
            //         style: TextStyle(color: Colors.grey[700]),
            //       ),
            //     ],
            //   ),
            // ],
          ],
        ),
      ),
    );
  }

  Widget _buildItemsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Items',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ...widget.order.items.map((item) => _buildItemRow(item)),
          ],
        ),
      ),
    );
  }

  Widget _buildItemRow(dynamic item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.shopping_bag, color: Colors.grey[600]),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.productSnapshot.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Quantity: ${item.quantity}',
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
              ],
            ),
          ),
          Text(
            'Rs. ${item.price}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Payment & Total',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Payment Method',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    Text(
                      widget.order.paymentMethod,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Total Amount',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    Text(
                      'Rs. ${widget.order.total}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusUpdateCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Update Order Status',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'Select new status:',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children:
                  OrderStatus.values.map((status) {
                    return ChoiceChip(
                      label: Text(status.displayName),
                      selected: selectedStatus == status,
                      onSelected: (selected) {
                        if (selected) {
                          setState(() {
                            selectedStatus = status;
                          });
                        }
                      },
                      selectedColor: status.color.withOpacity(0.2),
                      labelStyle: TextStyle(
                        color: selectedStatus == status ? status.color : null,
                        fontWeight:
                            selectedStatus == status
                                ? FontWeight.bold
                                : FontWeight.normal,
                      ),
                    );
                  }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: isLoading ? null : _updateOrderStatus,
            child:
                isLoading
                    ? const SizedBox(
                      height: 16,
                      width: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                    : const Text('Update Status'),
          ),
        ),
      ],
    );
  }

  Widget _buildStatusChip(String status) {
    final orderStatus = OrderStatusExtension.fromString(status);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: orderStatus.color.withOpacity(0.1),
        border: Border.all(color: orderStatus.color),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: orderStatus.color,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  void _updateOrderStatus() {
    context.read<UpdateVendorOrderStatusBloc>().add(
      UpdateVendorOrderStatusEvent.updateVendorOrderStatus(
        orderId: widget.order.id,
        status: selectedStatus.name,
      ),
    );
  }
}
