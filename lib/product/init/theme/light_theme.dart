import 'package:flutter/material.dart';

class LightTheme {
  ThemeData get theme => ThemeData(
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
        pageTransitionsTheme: _pageTransitionsTheme,
      );

  PageTransitionsTheme get _pageTransitionsTheme =>
      const PageTransitionsTheme(builders: {
        TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      });
}

class AppColors {
  static const Color primaryColor = Colors.green;
  static const Color white = Colors.white;
}
