import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/api.dart';
import '../../../../core/dl/dependency_injection.dart';
import '../../products/models/vendor_model.dart';
import '../bloc/get_cart/get_cart_bloc.dart';
import '../models/cart_item_model.dart';
import '../models/cart_summary_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Future<void> _refreshCart(BuildContext context) async {
    // context.read<GetCartBloc>().add(LoadCart());
    sl<GetCartBloc>().add(GetCartEvent.getCart());

    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  void didChangeDependencies() {
    sl<GetCartBloc>().add(GetCartEvent.getCart());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Material(
          elevation: 0.1,
          color: Colors.white,
          child: AppBar(
            automaticallyImplyLeading: false,
            scrolledUnderElevation: 0,
            backgroundColor: Colors.white,
            elevation: 0, // Set to 0 since Material provides elevation
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Cart", style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
        ),
      ),
      body: BlocBuilder<GetCartBloc, GetCartState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            failure: (failure) => Center(child: Text('Failed: $failure')),
            loaded: (cart) {
              final groupedItems = _groupItemsByVendor(cart.items);
              final summary = cart.summary;

              return Column(
                children: [
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () => _refreshCart(context),
                      child: ListView(
                        children:
                            groupedItems.entries.map((entry) {
                              final vendorId = entry.key;
                              final items = entry.value;
                              final vendor = items.first.product.vendor!;
                              return _buildVendorSection(
                                context,
                                vendorId,
                                vendor,
                                items,
                              );
                            }).toList(),
                      ),
                    ),
                  ),
                  _buildSummarySection(summary),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Map<int, List<CartItemModel>> _groupItemsByVendor(List<CartItemModel> items) {
    final grouped = <int, List<CartItemModel>>{};
    for (var item in items) {
      final vendorId = item.product.vendor?.id;
      if (vendorId != null) {
        grouped.putIfAbsent(vendorId, () => []).add(item);
      }
    }
    return grouped;
  }

  Widget _buildVendorSection(
    BuildContext context,
    int vendorId,
    VendorModel vendor,
    List<CartItemModel> items,
  ) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.store),
            title: Text(vendor.businessName),
          ),
          ...items.map(
            (item) => Dismissible(
              key: ValueKey(item.id),
              direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              confirmDismiss: (direction) async {
                return await showDialog(
                  context: context,
                  builder:
                      (ctx) => AlertDialog(
                        title: const Text("Delete Item"),
                        content: const Text(
                          "Are you sure you want to remove this item from cart?",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(ctx).pop(false),
                            child: const Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(ctx).pop(true),
                            child: const Text("Delete"),
                          ),
                        ],
                      ),
                );
              },
              onDismissed: (direction) {
                // context.read<GetCartBloc>().add(RemoveCartItem(item.id));
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(content: Text('${item.product.name} removed')),
                // );
              },
              child: CartItemWidget(
                item: item,
                onSelectionChanged: (value) {},
                onQuantityChanged: (quantity) {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummarySection(CartSummaryModel summary) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Subtotal: Rs. ${summary.subtotal.toStringAsFixed(0)}"),
                Text("Shipping: Rs. ${summary.shippingFee.toStringAsFixed(0)}"),
                Text(
                  "Discount: Rs. ${summary.discountAmount.toStringAsFixed(0)}",
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Checkout (${summary.itemCount})"),
          ),
        ],
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final CartItemModel item;
  final Function(bool?) onSelectionChanged;
  final Function(int) onQuantityChanged;

  const CartItemWidget({
    super.key,
    required this.item,
    required this.onSelectionChanged,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFF0F0F0), width: 1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(8),
            ),
            child:
                item.product.vendor?.logo != null
                    ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'http://$LOCAL_IP:5000${item.product.vendor!.logo}',
                        fit: BoxFit.cover,
                        errorBuilder:
                            (context, error, stackTrace) => const Icon(
                              Icons.image_outlined,
                              size: 30,
                              color: Colors.grey,
                            ),
                      ),
                    )
                    : const Icon(
                      Icons.image_outlined,
                      size: 30,
                      color: Colors.grey,
                    ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                if (item.product.description != null) ...[
                  Text(
                    item.product.description!,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                ],
                if (item.product.stockQuantity != null)
                  Text(
                    "${item.product.stockQuantity} item(s) left",
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Rs. ${item.product.price.toStringAsFixed(0)}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFF5722),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.remove,
                            size: 16,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            if (item.quantity > 1) {
                              onQuantityChanged(item.quantity - 1);
                            }
                          },
                        ),
                        Text(
                          item.quantity.toString(),
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.add,
                            size: 16,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            onQuantityChanged(item.quantity + 1);
                            sl<GetCartBloc>().add(GetCartEvent.getCart());
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
