import 'package:deal_sell/common/extension/path_extension.dart';
import 'package:deal_sell/routes/app_route_names.dart';
import 'package:go_router/go_router.dart';
import 'user_app_route.dart';
import 'vendor_app_route.dart';

final router = GoRouter(
  initialLocation: AppRoutesName.splashScreen.path,
  routes: [...userAppRoutes, ...vendorAppRoutes],
);
