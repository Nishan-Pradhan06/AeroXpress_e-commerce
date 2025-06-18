import 'package:deal_sell/features/shared/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:get_it/get_it.dart';
import '../../features/vendor/products/cubit/fav_cubit.dart';
import '../services/once_cache_service.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  sl.registerLazySingleton(() => OnceCacheService());
  sl.registerLazySingleton(() => OnBoardingCubit(onceService: sl()));
    sl.registerFactory(() => FabCubit());
}
