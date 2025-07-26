import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/orders/repository/orders_repository.dart';
import '../../../shared/products/repository/products_repository.dart';

part 'vendor_stats_state.dart';

class VendorStatsCubit extends Cubit<VendorStatsState> {
  final OrderRepository _orderRepository;
  final ProductsRepository _productsRepository;

  VendorStatsCubit({
    required OrderRepository orderRepo,
    required ProductsRepository productRepo,
  }) : _orderRepository = orderRepo,
       _productsRepository = productRepo,
       super(const VendorStatsState(status: 'initial'));

  Future<void> loadVendorStats() async {
    emit(const VendorStatsState(status: 'loading'));

    final ordersResult = await _orderRepository.getVendorOrders();
    final productsResult = await _productsRepository.getVendorProducts();

    if (ordersResult.isLeft() || productsResult.isLeft()) {
      emit(const VendorStatsState(status: 'failure'));
      return;
    }

    final orders = ordersResult.getOrElse(() => []);
    final products = productsResult.getOrElse(() => []);

    double totalEarnings = 0;
    Set<String> uniqueCustomers = {};
    int totalOrders = orders.length;

    for (final order in orders) {
      if (order.status.toLowerCase() == 'delivered') {
        totalEarnings += double.tryParse(order.total) ?? 0.0;
      }

      final phone = order.shippingAddress.phone ?? '';
      if (phone.isNotEmpty) uniqueCustomers.add(phone);
    }

    final totalProducts = products.length;

    emit(
      VendorStatsState(
        totalEarnings: totalEarnings,
        totalOrders: totalOrders,
        totalProducts: totalProducts,
        totalCustomers: uniqueCustomers.length,
        status: 'success',
      ),
    );
  }
}
