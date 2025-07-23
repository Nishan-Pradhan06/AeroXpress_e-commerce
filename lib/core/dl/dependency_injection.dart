import 'package:deal_sell/core/network/api_services.dart';
import 'package:deal_sell/core/network/dio_client.dart';
import 'package:deal_sell/features/auth/cubit/logout_cubit.dart';
import 'package:deal_sell/features/shared/orders/bloc/create_orders/create_orders_bloc.dart';
import 'package:deal_sell/features/shared/orders/bloc/customer_orders/all_order_bloc.dart';
import 'package:deal_sell/features/shared/orders/bloc/update_vendor_order_status/update_vendor_order_status_bloc.dart';
import 'package:deal_sell/features/shared/orders/bloc/vendor_orders/vendor_orders_bloc.dart';
import 'package:deal_sell/features/shared/orders/repository/orders_repository.dart';
import 'package:deal_sell/features/cutomers/cart/bloc/add_to_cart/add_to_cart_bloc.dart';
import 'package:deal_sell/features/cutomers/cart/bloc/delete_cart/delete_cart_bloc.dart';
import 'package:deal_sell/features/cutomers/cart/bloc/get_cart/get_cart_bloc.dart';
import 'package:deal_sell/features/cutomers/cart/bloc/shipping_options/shipping_options_bloc.dart';
import 'package:deal_sell/features/cutomers/cart/repository/cart_repository.dart';
import 'package:deal_sell/features/cutomers/category/bloc/category_bloc.dart';
import 'package:deal_sell/features/cutomers/category/repository/category_repository.dart';
import 'package:deal_sell/features/shared/products/blocs/all_products/products_bloc.dart';
import 'package:deal_sell/features/shared/products/blocs/get_products_by_slug/get_product_by_slug_bloc.dart';
import 'package:deal_sell/features/shared/products/blocs/get_vendors_products/get_vendors_products_bloc.dart';
import 'package:deal_sell/features/shared/products/repository/products_repository.dart';
import 'package:deal_sell/features/shared/payments/bloc/khalti_payment_initiate/khalti_payment_initiate_bloc.dart';
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
  sl.registerLazySingleton(() => AddToCartBloc(repo: sl()));
  sl.registerLazySingleton(() => GetCartBloc(repo: sl()));
  sl.registerFactory(() => DeleteCartBloc(repo: sl()));
  sl.registerLazySingleton(() => ShippingOptionsBloc(repo: sl()));
  sl.registerLazySingleton(() => AllOrderBloc(repo: sl()));
  sl.registerLazySingleton(() => VendorOrdersBloc(repo: sl()));
  sl.registerLazySingleton(() => CreateOrdersBloc(repo: sl()));
  // sl.registerLazySingleton(() => GetProductBySlugBloc(repo: sl()));
  sl.registerFactory(() => GetProductBySlugBloc(repo: sl()));

  //###---------------CUBIT--------------###
  sl.registerLazySingleton(() => LogoutCubit(repo: sl()));
  sl.registerLazySingleton(() => KhaltiPaymenetInitiateBloc(repo: sl()));
  sl.registerFactory(() => GetVendorsProductsBloc(repo: sl()));
  sl.registerFactory(() => UpdateVendorOrderStatusBloc(repo: sl()));

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
  sl.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(apiService: sl()),
  );
  sl.registerLazySingleton<OrderRepository>(
    () => OrderRepositoryImpl(apiService: sl()),
  );

  sl.registerLazySingleton<ApiService>(() => ApiService(sl<Dio>()));
  sl.registerLazySingleton<DioClient>(() => DioClient());
  sl.registerLazySingleton<Dio>(() => sl<DioClient>().dio);
}
