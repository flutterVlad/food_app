import 'package:flutter/material.dart';

class AppSizes {
  static const Map<String, TextTheme> textTheme = {
    'little': TextTheme(
      titleLarge: TextStyle(
        fontSize: 25,
      ),
      titleMedium: TextStyle(
        fontSize: 17,
      ),
      titleSmall: TextStyle(
        fontSize: 12,
      ),
    ),
    'medium': TextTheme(
      titleLarge: TextStyle(
        fontSize: 30,
      ),
      titleMedium: TextStyle(
        fontSize: 22,
      ),
      titleSmall: TextStyle(
        fontSize: 17,
      ),
    ),
    'large': TextTheme(
      titleLarge: TextStyle(
        fontSize: 35,
      ),
      titleMedium: TextStyle(
        fontSize: 27,
      ),
      titleSmall: TextStyle(
        fontSize: 18,
      ),
    ),
  };
}
