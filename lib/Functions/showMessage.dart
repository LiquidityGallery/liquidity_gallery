import 'package:flutter/material.dart';

/// Simplify ScaffoldMessage.of(context).showSnackBar()
void showMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$message')));
}