import 'package:flutter/material.dart';

class LiquidityCard extends StatelessWidget {
  const LiquidityCard({Key? key, this.inPadding, this.outPadding, required this.children}) : super(key: key);
  final EdgeInsets? inPadding;
  final EdgeInsets? outPadding;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outPadding ?? EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Card(
        color: Colors.red,
        child: Padding(
          padding: inPadding ?? EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ),
    );
  }
}
