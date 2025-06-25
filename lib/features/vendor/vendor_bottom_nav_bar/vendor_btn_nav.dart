import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../shared/user_profile/views/customer_profile/profile_screen.dart';
import '../dashboard/dashboard_page.dart';
import '../orders/screen/orders_page.dart';
import '../products/screens/product_page.dart';

class VendorBtnNavBar extends StatefulWidget {
  const VendorBtnNavBar({super.key});

  @override
  State<VendorBtnNavBar> createState() => _VendorBtnNavBarState();
}

class _VendorBtnNavBarState extends State<VendorBtnNavBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    DashboardPage(),
    ProductPage(),
    OrdersPage(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: Material(
        elevation: 8,
        child: BottomNavigationBar(
          unselectedLabelStyle: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
          selectedLabelStyle: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w700,
          ),
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          // showSelectedLabels: false,
          // showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(PhosphorIconsRegular.house),
              activeIcon: Icon(PhosphorIconsFill.house),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(PhosphorIconsRegular.package),
              activeIcon: Icon(PhosphorIconsFill.package),
              label: 'Products',
            ),
            BottomNavigationBarItem(
              icon: Icon(PhosphorIconsRegular.shoppingCart),
              activeIcon: Icon(PhosphorIconsFill.shoppingCart),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(PhosphorIconsRegular.dotsThreeOutline),
              activeIcon: Icon(PhosphorIconsFill.dotsThree),
              label: 'More',
            ),
          ],
        ),
      ),
    );
  }
}
