import 'package:flutter/material.dart' hide Badge;
import 'package:badges/badges.dart';

class BadgesIcon extends StatelessWidget {
  const BadgesIcon(
      {super.key,
      this.child,
      this.badge,
      this.showBadge = true,
      this.padding,
      this.badgeAnimationType,
      this.animationDuration = const Duration(milliseconds: 500),
      this.textStyle});

  final Widget? child;
  final int? badge;
  final bool showBadge;
  final EdgeInsets? padding;
  final BadgeAnimationType? badgeAnimationType;
  final Duration animationDuration;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
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
}
