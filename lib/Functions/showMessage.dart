import 'package:flutter/material.dart';

/// Simplify ScaffoldMessage.of(context).showSnackBar()
void showMessage(BuildContext context, String message,
    [Function()? onReturn, String buttonName = 'close']) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    // backgroundColor: Colors.cyan,
    content: Text(
      '$message',
      // style: TextStyle(color: Colors.white),
    ),
    action: onReturn != null
        ? SnackBarAction(
            label: buttonName,
            onPressed: onReturn,
          )
        : null,
  ));
}
