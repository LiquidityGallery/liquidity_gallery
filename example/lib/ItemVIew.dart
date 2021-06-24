import 'dart:math';

import 'package:flutter/material.dart';
import 'package:liquidity_gallery/liquidity_gallery.dart';

class ItemView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: twitterLightOutTheme,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 250,
              collapsedHeight: 150,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(50.0),
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
                      text: '零售',
                      icon: Icons.shop,
                      onChanged: (bool value) {
                        print(value);
                      },
                    )),
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
                      text: '零售',
                      icon: Icons.shop,
                      onChanged: (bool value) {
                        print(value);
                      },
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
