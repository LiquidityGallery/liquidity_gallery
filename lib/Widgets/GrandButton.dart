import 'package:flutter/material.dart';

class GrandButton extends StatelessWidget {
  final Widget? child;
  final double? radius;
  final Color? backgroundColor;
  final Function() onPressed;

  const GrandButton(
      {Key? key,
      this.child,
      this.radius = 5.0,
      this.backgroundColor,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius!),
            //side: BorderSide(color: Colors.red)
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
            backgroundColor ?? Colors.white),
      ),
      child: child,
    );
  }
}
