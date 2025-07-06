import 'dart:async';
import 'dart:io';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';
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
  final shoreBirdUpdater = ShorebirdUpdater();

  final List<Widget> _screens = [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    // Show development mode alert after the first frame is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showDevModeAlert();
      _startCheckingForUpdates();
    });
  }

  Timer? _timer;
  _startCheckingForUpdates() {
    _timer = Timer.periodic(Duration(seconds: 3), (_) => _checkForUpdates());
  }

  void _checkForUpdates() async {
    final status = await shoreBirdUpdater.checkForUpdate();
    if (status == UpdateStatus.outdated) {
      _timer?.cancel();
      shoreBirdUpdater.update();
      if (!mounted) return;
      _showBanner();
    }

    log('_shorebird');
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _showDevModeAlert() async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => const DevModeAlert(),
    );

    // Handle the result
    if (result == false) {
      // User selected "Don't show again"
      // You can store this preference in SharedPreferences
      print('User chose not to show alert again');
    }
  }

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
        // persistentFooterButtons: [],
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

class DevModeAlert extends StatefulWidget {
  const DevModeAlert({super.key});

  @override
  State<DevModeAlert> createState() => _DevModeAlertState();
}

class _DevModeAlertState extends State<DevModeAlert>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: Dialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Stack(
                  children: [
                    // Background with gradient
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.orange.shade50, Colors.amber.shade50],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                        border: Border.all(
                          color: Colors.orange.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Icon with animation
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.orange.shade100,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.orange.withOpacity(0.3),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.construction_rounded,
                              size: 40,
                              color: Colors.orange.shade700,
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Title
                          Text(
                            'Development Mode',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade800,
                            ),
                          ),

                          const SizedBox(height: 12),

                          // Message
                          Text(
                            'This app is currently in development mode. Some features may not work as expected or might be temporarily unavailable. We\'re working with Play Console testers to ensure everything works perfectly before the official release.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade600,
                              height: 1.5,
                            ),
                          ),

                          const SizedBox(height: 8),

                          // Additional info
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.orange.shade100.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.orange.shade200,
                                width: 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.info_outline,
                                  size: 20,
                                  color: Colors.orange.shade700,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    'We\'re working hard to improve your experience! Thank you for your patience during this testing period.',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.orange.shade800,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 12),

                          // Testing info
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade50.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.blue.shade200,
                                width: 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.schedule,
                                  size: 20,
                                  color: Colors.blue.shade700,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    'Testing phase: Day 2 of 12. Your experience helps us make this app amazing!',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.blue.shade800,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 24),

                          // Buttons
                          Row(
                            children: [
                              Expanded(
                                child: TextButton(
                                  onPressed:
                                      () => Navigator.of(context).pop(false),
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Text(
                                    'Don\'t show again',
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed:
                                      () => Navigator.of(context).pop(true),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange.shade600,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    elevation: 2,
                                  ),
                                  child: const Text(
                                    'Continue',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
