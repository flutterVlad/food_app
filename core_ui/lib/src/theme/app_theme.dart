import 'package:flutter/material.dart';
import 'package:core_ui/src/colors/app_colors.dart';

class AppTheme {
  static ThemeData getThemeData() {
    return ThemeData(
      brightness: Brightness.dark,
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 30,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppDarkThemeColors.primaryColor,
        showUnselectedLabels: false,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey[50],
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppDarkThemeColors.primaryColor,
      ),
      fontFamily: 'Dosis',
      useMaterial3: true,
    );
  }
}
