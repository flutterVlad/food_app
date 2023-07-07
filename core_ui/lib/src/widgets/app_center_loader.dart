import 'package:flutter/material.dart';

class AppCenterLoader extends StatelessWidget {
  const AppCenterLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).secondaryHeaderColor,
      ),
    );
  }
}
