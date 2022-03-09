import 'package:flutter/material.dart';

class GlassButton extends StatelessWidget {
  final Widget? child;
  final double? radius;
  final Color? color;
  final double borderWidth;

  const GlassButton({Key? key, this.child, this.radius, this.color, this.borderWidth=1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Padding(
      padding: const EdgeInsets.only(top: 8,bottom: 8,right: 12,left: 12),
      child:   child==null ? Container() : child!,
    ),decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius==null ? 10 : radius!),border: Border.all(width: borderWidth, color: color ?? Colors.grey)),);

  }
}
