import 'package:flutter/material.dart';
import 'package:liquidity_gallery/liquidity_gallery.dart';

class ItemView extends StatelessWidget {
  const ItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: twitterDarkTheme,
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: 300,
                collapsedHeight: 150,
                flexibleSpace: AutoSizedAppBarWithImage(
                  bottomHeight: 60,
                  title: 'Item 01',
                  imageUrls: const [
                    'https://picsum.photos/2000/1000',
                    'https://picsum.photos/500/1000',
                    'https://picsum.photos/100/500'
                  ],
                ),
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
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                const LiquidityCard(children: [
                  LiquidityCardItem(
                    child: Text('List tile 1'),
                  )
                ])
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
