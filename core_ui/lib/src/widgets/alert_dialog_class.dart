import 'package:flutter/material.dart';

class AppAlertDialog {
  static Future<void> showAlertDialog({
    required BuildContext context,
    required String title,
    String? content,
    required void Function() onTap,
  }) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        final ThemeData themeData = Theme.of(context);

        return AlertDialog(
          backgroundColor: themeData.primaryColor.withOpacity(1),
          title: Text(
            title,
            style: themeData.textTheme.titleMedium,
          ),
          content: content != null
              ? Text(
                  content,
                  style: themeData.textTheme.titleMedium,
                )
              : null,
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: themeData.textTheme.titleMedium!.fontSize,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                onTap();
                Navigator.of(context).pop();
              },
              child: Text(
                'Approve',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: themeData.textTheme.titleMedium!.fontSize,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
