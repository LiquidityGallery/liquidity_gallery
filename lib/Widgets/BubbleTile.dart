import 'package:flutter/material.dart';

class BubbleTile extends StatelessWidget {
  final Widget? child;
  final Color? backgroundColor;
  final double? Radius;
  final bool? isShadow;
  final void Function()? onTap;
  final double padding;
  final double topMargin;
  final double bottomMargin;
  final double height;
  final double width;
  final double margin;

  /// A container layout for mail/order like layout for app pages
  const BubbleTile(
      {Key? key,
      @required this.child,
      this.backgroundColor,
      this.Radius = 18,
      this.isShadow = true,
      this.onTap,
      this.padding = 8,
      this.topMargin = 3,
      this.bottomMargin = 4,
      this.height = 100,
      this.width = 100,
      this.margin = 8})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Container(
          width: width,
          height: height,
          padding: EdgeInsets.all(margin),
          margin: EdgeInsets.fromLTRB(0, topMargin, 0, bottomMargin),
          decoration: BoxDecoration(
              color: backgroundColor ?? Colors.white,
              borderRadius: BorderRadius.circular(Radius!),
              boxShadow: [
                isShadow == true
                    ? BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 4), // changes position of shadow
                      )
                    : const BoxShadow(color: Colors.transparent),
              ]),
          child: child,
        ),
      ),
    );
  }
}
