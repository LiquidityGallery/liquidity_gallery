import 'package:flutter/material.dart';

class ConfirmButton extends StatelessWidget {

  final String? text;
  final Color? color;
  final double radius;
  final double minWidth;
  final double height;
  final void Function() onPressed;
  final Color? textcolor;
  final bool? isbold;

  /// Version1.01 last update 20200610.
  ///
  /// A custom button with pre-build rounded colorful shape on it.
  const ConfirmButton(
      {Key? key,
      this.text,
      this.color,
      this.radius = 12,
      required this.onPressed,
      this.minWidth = 270,
      this.height = 47, this.textcolor, this.isbold})
      : super(key: key);

  const ConfirmButton.delete(
      {Key? key,
        String? subText,
        this.color,
        this.radius = 12,
        required this.onPressed,
        this.minWidth = 270,
        this.height = 47, this.textcolor, this.isbold})
      : text = subText, super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ButtonTheme(
        minWidth: minWidth,
        height: height,
        child: RaisedButton(
          elevation: 1,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
              side: BorderSide.none),
          onPressed: onPressed,
          child: Text(
            text!,
            style: TextStyle(fontSize: 15, color: textcolor== null ? Colors.white : textcolor,fontWeight: isbold==true ? FontWeight.bold : FontWeight.normal),
          ),
          color: color == null ? Colors.cyan : color,
        ),
      ),
    );
  }
}
