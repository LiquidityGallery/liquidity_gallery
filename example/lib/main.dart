import 'package:example/LocationView.dart';
import 'package:example/StartEndDatePickerView.dart';
import 'package:example/TwitterLightOutView.dart';
import 'package:flutter/material.dart';
import 'package:liquidity_gallery/Widgets/ContentCard.dart';
import 'package:liquidity_gallery/liquidity_gallery.dart';
import 'AccessRightTest.dart';
import 'AutoCompleteExampleView.dart';
import 'BadgesIconView.dart';
import 'ExportTextFromPDFView.dart';
import 'ItemVIew.dart';
import 'LocationInfoView.dart';
import 'ModalSheetView.dart';
import 'NestedNavigationFlowView.dart';
import 'PickImageView.dart';
import 'SearchTextFieldView.dart';
import 'SharePrintView.dart';
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
            imageURL: 'https://firebasestorage.googleapis.com/v0/b/logistized.appspot.com/o/MDOS%2Fimage_picker_29CA1672-E0F8-4AEB-857C-78BA383F5DD5-77684-00000A943FA057CE.jpg?alt=media&token=2c78a779-3861-43cf-8974-e0eafc051293',
            text:' New WD Drive has security issue',
            subtitle: 'WD News Today',
        //    dense: true,
            onTap: (){},
            icon: Icon(Icons.update,size: 17,),
          ),
          BubbleTile(
       //     isShadow: false,
            child: Text('Data'),
          ),


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
            title: Text('Pick image example'),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => PickImageView())),
          ),
          ListTile(
            title: Text('Access example'),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => AccessView())),
          ),
          ListTile(
            title: Text('Badges Icon'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => BadgesIconView())),
          ),
          ListTile(
            title: Text('Modal sheet example'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ModalSheetView())),
          ),
          ListTile(
            title: Text('Share & Print'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SharePrintView())),
          ),
          // ListTile(
          //   title: Text('Search text field example'),
          //   onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SearchTextFieldView())),
          // ),
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
          ),
          ConfirmButton(text: '訂閱', onPressed: (){}, radius: 0.0, elevation: 0,color: Colors.black87,),
        ],
      ),
    );
  }
}
