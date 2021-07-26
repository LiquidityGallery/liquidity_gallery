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

  const BorderTextField(
      {Key? key,
      this.labeltext,
      required this.controller,
      this.isborder = true,
      this.isinputnumber, this.bordercolor, this.hinttext, this.fillcolor, this.autofocus=false, this.radius=8.0, this.minLines=1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
        var brightness = MediaQuery.of(context).platformBrightness;
            bool darkModeOn = brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: TextField(
        autofocus: autofocus,
       minLines: minLines,
        maxLines: 10,
        keyboardType:
            isinputnumber == null ? TextInputType.text : TextInputType.number,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: fillcolor==null ? (darkModeOn ? Colors.grey[800] : Colors.white) : fillcolor,
          enabledBorder: OutlineInputBorder(
            borderSide: isborder == true
                ? BorderSide(color: bordercolor ==null ? Colors.black54 : bordercolor!, width: 0.2)
                : BorderSide.none,
            //borderRadius: BorderRadius.circular(8.0),
          ),
          border: OutlineInputBorder(
            borderSide: new BorderSide(width: 1.0),
            borderRadius: BorderRadius.circular(radius),
          ),
          labelText: labeltext,
          hintText: hinttext,
        ),
      ),
    );
  }
}
