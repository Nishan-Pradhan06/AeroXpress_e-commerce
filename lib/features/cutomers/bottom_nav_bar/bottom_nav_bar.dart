import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:shorebird_code_push/shorebird_code_push.dart';
import 'package:deal_sell/core/constant/bottom_nav_icon_constant.dart';
import '../../../core/widget/badge.dart';
import '../cart/views/cart_screen.dart';
import '../category/views/category_screen.dart';
import '../home/views/home_screen.dart';
import '../../shared/user_profile/views/customer_profile/profile_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _currentIndex = 0;
  // final shoreBirdUpdater = ShorebirdUpdater();

  final List<Widget> _screens = [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  // @override
  // void initState() {
  //   super.initState();
  //   // Show development mode alert after the first frame is built
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     _startCheckingForUpdates();
  //   });
  // }

  // Timer? _timer;
  // _startCheckingForUpdates() {
  //   _timer = Timer.periodic(Duration(seconds: 3), (_) => _checkForUpdates());
  // }

  // void _checkForUpdates() async {
  //   final status = await shoreBirdUpdater.checkForUpdate();
  //   if (status == UpdateStatus.outdated) {
  //     _timer?.cancel();
  //     shoreBirdUpdater.update();
  //     if (!mounted) return;
  //     _showBanner();
  //   }

  //   log('_shorebird');
  // }

  // @override
  // void dispose() {
  //   _timer?.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      // persistentFooterButtons: [],/
      bottomNavigationBar: Material(
        elevation: 8,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(BottomNavIconConstant.home),
              activeIcon: SvgPicture.asset(BottomNavIconConstant.homeBold),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(BottomNavIconConstant.category),
              activeIcon: SvgPicture.asset(
                BottomNavIconConstant.categoryBold,
              ),
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

  void _showBanner() {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: Text('A new Update is Available! Restart'),
        actions: [
          TextButton(
            onPressed: () async {
              exit(0);
            },
            child: Text('Exit App'),
          ),
        ],
      ),
    );
  }
}
