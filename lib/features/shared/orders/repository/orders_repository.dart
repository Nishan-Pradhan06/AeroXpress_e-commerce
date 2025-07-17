import 'package:dartz/dartz.dart';
import 'package:deal_sell/common/typedef/either_type.dart';
import 'package:deal_sell/core/network/api_services.dart';
import '../model/order_model.dart';

abstract interface class OrderRepository {
  FutureEither<List<OrderModel>> getOrders({int page = 1});
}

class OrderRepositoryImpl implements OrderRepository {
  final ApiService _apiService;

  OrderRepositoryImpl({required ApiService apiService})
    : _apiService = apiService;

  //###-------------CUSTOMER ORDERS REPO IMPL-----------------###
  @override
  FutureEither<List<OrderModel>> getOrders({int page = 1}) async {
    final response = await _apiService.get<Map>('orders?page=$page');

    return response.fold((failure) => Left(failure), (data) {
      final ordersJson = data['data']['orders'] as List;
      final orders =
          ordersJson
              .map((orderJson) => OrderModel.fromJson(orderJson))
              .toList();
      return Right(orders);
    });
  }
}
