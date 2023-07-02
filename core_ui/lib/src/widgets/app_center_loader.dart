import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppCenterLoader extends StatelessWidget {
  const AppCenterLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppDarkThemeColors.secondaryColor,
      ),
    );
  }
}

