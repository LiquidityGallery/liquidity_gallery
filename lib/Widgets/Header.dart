import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  ///You need something like a Big title for web/ app page?
  ///
  /// Here is a easier version you have it. much better than a text widget.
  ///
  /// You can also use a Texter() Widget if you need to put some paragraph text in it :)
  const Header(
      {super.key,
      required this.text,
      this.left = 0,
      this.top = 30,
      this.bottom = 20,
      this.fontSize = 30,
      this.color});

  final String text;
  final double left;
  final double top;
  final double bottom;
  final double fontSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: left, top: top, bottom: bottom),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
            color: color ?? Colors.black),
      ),
    );
  }
}
