import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StreamBadgesIcon extends StatelessWidget {
  const StreamBadgesIcon(
      {Key? key,
      required this.query,
      this.child,
      this.badge,
      this.showBadge = true,
      required this.whileStream,
      this.padding,
      this.badgeAnimationType,
      this.animationDuration = const Duration(milliseconds: 500)})
      : super(key: key);

  final Query<Map<String, dynamic>> query;
  final Widget? child;
  final int? badge;
  final bool showBadge;
  final int? Function(QuerySnapshot<Map<String, dynamic>>) whileStream;
  final EdgeInsets? padding;
  final BadgeAnimationType? badgeAnimationType;
  final Duration animationDuration;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: query.snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Badge(
            animationDuration: animationDuration,
            animationType: badgeAnimationType ?? BadgeAnimationType.slide,
            padding: padding ?? EdgeInsets.all(3),
            showBadge: showBadge,
            child: child ?? Icon(Icons.notifications),
            badgeContent: Text(badge?.toString() ?? ''),
          );
        } else {
          final _int = whileStream(snapshot.data!);
          return Badge(
            animationDuration: animationDuration,
            animationType: badgeAnimationType ?? BadgeAnimationType.slide,
            padding: padding ?? EdgeInsets.all(3),
            showBadge: showBadge,
            child: child ?? Icon(Icons.notifications),
            badgeContent: Text(_int?.toString() ?? ''),
          );
        }
      },
    );
  }
}
