import 'package:flutter/material.dart';

class LiquidityCard extends StatelessWidget {
  const LiquidityCard(
      {super.key,
      this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      required this.children});
  final EdgeInsets padding;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Card(
        color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
