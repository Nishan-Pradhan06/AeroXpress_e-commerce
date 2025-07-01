import 'package:flutter/material.dart';
import '../../products/models/products_model.dart';
import '../../products/models/vendor_model.dart';

class CartResponse {
  final bool success;
  final CartData data;

  CartResponse({required this.success, required this.data});

  factory CartResponse.fromJson(Map<String, dynamic> json) {
    return CartResponse(
      success: json['success'],
      data: CartData.fromJson(json['data']),
    );
  }
}

class CartData {
  final Cart cart;

  CartData({required this.cart});

  factory CartData.fromJson(Map<String, dynamic> json) {
    return CartData(cart: Cart.fromJson(json['cart']));
  }
}

class Cart {
  final List<CartItem> items;
  final CartSummary summary;

  Cart({required this.items, required this.summary});

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      items:
          (json['items'] as List)
              .map((item) => CartItem.fromJson(item))
              .toList(),
      summary: CartSummary.fromJson(json['summary']),
    );
  }
}

class CartItem {
  final int id;
  final int cartId;
  final int productId;
  final int? variantId;
  int quantity;
  final String createdAt;
  final String updatedAt;
  final ProductModel product;
  final dynamic variant;
  bool isSelected;

  CartItem({
    required this.id,
    required this.cartId,
    required this.productId,
    this.variantId,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
    required this.product,
    this.variant,
    this.isSelected = true,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      cartId: json['cartId'],
      productId: json['productId'],
      variantId: json['variantId'],
      quantity: json['quantity'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      product: ProductModel.fromJson(json['product']),
      variant: json['variant'],
      isSelected: true,
    );
  }
}

// Extended VendorModel to include selection state

class CartSummary {
  final double subtotal;
  final double shippingFee;
  final double taxAmount;
  final double discountAmount;
  final double total;
  final int itemCount;

  CartSummary({
    required this.subtotal,
    required this.shippingFee,
    required this.taxAmount,
    required this.discountAmount,
    required this.total,
    required this.itemCount,
  });

