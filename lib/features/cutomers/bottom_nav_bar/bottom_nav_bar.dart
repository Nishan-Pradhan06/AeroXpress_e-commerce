import 'dart:async';
import 'dart:io';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:shorebird_code_push/shorebird_code_push.dart';
import 'package:upgrader/upgrader.dart';
import 'package:deal_sell/core/constant/bottom_nav_icon_constant.dart';
import '../../../core/helpers/url_launcher_helper.dart';
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
    return UpgradeAlert(
      // Prevent the dialog from being dismissed by tapping outside
      barrierDismissible: false,

      // Prevent back button from closing dialog
      shouldPopScope: () => false,

      // Show release notes if available
      showReleaseNotes: true,

      // Show Ignore button (you may disable in production)
      showIgnore: true,

      // Show Later button (you may disable in production)
      showLater: true,

      // Set dialog type based on platform
      dialogStyle:
          Platform.isAndroid
              ? UpgradeDialogStyle.material
              : UpgradeDialogStyle.cupertino,

      // Optional: Customize iOS button style
      // cupertinoButtonTextStyle: const TextStyle(color: Colors.blue),

      // Control how often the alert appears again after "Later"
      upgrader: Upgrader(
        // Useful for debug: show frequently
        debugDisplayAlways: true,
        debugLogging: true,

        // Duration before it prompts again after "Later"
        durationUntilAlertAgain: const Duration(seconds: 10),

        // Optional: specify minimum app version to enforce
        // minAppVersion: '2.0.0',

        // Optional: show different language (e.g., 'en', 'ne')
        // languageCode: 'en',

        // Optional: set a custom controller for platform-specific behavior
        // storeController: CustomUpgraderStoreController(),

        // Optional: override device or OS platform
        // upgraderDevice: UpgraderDevice.android,
        // upgraderOS: UpgraderOS.android,

        // Called before displaying the dialog. Return false to block.
        willDisplayUpgrade: ({
          required bool display,
          String? installedVersion,
          UpgraderVersionInfo? versionInfo,
        }) {
          if (display) {
            log(
              'Upgrade available: Installed=$installedVersion → Store=${versionInfo?.appStoreVersion}',
            );
          } else {
            log('No upgrade shown. Installed version: $installedVersion');
          }
        },
      ),

      // Called when user presses "Update"
      onUpdate: () {
        urlLauncherWithFallback(context, playStoreUrl); // Your Play Store URL
        return true;
      },

      // Called when user presses "Later"
      onLater: () {
        log('User pressed later button');
        return true;
      },

      // Called when user presses "Ignore"
      onIgnore: () {
        log('User pressed ignore button');
        return true;
      },

      child: Scaffold(
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
