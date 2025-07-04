import 'package:deal_sell/core/config/env_config.dart';
import 'package:deal_sell/core/services/cache_services.dart';
import 'package:deal_sell/features/auth/blocs/customer_sign_up/customer_sign_up_bloc.dart';
import 'package:deal_sell/features/auth/blocs/user_sign_in/user_sign_in_bloc.dart';
import 'package:deal_sell/features/cutomers/cart/bloc/add_to_cart/add_to_cart_bloc.dart';
import 'package:deal_sell/features/cutomers/cart/bloc/get_cart/get_cart_bloc.dart';
import 'package:deal_sell/features/cutomers/category/bloc/category_bloc.dart';
import 'package:deal_sell/features/cutomers/products/blocs/all_products/products_bloc.dart';
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
import 'features/auth/cubit/logout_cubit.dart';
import 'features/shared/on_boarding/cubit/on_boarding_cubit.dart';
import 'features/shared/user_profile/bloc/get_user_profile_bloc.dart';
import 'features/vendor/products/cubit/fav_cubit.dart';
import 'routes/app_route.dart';

void main() async {
  //microsoft clarity
  // final config = ClarityConfig(
  //   projectId: "s17mi51e6s",
  //   logLevel:
  //       LogLevel
  //           .Verbose, // Note: Use "LogLevel.Verbose" value while testing to debug initialization issues.
  // );

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
//   runApp(
//     DevicePreview(
//       enabled: false,
//       builder: (context) => ClarityWidget(app: MyApp(), clarityConfig: config),
//     ),
//   );
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //###---------------BLOC--------------###
        BlocProvider(create: (context) => sl<CustomerSignUpBloc>()),
        BlocProvider(create: (context) => sl<UserSignInBloc>()),
        BlocProvider(create: (context) => sl<AddToCartBloc>()),
        // BlocProvider(create: (context) => sl<ProductsBloc>()),
        BlocProvider(
          create:
              (context) =>
                  sl<GetUserProfileBloc>()
                    ..add(GetUserProfileEvent.getUserProfile()),
        ),
        BlocProvider(
          create:
              (context) => sl<ProductsBloc>()..add(ProductsEvent.products()),
        ),
        BlocProvider(
          create:
              (context) => sl<CategoryBloc>()..add(CategoryEvent.getCategory()),
        ),
        BlocProvider(
          create:
              (context) => sl<GetCartBloc>()..add(GetCartEvent.getCart()),
        ),

        //###---------------CUBIT-------------###
        BlocProvider(create: (context) => sl<OnBoardingCubit>()),
        BlocProvider(create: (context) => sl<FabCubit>()),
        BlocProvider(create: (context) => sl<LogoutCubit>()),
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
