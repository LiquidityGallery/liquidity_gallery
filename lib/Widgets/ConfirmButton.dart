import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class ConfirmButton extends StatefulWidget {
  final String text;
  final Color? color;
  final double radius;
  final double minWidth;
  final double height;
  final Function() onPressed;
  final Color? textcolor;
  final bool? isbold;
  final double elevation;
  final double padding;
  final double fontSize;
  final Icon? icon;

  /// Version1.01 last update 20200610.
  ///
  /// A custom button with pre-build rounded colorful shape on it.
  const ConfirmButton({
    super.key,
    required this.text,
    this.color,
    this.radius = 12,
    required this.onPressed,
    this.minWidth = 270,
    this.height = 47,
    this.textcolor,
    this.isbold,
    this.elevation = 1,
    this.padding = 15.0,
    this.fontSize = 15,
    this.icon,
  });

  @override
  _ConfirmButtonState createState() => _ConfirmButtonState();
}

class _ConfirmButtonState extends State<ConfirmButton> {
  bool _isLoading = false;

  Future<void> init() async {
    try {
      await widget.onPressed();
    } catch (e) {
      Flushbar(
        margin: const EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
        message: '$e',
        duration: const Duration(
          seconds: 3,
        ),
        animationDuration: const Duration(seconds: 1),
        forwardAnimationCurve: Curves.easeIn,
        reverseAnimationCurve: Curves.easeOut,
      ).show(context);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(widget.padding),
      child: ButtonTheme(
        minWidth: widget.minWidth,
        height: widget.height,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: widget.color ?? Colors.cyan,
                elevation: widget.elevation,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(widget.radius),
                    side: BorderSide.none)),
            onPressed: () async {
              if (_isLoading) {
                return;
              } else {
                setState(() {
                  _isLoading = true;
                });
                await init();
              }
            },
            child: _isLoading
                ? const CircularProgressIndicator.adaptive()
                : ((widget.text == '' && widget.icon != null)
                    ? widget.icon
                    : Text(
                        widget.text,
                        style: TextStyle(
                            fontSize: widget.fontSize,
                            color: widget.textcolor ?? Colors.white,
                            fontWeight: widget.isbold == true
                                ? FontWeight.bold
                                : FontWeight.normal),
                      ))),
      ),
    );
  }
}
