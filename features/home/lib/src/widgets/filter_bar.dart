import 'package:flutter/material.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Popular Items',
          style: TextStyle(
            fontSize: theme.textTheme.titleLarge!.fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'View all',
            style: TextStyle(
              color: Theme.of(context).secondaryHeaderColor,
              fontSize: theme.textTheme.titleMedium!.fontSize,
            ),
          ),
        )
      ],
    );
  }
}
