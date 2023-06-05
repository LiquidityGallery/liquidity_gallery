import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  const TextDivider({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Text(text),
        const Expanded(child: Divider())
      ],
    );
  }
}
