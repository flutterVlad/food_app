import 'package:flutter/material.dart';

class IngredientCard extends StatelessWidget {
  final String title;
  final Function() onTap;

  const IngredientCard({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall,
      ),
      trailing: IconButton(
        onPressed: onTap,
        icon: Icon(
          Icons.delete,
          color: Theme.of(context).secondaryHeaderColor,
        ),
      ),
    );
  }
}
