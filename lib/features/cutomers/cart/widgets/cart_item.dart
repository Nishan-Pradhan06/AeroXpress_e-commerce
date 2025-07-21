import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/api.dart';
import '../../../../core/dl/dependency_injection.dart';
import '../../../../core/theme/app_color.dart';
import '../bloc/get_cart/get_cart_bloc.dart';
import '../models/cart_item_model.dart';

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
                      child: CachedNetworkImage(
                        imageUrl:
                            'http://$LOCAL_IP:5000${item.product.vendor!.logo}',
                        fit: BoxFit.cover,
                        placeholder:
                            (context, url) => const Center(
                              child: SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                            ),
                        errorWidget:
                            (context, url, error) => const Icon(
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
                      "Rs. ${item.product.price}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.lightTheme.brandPrimary,
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
