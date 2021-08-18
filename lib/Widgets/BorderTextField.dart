import 'package:flutter/material.dart';

/// A custom textfield with Border on it.

class BorderTextField extends StatelessWidget {
  final bool? isinputnumber;
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

  const BorderTextField(
      {Key? key,
      this.labeltext,
      required this.controller,
      this.isborder = true,
      this.isinputnumber, this.bordercolor, this.hinttext, this.fillcolor, this.autofocus=false, this.radius=8.0, this.minLines=1, this.borderWidth=0.2, this.textStyle, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
        var brightness = MediaQuery.of(context).platformBrightness;
            bool darkModeOn = brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: TextField(
        onChanged: onChanged,
        style: textStyle ==null ? TextStyle(fontSize: 14) :textStyle,
        autofocus: autofocus,
       minLines: minLines,
        maxLines: 10,
        keyboardType:
            isinputnumber == null ? TextInputType.text : TextInputType.number,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: fillcolor==null ? Colors.white : fillcolor,
          enabledBorder: OutlineInputBorder(
            borderSide: isborder == true
                ? BorderSide(color: bordercolor ==null ? Colors.black54 : bordercolor!, width: borderWidth)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(radius),
          ),
          border: OutlineInputBorder(
            borderSide: new BorderSide(width: borderWidth),
            borderRadius: BorderRadius.circular(8),
          ),
          labelText: labeltext,
          hintText: hinttext,
        ),
      ),
    );
  }
}
