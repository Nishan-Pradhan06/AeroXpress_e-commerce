import 'package:dartz/dartz.dart';
import 'package:deal_sell/common/typedef/either_type.dart';
import '../../../../core/network/api_services.dart';
import '../models/wishlist_model.dart';

abstract interface class WishlistRepository {
  FutureEither<List<WishlistProduct>> getWishlist({int page = 1});
}

class WishlistRepositoryImpl implements WishlistRepository {
  final ApiService _apiService;

  WishlistRepositoryImpl({required ApiService apiService})
    : _apiService = apiService;

  @override
  FutureEither<List<WishlistProduct>> getWishlist({int page = 1}) async {
    final response = await _apiService.get<Map<String, dynamic>>(
      'wishlist?page=$page',
    );

    return response.fold((failure) => Left(failure), (data) {
      final List<dynamic> wishlistJsonList = data['wishlist'] as List<dynamic>;
      final List<WishlistProduct> wishlistProducts =
          wishlistJsonList
              .map(
                (item) =>
                    WishlistProduct.fromJson(item as Map<String, dynamic>),
              )
              .toList();

      return Right(wishlistProducts);
    });
  }
}
