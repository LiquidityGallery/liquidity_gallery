import 'package:flutter/material.dart';

class BorderTextField extends StatelessWidget {
  final bool? isinputnumber;
  final String? labeltext;
  final TextEditingController controller;
  final bool isborder;
  final Color? bordercolor;
  final String? hinttext;
  final Color? fillcolor;

  const BorderTextField(
      {Key? key,
      this.labeltext,
      required this.controller,
      this.isborder = true,
      this.isinputnumber, this.bordercolor, this.hinttext, this.fillcolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: TextField(
        keyboardType:
            isinputnumber == null ? TextInputType.text : TextInputType.number,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: fillcolor==null ? Colors.white : fillcolor,
          enabledBorder: OutlineInputBorder(
            borderSide: isborder == true
                ? BorderSide(color: bordercolor ==null ? Colors.black54 : bordercolor!, width: 0.2)
                : BorderSide.none,
            //borderRadius: BorderRadius.circular(8.0),
          ),
          border: OutlineInputBorder(
            borderSide: new BorderSide(width: 1.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          labelText: labeltext,
          hintText: hinttext,
        ),
      ),
    );
  }
}
