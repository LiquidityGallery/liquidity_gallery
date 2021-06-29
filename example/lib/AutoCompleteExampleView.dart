import 'package:flutter/material.dart';
import 'package:liquidity_gallery/Widgets/LiquidityAutoComplete.dart';

class AutoCompleteExampleView extends StatefulWidget {
  @override
  _AutoCompleteExampleViewState createState() =>
      _AutoCompleteExampleViewState();
}

class _AutoCompleteExampleViewState extends State<AutoCompleteExampleView> {
  final List<User> _users = [
    User(id: '01', name: '01User'),
    User(id: '02', name: '02User'),
    User(id: '03', name: '03User'),
    User(id: '04', name: '04User'),
    User(id: '05', name: '05User'),
  ];

  List<String> _list = ['1111', '2222', '3333', '4444', '5555'];

  final controller = TextEditingController();
  final controller2 = TextEditingController();
  User? _user;

  final _formKey = GlobalKey<FormState>();
  final node1 = FocusNode();
  final node2 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auto Complete example'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            ListTile(
              leading: Text('Selected user'),
              title: Text(_user?.name ?? 'Not selected'),
            ),
            // LiquidityAutoComplete<User>(
            //   /// add this when input must match
            //   validator: (String? string) {
            //     if (!_users.any((element) => element.name == string)) {
            //       return 'Not selected';
            //     } else {
            //       return null;
            //     }
            //   },
            //   controller: controller,
            //   focusNode: node1,
            //   optionsBuilder: (TextEditingValue textEditingValue) {
            //     return _users.where((element) =>
            //         element.name.toLowerCase().contains(textEditingValue.text));
            //   },
            //   onSelected: (User user) {
            //     controller.text = user.name;
            //     setState(() {
            //       _user = user;
            //     });
            //   },
            //   child: (User user) => ListTile(
            //     title: Text(user.name),
            //     subtitle: Text(user.id),
            //   ),
            // ),
            // LiquidityAutoComplete<User>(
            //   /// add this when input must match
            //   validator: (String? string) {
            //     if (!_users.any((element) => element.name == string)) {
            //       return 'Not selected';
            //     } else {
            //       return null;
            //     }
            //   },
            //   controller: controller2,
            //   focusNode: node2,
            //   optionsBuilder: (TextEditingValue textEditingValue) {
            //     return _users.where((element) =>
            //         element.name.toLowerCase().contains(textEditingValue.text));
            //   },
            //   onSelected: (User user) {
            //     controller2.text = user.name;
            //     setState(() {
            //       _user = user;
            //     });
            //   },
            //   child: (User user) => ListTile(
            //     title: Text(user.name),
            //     subtitle: Text(user.id),
            //   ),
            // ),
            Autocomplete<String>(
              optionsBuilder: (value) =>
                  _list.where((element) => element.contains(value.text)),
            ),
            Autocomplete<String>(
                optionsBuilder: (value) =>
                    _list.where((element) => element.contains(value.text))),
            ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text('Validate')),
            Center(
              child:
                  Text((_formKey.currentState?.validate() ?? false).toString()),
            )
          ],
        ),
      ),
    );
  }
}

class User {
  String id;
  String name;

  User({required this.id, required this.name});
}
