import 'package:dartz/dartz.dart';
import 'package:deal_sell/features/shared/products/models/vendor_product_model.dart';

import '../../../../common/typedef/either_type.dart';
import '../../../../core/network/api_services.dart';
import '../models/products_model.dart';

abstract interface class ProductsRepository {
  //##-------------------GET ALL PRODUCTS-------------------------##
  FutureEither<List<ProductModel>> getAllProducts();

  //##-------------------GET PRODUCT BY ID-------------------------##
  // FutureEither<ProductModel> getProductById({required String productId});

  //##-------------------GET PRODUCT BY SLUG-------------------------##
  FutureEither<ProductModel> getProductBySlug({required String slug});

  //##-------------------ADD PRODUCT TO CART-------------------------##
  // FutureEither<String> addProductToCart({required String productId});

  //##-------------------REMOVE PRODUCT FROM CART-------------------------##
  // FutureEither<String> removeProductFromCart({required String productId});

  /// Get authenticated vendor's products
  FutureEither<List<VendorProductModel>> getVendorProducts();
}

//##-------------------PRODUCTS REPOSITORY IMPLEMENTATION-------------------------##
class ProductRepositoryImpl implements ProductsRepository {
  final ApiService _apiService;

  ProductRepositoryImpl({required ApiService apiService})
    : _apiService = apiService;

  //##-------------------GET ALL PRODUCTS-------------------------##
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

  //##-------------------GET PRODUCT BY SLUG-------------------------##
  @override
  FutureEither<ProductModel> getProductBySlug({required String slug}) async {
    final response = await _apiService.get<Map>('products/$slug');

    return response.fold((failure) => Left(failure), (data) {
      final productJson = data['data']['product'];
      final product = ProductModel.fromJson(productJson);
      return Right(product);
    });
  }

  /// Fetch all products of the authenticated vendor using token
  @override
  FutureEither<List<VendorProductModel>> getVendorProducts() async {
    final response = await _apiService.get<Map>('vendors/products');

    return response.fold((failure) => Left(failure), (data) {
      final List productsJson = data['data']['products'];
      final List<VendorProductModel> products =
          productsJson.map((json) => VendorProductModel.fromJson(json)).toList();
      return Right(products);
    });
  }
}
