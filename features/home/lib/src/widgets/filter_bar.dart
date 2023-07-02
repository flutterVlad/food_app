import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const Text(
          'Popular Items',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'View all',
            style: TextStyle(
              color: AppDarkThemeColors.secondaryColor,
              fontSize: 18,
            ),
          ),
        )
      ],
    );
  }
}