import 'package:deal_sell/core/widget/custom_toast.dart';
import 'package:deal_sell/features/cutomers/cart/bloc/get_cart/get_cart_bloc.dart';
import 'package:deal_sell/features/cutomers/cart/models/cart_item_model.dart';
import 'package:deal_sell/features/cutomers/cart/models/cart_summary_model.dart';
import 'package:deal_sell/features/cutomers/cart/widgets/cart_item.dart';
import 'package:deal_sell/features/cutomers/products/models/vendor_model.dart';
import 'package:deal_sell/core/dl/dependency_injection.dart';
import 'package:deal_sell/routes/app_route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../../../../core/utils/app_loading_dialogs.dart';
import '../bloc/delete_cart/delete_cart_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Future<void> _refreshCart(BuildContext context) async {
    sl<GetCartBloc>().add(GetCartEvent.getCart());
    await Future.delayed(const Duration(seconds: 1));
  }

  late DeleteCartBloc _deleteCartBloc;

  @override
  void initState() {
    super.initState();
    _deleteCartBloc = sl<DeleteCartBloc>();
  }

  @override
  void didChangeDependencies() {
    sl<GetCartBloc>().add(GetCartEvent.getCart());
    super.didChangeDependencies();
  }

  void _onDeleteCart() {
    _deleteCartBloc.add(const DeleteCartEvent.deleteCart());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteCartBloc, DeleteCartState>(
      bloc: _deleteCartBloc,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => AppLoadingDialog.show(context),
          failure: (failure) {
            AppLoadingDialog.hide(context);
            CustomToast.showError(failure.message);
          },
          loaded: (cart) {
            AppLoadingDialog.hide(context);
            CustomToast.showSuccess("Cart cleared successfully");
            sl<GetCartBloc>().add(GetCartEvent.getCart());
          },
        );
      },
      child: Scaffold(
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
              elevation: 0,
              title: const Text("Cart", style: TextStyle(color: Colors.black)),
              actions: [
                BlocBuilder<DeleteCartBloc, DeleteCartState>(
                  builder: (context, state) {
                    final isLoading = state == const DeleteCartState.loading();
                    return IconButton(
                      onPressed: isLoading ? null : _onDeleteCart,
                      icon: const Icon(LucideIcons.trash2),
                    );
                  },
                ),
              ],
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
                if (cart.items.isEmpty) {
                  return _buildEmptyCartWidget();
                }

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
      ),
    );
  }

  Widget _buildEmptyCartWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.shopping_cart_outlined,
            size: 80,
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          const Text(
            "Your cart is empty",
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          // CustomButtonPrimary(
          //   title: 'Start Shoping',
          //   onPressed: () {
          //     context.goNamed(AppRoutesName.bottomNavBar);
          //   },
          // ),
        ],
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
                // Future: implement item-level removal logic
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
            onPressed: () {
              context.pushNamed(AppRoutesName.checkoutScreen);
            },
            child: Text("Checkout (${summary.itemCount})"),
          ),
        ],
      ),
    );
  }
}
