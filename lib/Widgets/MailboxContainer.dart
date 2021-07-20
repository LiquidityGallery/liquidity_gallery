import 'package:flutter/material.dart';

class MailboxContainer extends StatelessWidget {
  final Widget? child;
  final Color? backgroundColor;
  final double? Radius;
  final bool? isShadow;
  final void Function()? onTap;
  final double padding;
  final double topMargin;
  final double bottomMargin;


  /// A container layout for mail/order like layout for app pages
  const MailboxContainer(
      {Key? key,
      @required this.child,
      this.backgroundColor,
      this.Radius = 25,
      this.isShadow = true, this.onTap, this.padding=8, this.topMargin=3, this.bottomMargin=4})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
        var brightness = MediaQuery.of(context).platformBrightness;
            bool darkModeOn = brightness == Brightness.dark;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(padding),
        margin: EdgeInsets.fromLTRB(0, topMargin, 0, bottomMargin),
        decoration: BoxDecoration(
            color: backgroundColor == null ? (darkModeOn==true ? Colors.grey[700] : Colors.white) : backgroundColor,
            borderRadius: BorderRadius.circular(Radius!),
            boxShadow: [
              isShadow == true
                  ? BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 4), // changes position of shadow
                    )
                  : BoxShadow()
            ]),
        child: child,
      ),
    );
  }
}
