import 'package:flutter/material.dart';

class LiquidityCardItem extends StatelessWidget {
  const LiquidityCardItem(
      {super.key,
      this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      required this.child,
      this.title});

  final EdgeInsets padding;
  final Widget child;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: const Column(
        children: [],
      ),
    );
  }
}