  factory CartSummary.fromJson(Map<String, dynamic> json) {
    return CartSummary(
      subtotal: (json['subtotal'] as num).toDouble(),
      shippingFee: (json['shippingFee'] as num).toDouble(),
      taxAmount: (json['taxAmount'] as num).toDouble(),
      discountAmount: (json['discountAmount'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      itemCount: json['itemCount'],
    );
  }
}

// Dummy Data Generator using your models
class DummyCartData {
  static CartResponse generateDummyCart() {
    // Create dummy vendors using your VendorModel
    final vendor1 = VendorModel(
      id: 1,
      businessName: "Liubakunhui",
      slug: "liubakunhui",
    );

    final vendor2 = VendorModel(
      id: 2,
      businessName: "Beauty Shop Mall",
      slug: "beauty-shop-mall",
    );

    final vendor3 = VendorModel(
      id: 3,
      businessName: "Himalayan Solutions",
      slug: "himalayan-solutions",
    );

    // Create dummy products using your ProductModel
    final products = [
      ProductModel(
        id: 1,
        name:
            "8X 12X 20X Lens For Cellphone with Clips Phone Camera Zoom Tel...",
        slug: "cellphone-lens",
        description: "No Brand, Color Family:20X",
        shortDescription: "Phone camera lens with clips",
        price: 3972.0,
        sku: "LENS-001",
        stockQuantity: 1,
        status: "ACTIVE",
        isFeatured: true,
        hasVariants: false,
        vendor: vendor1,
      ),
      ProductModel(
        id: 2,
        name:
            "4X Metal Central Drive Shaft Upgrade Accessories for 124019 124...",
        slug: "drive-shaft",
        description: "No Brand, color_family:Red",
        shortDescription: "Metal drive shaft upgrade",
        price: 1477.0,
        sku: "SHAFT-001",
        stockQuantity: 3,
        status: "ACTIVE",
        isFeatured: true,
        hasVariants: false,
        vendor: vendor2,
      ),
      ProductModel(
        id: 3,
        name: "Joystick Module",
        slug: "joystick-module",
        description: "No Brand, Color family:Multicolor",
        shortDescription: "Arduino joystick module",
        price: 325.0,
        sku: "JOY-001",
        stockQuantity: 12,
        status: "ACTIVE",
        isFeatured: false,
        hasVariants: true,
        vendor: vendor3,
      ),
      ProductModel(
        id: 4,
        name: "Male and Female Header (5Pcs)",
        slug: "header-pins",
        description: "No Brand, Color family:Female Hea...",
        shortDescription: "Arduino header pins",
        price: 250.0,
        sku: "HEADER-001",
        stockQuantity: 4,
        status: "ACTIVE",
        isFeatured: true,
        hasVariants: false,
        vendor: vendor3,
      ),
    ];

    final cartItems = [
      CartItem(
        id: 1,
        cartId: 1,
        productId: 1,
        variantId: null,
        quantity: 1,
        createdAt: "2025-06-28T05:37:02.317Z",
        updatedAt: "2025-06-28T05:37:02.317Z",
        product: products[0],
        variant: null,
        isSelected: true,
      ),
      CartItem(
        id: 2,
        cartId: 1,
        productId: 2,
        variantId: null,
        quantity: 1,
        createdAt: "2025-06-28T05:37:02.317Z",
        updatedAt: "2025-06-28T05:37:02.317Z",
        product: products[1],
        variant: null,
        isSelected: true,
      ),
      CartItem(
        id: 3,
        cartId: 1,
        productId: 3,
        variantId: null,
        quantity: 1,
        createdAt: "2025-06-28T05:37:02.317Z",
        updatedAt: "2025-06-28T05:37:02.317Z",
        product: products[2],
        variant: null,
        isSelected: false,
      ),
      CartItem(
        id: 4,
        cartId: 1,
        productId: 4,
        variantId: null,
        quantity: 1,
        createdAt: "2025-06-28T05:37:02.317Z",
        updatedAt: "2025-06-28T05:37:02.317Z",
        product: products[3],
        variant: null,
        isSelected: false,
      ),
    ];

    final summary = CartSummary(
      subtotal: 5177.0,
      shippingFee: 140.0,
      taxAmount: 0.0,
      discountAmount: 412.0,
      total: 4905.0,
      itemCount: 2, // Selected items count
    );

    final cart = Cart(items: cartItems, summary: summary);
    final cartData = CartData(cart: cart);

    return CartResponse(success: true, data: cartData);
  }
}

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late List<CartItem> cartItems;
  late CartSummary cartSummary;
  late Map<int, List<CartItem>> groupedItems;
  // late Map<int, ExtendedVendorModel> vendorSelectionMap;
  bool selectAll = false;

  @override
  void initState() {
    super.initState();
    final dummyCart = DummyCartData.generateDummyCart();
    cartItems = List.from(dummyCart.data.cart.items);
    cartSummary = dummyCart.data.cart.summary;
    _groupItemsByVendor();
    _initializeVendorSelection();
  }

  void _groupItemsByVendor() {
    groupedItems = {};
    for (var item in cartItems) {
      if (item.product.vendor != null) {
        int vendorId = item.product.vendor!.id;
        if (!groupedItems.containsKey(vendorId)) {
          groupedItems[vendorId] = [];
        }
        groupedItems[vendorId]!.add(item);
      }
    }
  }

  void _initializeVendorSelection() {
    vendorSelectionMap = {};
    for (var vendorId in groupedItems.keys) {
      var vendor = groupedItems[vendorId]!.first.product.vendor;
      if (vendor != null) {
        vendorSelectionMap[vendorId] = ExtendedVendorModel.fromVendorModel(
          vendor,
        );
      }
    }
  }

  void _toggleSelectAll(bool? value) {
    setState(() {
      selectAll = value ?? false;
      for (var item in cartItems) {
        item.isSelected = selectAll;
      }
      for (var vendorId in vendorSelectionMap.keys) {
        vendorSelectionMap[vendorId]!.isSelected = selectAll;
      }
      _recalculateSummary();
    });
  }

  void _toggleVendorSelection(int vendorId, bool? value) {
    setState(() {
      bool isSelected = value ?? false;
      vendorSelectionMap[vendorId]!.isSelected = isSelected;

      for (var item in groupedItems[vendorId] ?? []) {
        item.isSelected = isSelected;
      }

      _updateSelectAllState();
      _recalculateSummary();
    });
  }

  void _toggleItemSelection(CartItem item, bool? value) {
    setState(() {
      item.isSelected = value ?? false;

      if (item.product.vendor != null) {
        int vendorId = item.product.vendor!.id;
        var vendorItems = groupedItems[vendorId] ?? [];
        bool allVendorItemsSelected = vendorItems.every(
          (item) => item.isSelected,
        );
        vendorSelectionMap[vendorId]!.isSelected = allVendorItemsSelected;
      }

      _updateSelectAllState();
      _recalculateSummary();
    });
  }

  void _updateSelectAllState() {
    selectAll = cartItems.every((item) => item.isSelected);
  }

  void _updateQuantity(CartItem item, int newQuantity) {
    if (newQuantity <= 0) return;

    setState(() {
      item.quantity = newQuantity;
      _recalculateSummary();
    });
  }

  void _recalculateSummary() {
    double subtotal = 0;
    int selectedCount = 0;

    for (var item in cartItems) {
      if (item.isSelected) {
        subtotal += item.product.price * item.quantity;
        selectedCount++;
      }
    }

    double shippingFee = subtotal > 0 ? 140 : 0;
    double discountAmount = subtotal * 0.08; // 8% discount
    double total = subtotal + shippingFee - discountAmount;

    cartSummary = CartSummary(
      subtotal: subtotal,
      shippingFee: shippingFee,
      taxAmount: 0,
      discountAmount: discountAmount,
      total: total,
      itemCount: selectedCount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "My Cart",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.location_on, size: 14, color: Colors.grey),
                  SizedBox(width: 4),
                  Text(
                    "Laxmi Marga Chowk",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete_outline, color: Colors.black),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 8),
          Expanded(
            child: ListView(
              children: [
                ...groupedItems.entries.map((entry) {
                  int vendorId = entry.key;
                  List<CartItem> items = entry.value;
                  ExtendedVendorModel? vendor = vendorSelectionMap[vendorId];

                  if (vendor == null) return const SizedBox.shrink();

                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    color: Colors.white,
                    child: Column(
                      children: [
                        // Vendor Header
                        Container(
                          padding: const EdgeInsets.all(6),
                          child: Row(
                            children: [
                              Checkbox(
                                value: vendor.isSelected,
                                onChanged:
                                    (value) =>
                                        _toggleVendorSelection(vendorId, value),
                                activeColor: const Color(0xFF2196F3),
                              ),
                              const Icon(
                                Icons.store,
                                size: 20,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                vendor.businessName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Icon(
                                Icons.chevron_right,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),

                        // Vendor Items
                        ...items.map(
                          (item) => CartItemWidget(
                            item: item,
                            onSelectionChanged:
                                (value) => _toggleItemSelection(item, value),
                            onQuantityChanged:
                                (quantity) => _updateQuantity(item, quantity),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),

          // Bottom Summary
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: selectAll,
                        onChanged: _toggleSelectAll,
                        activeColor: const Color(0xFF2196F3),
                      ),

                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Subtotal: Rs. ${cartSummary.subtotal.toStringAsFixed(0)}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Shipping Fee: Rs. ${cartSummary.shippingFee.toStringAsFixed(0)}",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "Total Discount Rs. ${cartSummary.discountAmount.toStringAsFixed(0)}",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.pink,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF5722),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Check Out(${cartSummary.itemCount})",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final CartItem item;
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
          Checkbox(
            value: item.isSelected,
            onChanged: onSelectionChanged,
            activeColor: const Color(0xFF2196F3),
          ),

          // Product Image
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(8),
            ),
            child:
                item.product.image?.url != null
                    ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        item.product.image!.url!,
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

          // Product Details
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
                if (item.product.stockQuantity != null) ...[
                  Text(
                    "${item.product.stockQuantity} item(s) left",
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                ],

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
                    // Quantity Controls
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () {
                                  if (item.quantity > 1) {
                                    onQuantityChanged(item.quantity - 1);
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  child: const Icon(
                                    Icons.remove,
                                    size: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 4,
                                ),
                                child: Text(
                                  item.quantity.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  onQuantityChanged(item.quantity + 1);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  child: const Icon(
                                    Icons.add,
                                    size: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
