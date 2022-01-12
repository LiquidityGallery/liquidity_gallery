import 'package:example/LocationView.dart';
import 'package:example/StartEndDatePickerView.dart';
import 'package:example/TwitterLightOutView.dart';
import 'package:example/TwitterThemeView.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:liquidity_gallery/Class.dart';
import 'package:liquidity_gallery/Functions/datePicker.dart';
import 'package:liquidity_gallery/Functions/onYesNo.dart';
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
      theme: twitterLightTheme,
      darkTheme: twitterDarkTheme,
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
          TextButton(onPressed: ()async {
            print(await datePicker(context));
          }, child: Text("Date Picker")),

          ListTile(
            title: Text('Currency picker'),
            onTap: () async{
              print(await enumPicker(context, Currency.values));
            },
          ),
TextButton(child: Text("Exchange"),onPressed: () async{
  final fx = Forex();
  double myPrice = await fx.getCurrencyConverted(describeEnum(Currency.CNY), "HKD", 100);
  print("100 USD in HKD: ${myPrice}");
print(await fx.getAvailableCurrencies());
},),

          ConfirmButton(text: 'test this button', onPressed: () async {
            print("Test");
            //await Future.delayed(Duration(seconds: 20)).timeout(Duration(seconds: 5), onTimeout: () => throw'timeout');
          }),
          ConfirmButton(text: 'test onYesNo', onPressed: () async {
            final _bool = await onYesNo(context).timeout(Duration(seconds: 1), onTimeout: () => throw 'timeout');
            print(_bool);
          }),
          // CalendarTimeline(
          //   initialDate: DateTime(2020, 4, 20),
          //   firstDate: DateTime(2019, 1, 15),
          //   lastDate: DateTime(2020, 11, 20),
          //   onDateSelected: (date) => print(date),
          //   leftMargin: 20,
          //   monthColor: Colors.blueGrey,
          //   dayColor: Colors.teal[200],
          //   activeDayColor: Colors.white,
          //   activeBackgroundDayColor: Colors.redAccent[100],
          //   dotsColor: Color(0xFF333A47),
          //   selectableDayPredicate: (date) => date.day != 23,
          //   locale: 'en_ISO',
          // ),
          ContentCard(
            imageURL:
                'https://firebasestorage.googleapis.com/v0/b/logistized.appspot.com/o/MDOS%2Fimage_picker_29CA1672-E0F8-4AEB-857C-78BA383F5DD5-77684-00000A943FA057CE.jpg?alt=media&token=2c78a779-3861-43cf-8974-e0eafc051293',
            text: ' New WD Drive has security issue',
            subtitle: 'WD News Today',
            //    dense: true,
            onTap: () {},
            icon: Icon(
              Icons.update,
              size: 17,
            ),
          ),
          ListTile(
            title: Text("Bubble Tabbar Example"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => Scaffold(
                        appBar: AppBar(
                          title: Text("Bubble"),
                        ),
                        body: Center(
                          child: Container(
                              width: 500,
                              height: 1000,
                              child: BubbleTabBar(
                                  labelColor: Colors.black87,
                                  unselectedLabalColor: Colors.grey,
                                  indicatorColor: Colors.transparent,
                                  tabs: [
                                    Tab(
                                      text: 'One',
                                    ),
                                    Tab(
                                      text: 'Second',
                                    )
                                  ],
                                  children: [
                                    ListView(
                                      children: [
                                        Container(
                                          child: Text("One"),
                                          color: Colors.blue,
                                        )
                                      ],
                                    ),
                                    Container(
                                      child: Text("Second"),
                                      color: Colors.red,
                                    )
                                  ])),
                        ),
                      )));
            },
          ),
          ListTile(
            title: Text('Loading widget'),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoadingWidget(
                          load: () async {
                            await Future.delayed(Duration(seconds: 5));
                          },
                          timeout: Duration(seconds: 2),
                        ))),
          ),

          ListTile(
            title: Text('Twitter Light Out theme'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => TwitterLightsOutView()));
            },
          ),
          ListTile(
            title: Text('Twitter theme'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => TwitterThemeView()));
            },
          ),
          ListTile(
            title: Text('Twitter Light Out Login'),
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (_) => TwitterLoginView(
              //               onLogin: (username, password) {
              //                 print('Username: $username, Password: $password');
              //               },
              //               onGoogleLogin: () {},
              //             )));
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
          // ListTile(
          //     title: Text('Location and Google Map'),
          //     onTap: () => Navigator.push(
          //         context, MaterialPageRoute(builder: (_) => LocationView()))),
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
          // ListTile(
          //   title: Text('Pick image example'),
          //   onTap: () => Navigator.push(
          //       context, MaterialPageRoute(builder: (_) => PickImageView())),
          // ),
          ListTile(
            title: Text('Access example'),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => AccessView())),
          ),
          ListTile(
            title: Text('Badges Icon'),
            // onTap: () => Navigator.push(
            //     context, MaterialPageRoute(builder: (_) => BadgesIconView())),
          ),
          ListTile(
            title: Text('Modal sheet example'),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => ModalSheetView())),
          ),
          ListTile(
            title: Text('Share & Print'),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => SharePrintView())),
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
          ConfirmButton(
            text: '訂閱',
            onPressed: () async {},
            radius: 0.0,
            elevation: 0,
            color: Colors.black87,
          ),
          BubbleTabBar(tabs: [
            Tab(
              text: 'One',
            ),
            Tab(text: " Second")
          ], children: [
            Container(),
            Container(),
          ]),
        ],
      ),
    );
  }
}
