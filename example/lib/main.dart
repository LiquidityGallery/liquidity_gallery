import 'dart:ffi';

import 'package:example/LocationView.dart';
import 'package:example/StartEndDatePickerView.dart';
import 'package:example/TwitterLightOutView.dart';
import 'package:flutter/material.dart';
import 'package:liquidity_gallery/Functions/showModal.dart';
import 'package:liquidity_gallery/liquidity_gallery.dart';

import 'LocationInfoView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Twitter Light Out theme'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => TwitterLightsOutView()));
            },
          ),
          ListTile(
            title: Text('Twitter Light Out Login'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => TwitterLoginView(
                            onLogin: (username, password) {
                              print('Username: $username, Password: $password');
                            },
                            onGoogleLogin: () {},
                          )));
            },
          ),
          ListTile(
            title: Text('StartEndDatePicker'),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => StartEndDatePickerView())),
          ),
          ListTile(
            title: Text('Location Info'),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => LocationInfoView())),
          ),
          ListTile(
              title: Text('Location and Google Map'),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => LocationView()))),
          Header(text: 'Title',color: Colors.white,),
          Texter(text: 'This is a text.',color: Colors.white,),
          ConfirmButton(text: 'showModal', onPressed: (){
            showModal(context, Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(title: Text("HI"),),
                ListTile(title: Text("IHI"),)
              ],));
          }),

ConfirmButton(text: 'showModalMax', onPressed: (){
  showModalMax(context, Scaffold(
    appBar: AppBar(title: Text("showModalMax"),
    ),
    body: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(title: Text("HI"),),
        ListTile(title: Text("IHI"),),

      ],),
  ));
}),
          ConfirmButton(text: 'YESNO', onPressed: (){
            showYesNoModal(context,(){
              print("HI");
            });
          }),
        ],
      ),
    );
  }
}
