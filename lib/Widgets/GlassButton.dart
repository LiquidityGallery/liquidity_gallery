import 'package:flutter/material.dart';

class GlassButton extends StatelessWidget {
  final Function() onTap;
  final Widget child;
  final double? radius;
  final Color? color;
  final double borderWidth;

  const GlassButton(
      {Key? key,
      required this.child,
      this.radius,
      this.color,
      this.borderWidth = 1,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(radius == null ? 10 : radius!),
              border:
                  Border.all(width: borderWidth, color: color ?? Colors.grey)),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 8, bottom: 8, right: 12, left: 12),
            child: child,
          ),
        ));
  }
}
