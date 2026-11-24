import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:we_ship_faas/app/core/theme/base_theme.dart';

class LightTheme extends BaseTheme {
  @override
  BottomNavigationBarThemeData get bottomNavigationBarThemeData =>
      BottomNavigationBarThemeData(
        selectedIconTheme: const IconThemeData(
          color: Color(0xFF1599D0),
        ),
        unselectedIconTheme: const IconThemeData(
          color: Color(0xFF2B405B),
        ),
        selectedItemColor: const Color(0xFF1599D0),
        unselectedItemColor: const Color(0xFF2B405B),
        selectedLabelStyle: TextStyle(
          color: const Color(0xFF1599D0),
          fontSize: 8.sp,
          fontWeight: FontWeight.w600,
        ),
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        unselectedLabelStyle: TextStyle(
          color: const Color(0xFF2B405B),
          fontSize: 8.sp,
          fontWeight: FontWeight.w400,
        ),
      );

  @override
  FloatingActionButtonThemeData? get floatingActionButtonTheme =>
      ThemeData.light().floatingActionButtonTheme;

  @override
  InputDecorationTheme? get inputDecorationTheme => InputDecorationTheme(
        iconColor: Colors.grey,
        suffixIconColor: Colors.grey,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFE2E2E2),
            width: 1.0, // Border width
          ),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFE2E2E2),
            width: 2.0, // Border width
          ),
        ),

        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF1599D0),
            width: 1.0,
          ),
        ),
        // Define the error border
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red, // Border color when in error state
            width: 1.0, // Border width when in error state
          ),
        ),
        // Define the disabled border
        disabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFE2E2E2), // Border color when disabled
            width: 1.0, // Border width when disabled
          ),
        ),

        hintStyle: TextStyle(
          color: const Color(0x337C7C7C),
          fontSize: 16,
          fontFamily: fontTheme.fontFamily,
          fontWeight: FontWeight.w400,
          height: 0.11,
        ),
      );

  @override
  FontTheme get fontTheme => FontTheme(
        fontFamily: 'Poppins',
      );

  @override
  Color get scaffoldBackgroundColor => Colors.white;

  @override
  MaterialColor get primarySwatch => const MaterialColor(0xFF1599D0, {
        50: Color(0xFFE6F5FA),
        100: Color(0xFFC9E7F1),
        200: Color(0xFFA3D8EA),
        300: Color(0xFF79C9E7),
        400: Color(0xFF44B2DB),
        500: Color(0xFF1599D0),
        600: Color(0xFF1186B7),
        700: Color(0xFF0D729C),
        800: Color(0xFF095D80),
        900: Color(0xFF06475F),
      });

  /// dark theme swatch
  //  darkTheme: ThemeData(
  //   primarySwatch: MaterialColor(0xFF1599D0, {
  //     50: Color(0xFF1599D0).withOpacity(0.1),
  //     100: Color(0xFF1599D0).withOpacity(0.2),
  //     200: Color(0xFF1599D0).withOpacity(0.3),
  //     300: Color(0xFF1599D0).withOpacity(0.4),
  //     400: Color(0xFF1599D0).withOpacity(0.5),
  //     500: Color(0xFF1599D0), // Primary color for dark theme
  //     600: Color(0xFF1599D0).withOpacity(0.6),
  //     700: Color(0xFF1599D0).withOpacity(0.7),
  //     800: Color(0xFF1599D0).withOpacity(0.8),
  //     900: Color(0xFF1599D0).withOpacity(0.9),
  //   }),
  // ),
}
