import 'package:flutter/material.dart';

import 'MailboxContainer.dart';

class ListButton extends StatelessWidget {
  final Function() onTap;
  final Icon icon;
  final Widget child;

  const ListButton(
      {super.key, required this.onTap, required this.icon, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: MailboxContainer(
          onTap: onTap,
          Radius: 15,
          padding: 4,
          child: ListTile(
            leading: icon,
            title: child,
          )),
    );
  }
}
