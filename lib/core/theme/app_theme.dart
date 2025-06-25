import 'package:flutter/material.dart';
import 'app_colors.dart';

final ThemeData appThemeData = ThemeData(
  useMaterial3: true,
  fontFamily: 'Poppins',
  primaryColor: brandPrimaryColor,
  // scaffoldBackgroundColor: backgroundLight,
  hintColor: textMutedColor,
  colorScheme: ColorScheme.fromSeed(
    seedColor: brandPrimaryColor,
    primary: brandPrimaryColor,
    secondary: brandSecondaryColor,
    error: statusErrorColor,
    // background: backgroundLight,
    surface: neutralWhiteColor,
    onPrimary: neutralWhiteColor,
    onSecondary: Colors.black,
    onSurface: textPrimaryColor,
    onError: neutralWhiteColor,
  ),

  // appBarTheme: AppBarTheme(
  //   elevation: 0,
  //   centerTitle: true,
  //   backgroundColor: brandPrimaryColor,
  //   // iconTheme: const IconThemeData(color: Colors.white),
  //   titleTextStyle: const TextStyle(
  //     fontFamily: 'Poppins',
  //     fontSize: 20,
  //     fontWeight: FontWeight.w600,
  //     // color: Colors.white,
  //   ),
  //   systemOverlayStyle: const SystemUiOverlayStyle(
  //     statusBarColor: Colors.transparent,
  //     statusBarIconBrightness: Brightness.dark,
  //     systemNavigationBarColor: Colors.transparent,
  //     systemNavigationBarIconBrightness: Brightness.dark,
  //   ),
  // ),
  textTheme: TextTheme(
    displayLarge: const TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: textPrimaryColor,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: textPrimaryColor,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: textSecondaryColor,
    ),
    bodyLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: textPrimaryColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: textSecondaryColor,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: textMutedColor,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: brandPrimaryColor,
    ),
  ),

  iconTheme: IconThemeData(color: textPrimaryColor, size: 24),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: neutralWhiteColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: textMutedColor.withOpacity(0.3)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: textMutedColor.withOpacity(0.2)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: brandPrimaryColor),
    ),
    hintStyle: TextStyle(color: textMutedColor),
    contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: neutralWhiteColor,
      backgroundColor: brandPrimaryColor,
      textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
    ),
  ),
);

/// Design tokens for our component library
class AppTheme {
  // Colors
  static const Color primary = Color.fromRGBO(30, 136, 229, 1);
  static const Color primaryForeground = Colors.white;

  static const Color secondary = Color(0xFFFFA701);
  static const Color secondaryForeground = Colors.white;

  static const Color destructive = Color(0xFFEF4444);
  static const Color destructiveForeground = Colors.white;

  static const Color muted = Color(0xFFF3F4F6);
  static const Color mutedForeground = Color(0xFF6B7280);

  static const Color accent = Color.fromARGB(255, 173, 205, 236);
  static const Color accentForeground = Color(0xFF111827);

  static const Color card = Colors.white;
  static const Color cardForeground = Color(0xFF111827);

  static const Color border = Color(0xFFE5E7EB);
  static const Color input = Color(0xFFE5E7EB);

  static const Color background = Colors.white;
  static const Color foreground = Color(0xFF111827);

  // Radius
  static const double radiusSm = 4.0;
  static const double radius = 8.0;
  static const double radiusLg = 12.0;

  // Font sizes
  static const double fontSizeXs = 12.0;
  static const double fontSizeSm = 14.0;
  static const double fontSize = 16.0;
  static const double fontSizeLg = 18.0;
  static const double fontSizeXl = 20.0;
  static const double fontSize2xl = 24.0;
  static const double fontSize3xl = 30.0;
  static const double fontSize4xl = 36.0;

  // Spacing
  static const double space1 = 4.0;
  static const double space2 = 8.0;
  static const double space3 = 12.0;
  static const double space4 = 16.0;
  static const double space5 = 20.0;
  static const double space6 = 24.0;
  static const double space8 = 32.0;
  static const double space10 = 40.0;
  static const double space12 = 48.0;
  static const double space16 = 64.0;

  // Animation
  static const Duration durationFast = Duration(milliseconds: 150);
  static const Duration durationNormal = Duration(milliseconds: 250);
  static const Duration durationSlow = Duration(milliseconds: 350);

  // Shadows
  static List<BoxShadow> shadowSm = [
    BoxShadow(
      color: Colors.black.withOpacity(0.05),
      blurRadius: 2,
      offset: const Offset(0, 1),
    ),
  ];

  static List<BoxShadow> shadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 3,
      offset: const Offset(0, 1),
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.06),
      blurRadius: 2,
      offset: const Offset(0, 1),
    ),
  ];

  static List<BoxShadow> shadowMd = [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.06),
      blurRadius: 2,
      offset: const Offset(0, 1),
    ),
  ];

  static List<BoxShadow> shadowLg = [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 8,
      offset: const Offset(0, 4),
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.06),
      blurRadius: 3,
      offset: const Offset(0, 2),
    ),
  ];
}
