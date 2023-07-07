import 'package:flutter/material.dart';

abstract class AppDarkThemeColors {
  static const Color primaryColor = Colors.black54;
  static const Color secondaryColor = Colors.orange;
  static const Color neutralColor = Colors.grey;
  static const Color backgroundColor = Color.fromRGBO(150, 150, 150, 0.3);
  static const Color selectedItem = Colors.orange;
  static const Color unSelectedItem = Colors.grey;
  static const LinearGradient gradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      Color.fromRGBO(252, 200, 3, 1),
      Color.fromRGBO(252, 150, 3, 1),
      Color.fromRGBO(252, 100, 3, 1),
    ],
  );
}

abstract class AppLightThemeColors {
  static const Color primaryColor = Color.fromRGBO(210, 210, 210, 0.7);
  static const Color secondaryColor = Colors.blueAccent;
  static const Color neutralColor = Colors.grey;
  static const Color backgroundColor = Color.fromRGBO(250, 250, 250, 1);
  static const Color selectedItem = Colors.blueAccent;
  static const Color unSelectedItem = Color.fromRGBO(100, 100, 100, 1);
  static const LinearGradient gradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      Color.fromRGBO(3, 200, 252, 1),
      Color.fromRGBO(3, 150, 252, 1),
      Color.fromRGBO(3, 100, 252, 1),
    ],
  );
}
