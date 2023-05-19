import 'package:flutter/material.dart';
import 'package:liquidity_gallery/liquidity_gallery.dart';
import 'AccessRightTest.dart';
import 'AutoCompleteExampleView.dart';
import 'ExportTextFromPDFView.dart';
import 'ItemVIew.dart';
import 'LocationInfoView.dart';
import 'ModalSheetView.dart';
import 'NestedNavigationFlowView.dart';
import 'SharePrintView.dart';
// import 'StartEndDatePickerView.dart';
import 'SwitchButtonView.dart';
import 'TwitterLightOutView.dart';
import 'TwitterThemeView.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: twitterLightTheme,
      darkTheme: twitterDarkTheme,
      home: const MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView(
        children: [
          TextButton(
              onPressed: () async {
                print(await datePicker(context));
              },
              child: const Text("Date Picker")),

          ListTile(
            title: const Text('Currency picker'),
            onTap: () async {
              print(await enumPicker(context, Currency.values));
            },
          ),
          // TextButton(
          //   child: Text("Exchange"),
          //   onPressed: () async {
          //     final fx = Forex();
          //     double myPrice = await fx.getCurrencyConverted(
          //         describeEnum(Currency.CNY), "HKD", 100);
          //     print("100 USD in HKD: ${myPrice}");
          //     print(await fx.getAvailableCurrencies());
          //   },
          // ),

          ConfirmButton(
              text: 'test this button',
              onPressed: () async {
                print("Test");
                //await Future.delayed(Duration(seconds: 20)).timeout(Duration(seconds: 5), onTimeout: () => throw'timeout');
              }),
          ConfirmButton(
              text: 'test onYesNo',
              onPressed: () async {
                final bool = await onYesNo(context).timeout(
                    const Duration(seconds: 1),
                    onTimeout: () => throw 'timeout');
                print(bool);
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
            subtitle: 'WD News Today',
            //    dense: true,
            onTap: () {},
            icon: const Icon(
              Icons.update,
              size: 17,
            ),
            child: const Text("HI"),
          ),
          ListTile(
            title: const Text("Bubble Tabbar Example"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => Scaffold(
                        appBar: AppBar(
                          title: const Text("Bubble"),
                        ),
                        body: Center(
                          child: SizedBox(
                              width: 500,
                              height: 1000,
                              child: BubbleTabBar(
                                  labelColor: Colors.black87,
                                  unselectedLabalColor: Colors.grey,
                                  indicatorColor: Colors.transparent,
                                  tabs: const [
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
                                          color: Colors.blue,
                                          child: const Text("One"),
                                        )
                                      ],
                                    ),
                                    Container(
                                      color: Colors.red,
                                      child: const Text("Second"),
                                    )
                                  ])),
                        ),
                      )));
            },
          ),
          ListTile(
            title: const Text('Loading widget'),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoadingWidget(
                          load: () async {
                            await Future.delayed(const Duration(seconds: 5));
                          },
                          timeout: const Duration(seconds: 2),
                        ))),
          ),

          ListTile(
            title: const Text('Twitter Light Out theme'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const TwitterLightsOutView()));
            },
          ),
          ListTile(
            title: const Text('Twitter theme'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const TwitterThemeView()));
            },
          ),
          ListTile(
            title: const Text('Twitter Light Out Login'),
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
          // ListTile(
          //   title: const Text('StartEndDatePicker'),
          //   onTap: () => Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => const StartEndDatePickerView())),
          // ),
          ListTile(
            title: const Text('Location Info'),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const LocationInfoView())),
          ),
          // ListTile(
          //     title: Text('Location and Google Map'),
          //     onTap: () => Navigator.push(
          //         context, MaterialPageRoute(builder: (_) => LocationView()))),
          ListTile(
              title: const Text('Export Text From PDF'),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const ExportTextFromPDFView()))),
          ListTile(
            title: const Text('Auto Complete example'),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const AutoCompleteExampleView())),
          ),
          ListTile(
            title: const Text('Item view exmaple'),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => const ItemView())),
          ),
          ListTile(
            title: const Text('Switch button example'),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const SwitchButtonView())),
          ),
          ListTile(
            title: const Text('Nested navigation flow'),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => NestedNavigationFlowView())),
          ),
          // ListTile(
          //   title: Text('Pick image example'),
          //   onTap: () => Navigator.push(
          //       context, MaterialPageRoute(builder: (_) => PickImageView())),
          // ),
          ListTile(
            title: const Text('Access example'),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => const AccessView())),
          ),
          const ListTile(
            title: Text('Badges Icon'),
            // onTap: () => Navigator.push(
            //     context, MaterialPageRoute(builder: (_) => BadgesIconView())),
          ),
          ListTile(
            title: const Text('Modal sheet example'),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const ModalSheetView())),
          ),
          ListTile(
            title: const Text('Share & Print'),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const SharePrintView())),
          ),
          // ListTile(
          //   title: Text('Search text field example'),
          //   onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SearchTextFieldView())),
          // ),
          const Header(
            text: 'Title',
            color: Colors.white,
          ),
          const Texter(
            text: 'This is a text.',
            color: Colors.white,
          ),
          darkModeOn == true
              ? const Text("Darkmode")
              : const Text("Lighttheme"),
          ListTile(
            title: const Text('Show modal'),
            onTap: () => showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => const SafeArea(
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
          BubbleTabBar(tabs: const [
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
