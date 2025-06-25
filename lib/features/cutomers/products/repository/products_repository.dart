import 'package:dartz/dartz.dart';

import '../../../../common/typedef/either_type.dart';
import '../../../../core/network/api_services.dart';
import '../models/products_model.dart';

abstract interface class ProductsRepository {
  //##-------------------GET ALL PRODUCTS-------------------------##
  FutureEither<List<ProductModel>> getAllProducts();

  //##-------------------GET PRODUCT BY ID-------------------------##
  // FutureEither<ProductModel> getProductById({required String productId});

  //##-------------------ADD PRODUCT TO CART-------------------------##
  // FutureEither<String> addProductToCart({required String productId});

  //##-------------------REMOVE PRODUCT FROM CART-------------------------##
  // FutureEither<String> removeProductFromCart({required String productId});
}

//##-------------------PRODUCTS REPOSITORY IMPLEMENTATION-------------------------##
class ProductRepositoryImpl implements ProductsRepository {
  final ApiService _apiService;

  ProductRepositoryImpl({required ApiService apiService})
    : _apiService = apiService;

  @override
  FutureEither<List<ProductModel>> getAllProducts() async {
    final response = await _apiService.get<Map>('products');

    return response.fold((failure) => Left(failure), (data) {
      final List productsJson = data['data']['products'];
      final List<ProductModel> products =
          productsJson.map((json) => ProductModel.fromJson(json)).toList();
      return Right(products);
    });
  }
}
