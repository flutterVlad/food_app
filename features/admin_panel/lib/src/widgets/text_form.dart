import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  final TextEditingController textEditingController;
  final String? content;

  const TextForm({
    super.key,
    required this.textEditingController,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      children: <Widget>[
        Text(
          content ?? '',
          style: theme.textTheme.titleMedium,
        ),
        TextField(
          controller: textEditingController,
          style: theme.textTheme.titleMedium,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: theme.primaryColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: theme.secondaryHeaderColor),
            ),
            fillColor: theme.primaryColor,
            filled: true,
          ),
        ),
      ],
    );
  }
}
