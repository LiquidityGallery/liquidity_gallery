import 'package:flutter/material.dart';

class Texter extends StatelessWidget {
  final String? text;
  final double? left;
  final double? top;
  final double? bottom;
  final double? right;
  final double? fontSize;
  final bool isbold;
  final Color? color;


  /// You need some text looks like in a website paragraph?
  ///
  /// Here your have one. Replace for a text widget. Easy to use!
  const Texter(
      {Key? key,
    required  this.text,
      this.left=0,
      this.top = 0,
      this.bottom = 0,
      this.fontSize = 20,
      this.right = 0,
      this.isbold = false, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: left!, top: top!, bottom: bottom!, right: right!),
      child: Text(
        text!,
        style: TextStyle(
            fontWeight: isbold == false ? FontWeight.normal : FontWeight.bold,
            fontSize: fontSize, color: color ==null ? Colors.black : color),
      ),
    );
  }
}
