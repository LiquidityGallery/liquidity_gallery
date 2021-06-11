import 'package:example/TwitterLightOutView.dart';
import 'package:flutter/material.dart';
import 'package:liquidity_gallery/Widget/GoogleButton.dart';
import 'package:liquidity_gallery/liquidity_gallery.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),),
      body: ListView(
        children: [
          ListTile(title: Text('Twitter Light out theme'), onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => TwitterLightsOutView()));
          },),

        ],
      ),
    );
  }
}

