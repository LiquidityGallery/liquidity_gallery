import 'package:flutter/material.dart';
import 'package:liquidity_gallery/liquidity_gallery.dart';

class SwitchButtonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: twitterLightOutTheme,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Switch button example'),
        ),
        body: Center(
          child: Row(
            children: [
              Expanded(
                  child: SwitchButton(
                text: '零售',
                icon: Icons.shop,
                onChanged: (bool value) {
                  print(value);
                },
              )),
              Expanded(
                  child: SwitchButton(
                text: '批發',
                icon: Icons.map,
                onChanged: (bool value) {
                  print(value);
                },
              )),
              Expanded(
                  child: SwitchButton(
                text: '網點',
                icon: Icons.home,
                onChanged: (bool value) {
                  print(value);
                },
              )),
              Expanded(
                  child: SwitchButton(
                text: '店舖',
                icon: Icons.home_work,
                onChanged: (bool value) {
                  print(value);
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}