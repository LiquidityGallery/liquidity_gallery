import 'package:flutter/widgets.dart';

void NavigationPush(context, Widget page) {
  ///Navigator.of(context).push with no animation
  Navigator.pushReplacement(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) => page,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    ),
  );
}
