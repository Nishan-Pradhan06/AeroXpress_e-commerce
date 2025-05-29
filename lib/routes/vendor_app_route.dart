import 'package:deal_sell/common/extension/path_extension.dart';
import 'package:go_router/go_router.dart';
import 'app_route_names.dart';

List<GoRoute> vendorAppRoutes = [
  GoRoute(
    path: AppRoutesName.vendorDashboard.path,
    name: AppRoutesName.vendorDashboard,
    builder: (context, state) => const DashboardScreen(),
  ),
  GoRoute(
    path: AppRoutesName.vendorProducts.path,
    name: AppRoutesName.vendorProducts,
    builder: (context, state) => const ProductsScreen(),
  ),
  GoRoute(
    path: AppRoutesName.vendorOrders.path,
    name: AppRoutesName.vendorOrders,
    builder: (context, state) => const OrdersScreen(),
  ),
  GoRoute(
    path: AppRoutesName.vendorAnalytics.path,
    name: AppRoutesName.vendorAnalytics,
    builder: (context, state) => const AnalyticsScreen(),
  ),
  GoRoute(
    path: AppRoutesName.vendorCustomers.path,
    name: AppRoutesName.vendorCustomers,
    builder: (context, state) => const CustomersScreen(),
  ),
  GoRoute(
    path: AppRoutesName.vendorSettings.path,
    name: AppRoutesName.vendorSettings,
    builder: (context, state) => const SettingsScreen(),
  ),
];
