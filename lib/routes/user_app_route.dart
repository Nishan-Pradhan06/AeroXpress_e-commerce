import 'package:deal_sell/common/extension/path_extension.dart';
import 'package:go_router/go_router.dart';
import '../core/dl/dependency_injection.dart';
import '../core/services/once_cache_service.dart';
import '../features/auth/views/forget_password.dart';
import '../features/cutomers/notification/views/notifcation_screen.dart';
import '../features/shared/user_profile/views/customer_profile/help_center_screen.dart';
import '../features/shared/user_profile/views/customer_profile/theme_screen.dart';
import '../features/shared/on_boarding/on_boarding_screen.dart';
import '../features/shared/splash_screen/splash_screen.dart';
import '../features/auth/views/login_screen.dart';
import '../features/auth/views/register_screen.dart';
import '../features/cutomers/bottom_nav_bar/bottom_nav_bar.dart';
import 'app_route_names.dart';

List<GoRoute> userAppRoutes = [
  GoRoute(
    path: AppRoutesName.splashScreen.path,
    name: AppRoutesName.splashScreen,
    builder: (context, state) => SplashScreen(),
  ),
  GoRoute(
    path: AppRoutesName.onBoarding.path,
    name: AppRoutesName.onBoarding,
    redirect: (context, state) async {
      final isOnBoardingCompleted =
          await sl<OnceCacheService>().getOnBoardingCache();
      if (isOnBoardingCompleted != null) {
        return AppRoutesName.loginScreen.path;
      }
      return null;
    },
    builder: (context, state) => OnBoardingScreen(),
  ),
  GoRoute(
    path: AppRoutesName.bottomNavBar.path,
    name: AppRoutesName.bottomNavBar,
    builder: (context, state) => BottomNavBarScreen(),
  ),
  GoRoute(
    path: AppRoutesName.loginScreen.path,
    name: AppRoutesName.loginScreen,
    builder: (context, state) => LoginScreen(),
  ),
  GoRoute(
    path: AppRoutesName.registerScreen.path,
    name: AppRoutesName.registerScreen,
    builder: (context, state) => RegisterScreen(),
  ),
  GoRoute(
    path: AppRoutesName.forgetPassword.path,
    name: AppRoutesName.forgetPassword,
    builder: (context, state) => ForgetPasswordScreen(),
  ),
  GoRoute(
    path: AppRoutesName.themeSelectionScreen.path,
    name: AppRoutesName.themeSelectionScreen,
    builder: (context, state) => ThemeSelectorScreen(),
  ),
  GoRoute(
    path: AppRoutesName.helpScreen.path,
    name: AppRoutesName.helpScreen,
    builder: (context, state) => HelpCenterScreen(),
  ),
  GoRoute(
    path: AppRoutesName.notificationScreen.path,
    name: AppRoutesName.notificationScreen,
    builder: (context, state) => NotificationScreen(),
  ),
];
