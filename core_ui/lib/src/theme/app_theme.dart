import 'package:flutter/material.dart';
import 'package:core_ui/src/colors/app_colors.dart';
import 'package:core_ui/src/size_presets/app_sizes.dart';

class AppTheme {
  static const String cartAnimationLightTheme =
      'core_ui/assets/lottie_animations/cart_light_animation.json';
  static const String cartAnimationDarkTheme =
      'core_ui/assets/lottie_animations/cart_dark_animation.json';
  static const String orderAnimationLightTheme =
      'core_ui/assets/lottie_animations/order_history_light_animation.json';
  static const String orderAnimationDarkTheme =
      'core_ui/assets/lottie_animations/order_history_dark_animation.json';

  static ThemeData getDarkThemeData(String sizeData) {
    return ThemeData(
      brightness: Brightness.dark,
      textTheme: AppSizes.textTheme[sizeData],
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

  static ThemeData getLightThemeData(String sizeData) {
    return ThemeData(
      brightness: Brightness.light,
      textTheme: AppSizes.textTheme[sizeData],
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
