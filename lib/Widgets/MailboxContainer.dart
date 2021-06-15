import 'package:flutter/material.dart';

class MailboxContainer extends StatelessWidget {
  final Widget? child;
  final Color? backgroundColor;
  final double? Radius;
  final bool? isShadow;
  final void Function()? onTap;


  /// A container layout for mail/order like layout for app pages
  const MailboxContainer(
      {Key? key,
      @required this.child,
      this.backgroundColor,
      this.Radius = 25,
      this.isShadow = true, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.fromLTRB(0, 3, 0, 4),
        decoration: BoxDecoration(
            color: backgroundColor == null ? Colors.white : backgroundColor,
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
