import 'package:deal_sell/core/network/api_services.dart';
import 'package:deal_sell/core/network/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/auth/blocs/customer_sign_up/customer_sign_up_bloc.dart';
import '../../features/auth/blocs/user_sign_in/user_sign_in_bloc.dart';
import '../../features/auth/repository/auth_repository.dart';
import '../../features/shared/on_boarding/cubit/on_boarding_cubit.dart';
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

  //###------------REPOSITORY-----------###
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(apiService: sl()),
  );

  sl.registerLazySingleton<ApiService>(() => ApiService(sl<Dio>()));
  sl.registerLazySingleton<DioClient>(() => DioClient());
  sl.registerLazySingleton<Dio>(() => sl<DioClient>().dio);
}
