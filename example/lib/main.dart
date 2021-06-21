import 'dart:ffi';

import 'package:example/LocationView.dart';
import 'package:example/StartEndDatePickerView.dart';
import 'package:example/TwitterLightOutView.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:liquidity_gallery/Functions/showModal.dart';
import 'package:liquidity_gallery/liquidity_gallery.dart';

import 'AutoCompleteExampleView.dart';
import 'LocationInfoView.dart';
import 'ExportTextFromPDFView.dart';

Future<void> main() async {
  runApp(MyApp());
}

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
          Header(
            text: 'Title',
            color: Colors.white,
          ),
          Texter(
            text: 'This is a text.',
            color: Colors.white,
          ),
          ListTile(
              title: Text('Export Text From PDF'),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => ExportTextFromPDFView()))),
          ListTile(
            title: Text('Auto Complete example'),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => AutoCompleteExampleView())),
          ),
          ConfirmButton(
              text: 'showModal',
              onPressed: () {
                showModal(
                    context,
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: Text("HI"),
                        ),
                        ListTile(
                          title: Text("IHI"),
                        )
                      ],
                    ));
              }),
          ConfirmButton(
              text: 'showModalMax',
              onPressed: () {
                showModalMax(
                    context,
                    Scaffold(
                      appBar: AppBar(
                        title: Text("showModalMax"),
                      ),
                      body: ListView(
                        children: [
                          ListTile(
                            title: Text("HI"),
                          ),
                          ListTile(
                            title: Text("IHI"),
                          ),
                          TextField(),
                          TextField(),
                          TextField(),
                          TextField(),
                          TextField(),
                          TextField(),
                          TextField(),
                          TextField(),
                          TextField(),
                          TextField(),
                        ],
                      ),
                    ));
              }),
          ConfirmButton(
              text: 'YESNO',
              onPressed: () {
                showYesNoModal(context, () {
                  print("HI");
                });
              }),
          ConfirmButton(
              text: 'ShowMessage (with out action)',
              onPressed: () {
                showMessage(context, 'You can not close this snackbar');
              }),
          ConfirmButton(
              text: 'ShowMessage (with action)',
              onPressed: () {
                showMessage(
                  context,
                  'You can close this snackbar',
                  () {
                    print('Button pressed');
                  },
                );
              })
        ],
      ),
    );
  }
}
