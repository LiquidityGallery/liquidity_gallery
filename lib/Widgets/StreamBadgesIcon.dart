import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;

class StreamBadgesIcon<T> extends StatelessWidget {
  const StreamBadgesIcon(
      {super.key,
      required this.stream,
      this.child,
      this.badge,
      this.showBadge = true,
      required this.whileStream,
      this.padding,
      this.badgeAnimationType,
      this.animationDuration = const Duration(milliseconds: 500),
      this.textStyle});

  final Stream<T> stream;
  final Widget? child;
  final int? badge;
  final bool showBadge;
  final int? Function(T) whileStream;
  final EdgeInsets? padding;
  final BadgeAnimationType? badgeAnimationType;
  final Duration animationDuration;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, AsyncSnapshot<T> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Badge(
            // animationDuration: animationDuration,
            // animationType: badgeAnimationType ?? BadgeAnimationType.slide,
            // padding: padding ?? EdgeInsets.all(3),
            showBadge: showBadge,
            badgeContent: Text(
              badge?.toString() ?? '',
              style: textStyle,
            ),
            child: child ?? const Icon(Icons.notifications),
          );
        }
        final int = whileStream(snapshot.data as T);
        return Badge(
          // animationDuration: animationDuration,
          // animationType: badgeAnimationType ?? BadgeAnimationType.slide,
          // padding: padding ?? EdgeInsets.all(3),
          showBadge: showBadge,
          badgeContent: Text(
            int?.toString() ?? '',
            style: textStyle,
          ),
          child: child ?? const Icon(Icons.notifications),
        );
      },
    );
  }
}
