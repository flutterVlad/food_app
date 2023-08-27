import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

class FlushBar {
  static Future<void> showFlushBar({
    required BuildContext context,
    required String message,
    required Color textColor,
    required LinearGradient gradient,
    required IconData icon,
  }) async {
    return Flushbar(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      flushbarPosition: FlushbarPosition.TOP,
      icon: Icon(
        icon,
        color: textColor,
      ),
      message: message,
      duration: const Duration(seconds: 3),
      backgroundGradient: gradient,
      borderRadius: BorderRadius.circular(15),
      messageColor: textColor,
      messageSize: Theme.of(context).textTheme.titleMedium!.fontSize,
    ).show(context);
  }
}
