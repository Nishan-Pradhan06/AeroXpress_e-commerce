import 'package:deal_sell/core/config/env_config.dart';
import 'package:deal_sell/core/services/cache_services.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:upgrader/upgrader.dart';
import 'core/dl/dependency_injection.dart';
import 'core/services/once_cache_service.dart';
import 'core/theme/app_theme.dart';
import 'features/shared/on_boarding/cubit/on_boarding_cubit.dart';
import 'features/vendor/products/cubit/fav_cubit.dart';
import 'routes/app_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //firebase initialized
  await Firebase.initializeApp();

  // Only call clearSavedSettings() during testing to reset internal values.
  await Upgrader.clearSavedSettings();

  //dependency Injection service locator
  await setupServiceLocator();

  //Crashlytics initialized
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  //Enviroment Config
  EnvConfig.initialize(Environment.development);

  //Global SharedPreferences
  await CacheServices.instance.init();

  //Once SharedPreferences
  await sl<OnceCacheService>().init();

  runApp(DevicePreview(enabled: false, builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<OnBoardingCubit>()),
        BlocProvider(create: (context) => sl<FabCubit>()),
      ],
      child: ShadApp.custom(
        appBuilder: (context) {
          return MaterialApp.router(
            title: 'Deal Sell',
            theme: appThemeData,
            themeAnimationCurve: Curves.easeInOut,
            themeAnimationStyle: AnimationStyle(curve: Curves.bounceIn),
            debugShowCheckedModeBanner: false,
            routerConfig: router,
          );
        },
      ),
    );
  }
}
