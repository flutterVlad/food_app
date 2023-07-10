import 'package:flutter/material.dart';
import 'package:core_ui/src/colors/app_colors.dart';

class AppTheme {
  static ThemeData getDarkThemeData() {
    return ThemeData(
      brightness: Brightness.dark,
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 30,
        ),
        titleMedium: TextStyle(
          fontSize: 25,
        ),
        titleSmall: TextStyle(
          fontSize: 15,
        ),
      ),
      scaffoldBackgroundColor: AppDarkThemeColors.backgroundColor,
      secondaryHeaderColor: AppDarkThemeColors.secondaryColor,
      primaryColor: AppDarkThemeColors.primaryColor,
      switchTheme: const SwitchThemeData(
        thumbIcon: MaterialStatePropertyAll<Icon>(Icon(Icons.nightlight)),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppDarkThemeColors.primaryColor,
        showUnselectedLabels: false,
        selectedItemColor: AppDarkThemeColors.selectedItem,
        unselectedItemColor: AppDarkThemeColors.unSelectedItem,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppDarkThemeColors.primaryColor,
        titleTextStyle: TextStyle(
          fontSize: 30,
          color: Colors.white,
          fontFamily: 'Dosis',
        ),
      ),
      fontFamily: 'Dosis',
      useMaterial3: true,
    );
  }

  static ThemeData getLightThemeData() {
    return ThemeData(
      brightness: Brightness.light,
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: Colors.black,
          fontSize: 30,
        ),
        titleMedium: TextStyle(
          fontSize: 25,
        ),
        titleSmall: TextStyle(
          fontSize: 15,
        ),
      ),
      scaffoldBackgroundColor: AppLightThemeColors.backgroundColor,
      secondaryHeaderColor: AppLightThemeColors.secondaryColor,
      primaryColor: AppLightThemeColors.primaryColor,
      switchTheme: const SwitchThemeData(
        thumbIcon: MaterialStatePropertyAll<Icon>(Icon(Icons.sunny)),
        trackColor:
            MaterialStatePropertyAll<Color>(AppLightThemeColors.secondaryColor),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppLightThemeColors.primaryColor,
        showUnselectedLabels: false,
        selectedItemColor: AppLightThemeColors.selectedItem,
        unselectedItemColor: AppLightThemeColors.unSelectedItem,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppLightThemeColors.primaryColor,
        titleTextStyle: TextStyle(
          fontSize: 30,
          color: Colors.black,
          fontFamily: 'Dosis',
        ),
      ),
      fontFamily: 'Dosis',
      useMaterial3: true,
    );
  }
}
