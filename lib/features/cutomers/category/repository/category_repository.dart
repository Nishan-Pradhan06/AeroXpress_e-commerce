import 'package:dartz/dartz.dart';
import '../../../../common/typedef/either_type.dart';
import '../../../../core/network/api_services.dart';
import '../models/category_model.dart';

abstract interface class CategoryRepository {
  FutureEither<List<CategoryModel>> getAllCategories({
    int? page,
    int? limit,
    String? parentSlug,
    bool? isFeatured,
    String? search,
  });
}

class CategoryRepositoryImpl implements CategoryRepository {
  final ApiService _apiService;

  CategoryRepositoryImpl({required ApiService apiService})
    : _apiService = apiService;

  @override
  FutureEither<List<CategoryModel>> getAllCategories({
    int? page,
    int? limit,
    String? parentSlug,
    bool? isFeatured,
    String? search,
  }) async {
    // Dynamically build query parameters
    final Map<String, dynamic> queryParams = {};

    if (page != null) queryParams['page'] = page;
    if (limit != null) queryParams['limit'] = limit;
    if (parentSlug != null) queryParams['parent'] = parentSlug;
    if (isFeatured != null) queryParams['featured'] = isFeatured;
    if (search != null && search.isNotEmpty) queryParams['search'] = search;

    final response = await _apiService.get<Map>(
      'categories',
      queryParameters: queryParams,
    );

    return response.fold((failure) => Left(failure), (data) {
      final List categoryList = data['data']['categories'];
      final List<CategoryModel> category =
          categoryList.map((json) => CategoryModel.fromJson(json)).toList();

      return Right(category);
    });
  }
}
