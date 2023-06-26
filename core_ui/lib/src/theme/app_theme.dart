import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getThemeData() {
    return ThemeData(
      brightness: Brightness.dark,
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 30,
        ),
      ),
      primarySwatch: Colors.orange,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.black54,
        showUnselectedLabels: false,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey[50],
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black54,
      ),
      fontFamily: 'Dosis',
      useMaterial3: true,
    );
  }
}
