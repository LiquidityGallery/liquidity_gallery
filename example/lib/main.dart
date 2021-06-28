import 'package:example/LocationView.dart';
import 'package:example/StartEndDatePickerView.dart';
import 'package:example/TwitterLightOutView.dart';
import 'package:flutter/material.dart';
import 'package:liquidity_gallery/Widgets/ContentCard.dart';
import 'package:liquidity_gallery/liquidity_gallery.dart';
import 'AccessRightTest.dart';
import 'AutoCompleteExampleView.dart';
import 'ExportTextFromPDFView.dart';
import 'ItemVIew.dart';
import 'LocationInfoView.dart';
import 'NestedNavigationFlowView.dart';
import 'PickImageView.dart';
import 'SwitchButtonView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: twitterLightOutTheme,
      home: MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView(
        children: [
          IconButton(
              onPressed: () async {
                await hyperlink('http://www.google.com');
              },
              icon: Icon(Icons.comment)),
          ContentCard(
            dense: true,
          ),
          ContentCard(),
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
          ListTile(
              title: Text('Export Text From PDF'),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => ExportTextFromPDFView()))),
          ListTile(
            title: Text('Auto Complete example'),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => AutoCompleteExampleView())),
          ),
          ListTile(
            title: Text('Item view exmaple'),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => ItemView())),
          ),
          ListTile(
            title: Text('Switch button example'),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => SwitchButtonView())),
          ),
          ListTile(
            title: Text('Nested navigation flow'),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => NestedNavigationFlowView())),
          ),
          ListTile(
            title: Text('Pick image exmaple'),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => PickImageView())),
          ),
          ListTile(
            title: Text('Access exmaple'),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => AccessView())),
          ),
          Header(
            text: 'Title',
            color: Colors.white,
          ),
          Texter(
            text: 'This is a text.',
            color: Colors.white,
          ),
          darkModeOn == true ? Text("Darkmode") : Text("Lighttheme"),
          ListTile(
            title: Text('Show modal'),
            onTap: () => showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => SafeArea(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [TextField()],
                      ),
                    )),
          )
        ],
      ),
    );
  }
}
