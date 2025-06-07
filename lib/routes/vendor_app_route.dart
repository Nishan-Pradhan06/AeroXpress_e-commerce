import 'package:deal_sell/common/extension/path_extension.dart';
import 'package:go_router/go_router.dart';
import '../features/vendor/dashboard/dashboard_page.dart';
import '../features/vendor/orders/screen/orders_page.dart';
import '../features/vendor/products/screens/product_page.dart';
import '../features/vendor/settings/screen/setting_page.dart';
import '../features/vendor/vendor_bottom_nav_bar/vendor_btn_nav.dart';
import 'app_route_names.dart';

List<GoRoute> vendorAppRoutes = [
  GoRoute(
    path: AppRoutesName.vendorBottomNavBar.path,
    name: AppRoutesName.vendorBottomNavBar,
    builder: (context, state) => const VendorBtnNavBar(),
  ),
  GoRoute(
    path: AppRoutesName.vendorDashboard.path,
    name: AppRoutesName.vendorDashboard,
    builder: (context, state) => const DashboardPage(),
  ),
  GoRoute(
    path: AppRoutesName.vendorProducts.path,
    name: AppRoutesName.vendorProducts,
    builder: (context, state) => const ProductPage(),
  ),
  GoRoute(
    path: AppRoutesName.vendorOrders.path,
    name: AppRoutesName.vendorOrders,
    builder: (context, state) => const OrdersPage(),
  ),
  GoRoute(
    path: AppRoutesName.vendorSettings.path,
    name: AppRoutesName.vendorSettings,
    builder: (context, state) => const SettingPage(),
  ),
];
