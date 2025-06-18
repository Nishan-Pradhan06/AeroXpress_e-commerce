import 'package:deal_sell/core/constant/bottom_nav_icon_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/widget/badge.dart';
import '../cart/presentation/screens/cart_screen.dart';
import '../category/presentation/screens/category_screen.dart';
import '../home/views/home_screen.dart';
import '../profile/presentation/screens/profile_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: Material(
        elevation: 8,
        child: BottomNavigationBar(
          // selectedLabelStyle: ,
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
              icon: SvgPicture.asset(BottomNavIconConstant.home),
              activeIcon: SvgPicture.asset(BottomNavIconConstant.homeBold),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(BottomNavIconConstant.category),
              activeIcon: SvgPicture.asset(BottomNavIconConstant.categoryBold),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              icon: CustomBadge(
                count: '4',
                child: SvgPicture.asset(BottomNavIconConstant.cart),
              ),
              activeIcon: CustomBadge(
                count: '4',
                child: SvgPicture.asset(BottomNavIconConstant.cartBold),
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(BottomNavIconConstant.profile),
              activeIcon: SvgPicture.asset(BottomNavIconConstant.profileBold),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
