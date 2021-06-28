import 'package:flutter/material.dart';

class ConfirmButton extends StatelessWidget {

  final String text;
  final Color? color;
  final double radius;
  final double minWidth;
  final double height;
  final void Function() onPressed;
  final Color? textcolor;
  final bool? isbold;
  final double elevation;
  final double? padding;

  /// Version1.01 last update 20200610.
  ///
  /// A custom button with pre-build rounded colorful shape on it.
  const ConfirmButton(
      {Key? key,
     required this.text,
      this.color,
      this.radius = 12,
      required this.onPressed,
      this.minWidth = 270,
      this.height = 47, this.textcolor, this.isbold, this.elevation=1, this.padding=15.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: ButtonTheme(
        minWidth: minWidth,
        height: height,
        child: RaisedButton(
          elevation: elevation,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
              side: BorderSide.none),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(fontSize: 15, color: textcolor== null ? Colors.white : textcolor,fontWeight: isbold==true ? FontWeight.bold : FontWeight.normal),
          ),
          color: color == null ? Colors.cyan : color,
        ),
      ),
    );
  }
}
