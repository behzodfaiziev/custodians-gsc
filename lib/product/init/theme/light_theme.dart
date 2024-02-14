import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData theme = ThemeData(
    appBarTheme: const AppBarTheme(
      toolbarHeight: 60,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    primarySwatch: Colors.green,
    iconTheme: const IconThemeData(
      color: AppColors.white,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
    ),
  );
}

class AppColors {
  static const Color primaryColor = Colors.green;
  static const Color white = Colors.white;
}
