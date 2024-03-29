import 'package:flutter/material.dart';

/// A custom textfield with Border on it.

class BorderTextField extends StatelessWidget {
  final GestureTapCallback? onTap;

  final TextInputType textInputType;
  final String? labeltext;
  final TextEditingController controller;
  final bool isborder;
  final Color? bordercolor;
  final String? hinttext;
  final Color? fillcolor;
  final bool autofocus;
  final double radius;
  final int minLines;
  final double borderWidth;
  final TextStyle? textStyle;
  final Function(String input)? onChanged;
  final bool readOnly;
  final bool obscureText;
  final int maxLines;
  final TextAlign textAlign;
  final Function(String input)? onSubmitted;

  const BorderTextField(
      {super.key,
      this.onTap,
      this.textInputType = TextInputType.text,
      this.labeltext,
      required this.controller,
      this.isborder = true,
      this.bordercolor,
      this.hinttext,
      this.fillcolor,
      this.autofocus = false,
      this.radius = 8.0,
      this.minLines = 1,
      this.borderWidth = 0.2,
      this.textStyle,
      this.onChanged,
this.onSubmitted,
      this.textAlign = TextAlign.start,
      this.readOnly = false,
      this.obscureText = false,
      this.maxLines = 10});

  @override
  Widget build(BuildContext context) {
    // var brightness = MediaQuery.of(context).platformBrightness;
    // bool darkModeOn = brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: TextField(
        textAlign: textAlign,
        obscureText: obscureText,
        onTap: onTap,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        style: textStyle ?? const TextStyle(fontSize: 14),
        autofocus: autofocus,
        readOnly: readOnly,
        minLines: minLines,
        maxLines: maxLines == 0 ? null : maxLines,
        keyboardType: textInputType,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: fillcolor ?? Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: isborder == true
                ? BorderSide(
                    color: bordercolor == null ? Colors.black54 : bordercolor!,
                    width: borderWidth)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(radius),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: borderWidth),
            borderRadius: BorderRadius.circular(8),
          ),
          labelText: labeltext,
          hintText: hinttext,
        ),
      ),
    );
  }
}
