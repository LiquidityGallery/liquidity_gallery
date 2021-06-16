import 'package:flutter/material.dart';

/// Simplify ScaffoldMessage.of(context).showSnackBar()
void showMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.cyan,content: Text('$message',style: TextStyle(color: Colors.white),)));
}