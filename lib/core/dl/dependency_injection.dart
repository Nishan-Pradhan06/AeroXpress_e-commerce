import 'package:deal_sell/core/network/api_services.dart';
import 'package:deal_sell/core/network/dio_client.dart';
import 'package:deal_sell/features/auth/cubit/logout_cubit.dart';
import 'package:deal_sell/features/cutomers/category/bloc/category_bloc.dart';
import 'package:deal_sell/features/cutomers/category/repository/category_repository.dart';
import 'package:deal_sell/features/cutomers/products/blocs/all_products/products_bloc.dart';
import 'package:deal_sell/features/cutomers/products/blocs/get_products_by_slug/get_product_by_slug_bloc.dart';
import 'package:deal_sell/features/cutomers/products/repository/products_repository.dart';
import 'package:deal_sell/features/shared/user_profile/repository/my_profile_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/auth/blocs/customer_sign_up/customer_sign_up_bloc.dart';
import '../../features/auth/blocs/user_sign_in/user_sign_in_bloc.dart';
import '../../features/auth/repository/auth_repository.dart';
import '../../features/shared/on_boarding/cubit/on_boarding_cubit.dart';
import '../../features/shared/user_profile/bloc/get_user_profile_bloc.dart';
import '../../features/vendor/products/cubit/fav_cubit.dart';
import '../services/once_cache_service.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  //###---------------GLOBAL BLOC--------------###
  sl.registerLazySingleton(() => OnceCacheService());
  sl.registerLazySingleton(() => OnBoardingCubit(onceService: sl()));
  sl.registerFactory(() => FabCubit());

  //###---------------BLOC--------------###
  sl.registerLazySingleton(() => UserSignInBloc(repo: sl()));
  sl.registerLazySingleton(() => CustomerSignUpBloc(repo: sl()));
  sl.registerLazySingleton(() => GetUserProfileBloc(repo: sl()));
  sl.registerLazySingleton(() => ProductsBloc(repo: sl()));
  sl.registerLazySingleton(() => CategoryBloc(repo: sl()));
  // sl.registerLazySingleton(() => GetProductBySlugBloc(repo: sl()));
  sl.registerFactory(() => GetProductBySlugBloc(repo: sl()));

  //###---------------CUBIT--------------###
  sl.registerLazySingleton(() => LogoutCubit(repo: sl()));

  //###------------REPOSITORY-----------###
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(apiService: sl()),
  );
  sl.registerLazySingleton<MyProfileRepository>(
    () => MyProfileRepositoryImpl(apiService: sl()),
  );
  sl.registerLazySingleton<ProductsRepository>(
    () => ProductRepositoryImpl(apiService: sl()),
  );
  sl.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(apiService: sl()),
  );

  sl.registerLazySingleton<ApiService>(() => ApiService(sl<Dio>()));
  sl.registerLazySingleton<DioClient>(() => DioClient());
  sl.registerLazySingleton<Dio>(() => sl<DioClient>().dio);
}
