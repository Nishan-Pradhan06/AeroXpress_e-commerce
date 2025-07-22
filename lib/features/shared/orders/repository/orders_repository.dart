import 'package:dartz/dartz.dart';
import 'package:deal_sell/common/typedef/either_type.dart';
import 'package:deal_sell/core/network/api_services.dart';
import '../model/order_model.dart';

abstract interface class OrderRepository {
  FutureEither<List<OrderModel>> getOrders({int page = 1});
  FutureEither<List<OrderModel>> getVendorOrders({int page = 1});
  FutureEither<OrderModel> createOrder(Map<String, dynamic> payload);

  FutureEither<OrderModel> confirmCodPayment(String orderId);

  // FutureEither<OrderModel> initiateKhalti(Map<String, dynamic> payload);
  FutureEither<OrderModel> verifyKhalti({required String token});

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

  //###-------------VENDORS ORDERS REPO IMPL-----------------###
  @override
  FutureEither<List<OrderModel>> getVendorOrders({int page = 1}) async {
    final response = await _apiService.get<Map>(
      'orders/vendors/orders?page=$page',
    );

    return response.fold((failure) => Left(failure), (data) {
      final ordersJson = data['data']['orders'] as List;
      final orders =
          ordersJson
              .map((orderJson) => OrderModel.fromJson(orderJson))
              .toList();
      return Right(orders);
    });
  }

  //###-------------POST (CREATE ORDER) IMPLEMENTATION-----------------###
  @override
  FutureEither<OrderModel> createOrder(Map<String, dynamic> payload) async {
    final response = await _apiService.post<Map>('orders', data: payload);

    return response.fold((failure) => Left(failure), (data) {
      final orderJson = data['data']['order'];
      final order = OrderModel.fromJson(orderJson);
      return Right(order);
    });
  }


  @override
  FutureEither<OrderModel> confirmCodPayment(String orderId) async {
    final response = await _apiService.post<Map>(
      'payments/cod/confirm',
      data: {'orderId': orderId},
    );

    return response.fold((failure) => Left(failure), (data) {
      final orderJson = data['data']['order'];
      final order = OrderModel.fromJson(orderJson);
      return Right(order);
    });
  }


// @override
//   FutureEither<OrderModel> initiateKhalti(Map<String, dynamic> payload) async {
//     final response = await _apiService.post<Map>(
//       'payments/khalti/inisitate',
//       data: payload,
//     );
//     return response.fold((f) => Left(f), (data) {
//       final token = data['data']['token'] as String;
//       return Right(OrderModel(khaltiToken: token)); // wrap token in model
//     });
//   }

  @override
  FutureEither<OrderModel> verifyKhalti({required String token}) async {
    final response = await _apiService.post<Map>(
      'payments/khalti/verify',
      data: {'token': token},
    );
    return response.fold((f) => Left(f), (data) {
      final orderJson = data['data']['order'];
      return Right(OrderModel.fromJson(orderJson));
    });
  }

}
