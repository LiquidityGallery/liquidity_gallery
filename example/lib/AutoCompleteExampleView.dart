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

  final controller = TextEditingController();
  User? _user;

  final _formKey = GlobalKey<FormState>();

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
            LiquidityAutoComplete<User>(
              /// add this when input must match
              validator: (String? string) {
                if (!_users.any((element) => element.name == string)) {
                  return 'Not selected';
                } else {
                  return null;
                }
              },
              controller: controller,
              optionsBuilder: (TextEditingValue textEditingValue) {
                return _users.where((element) =>
                    element.name.toLowerCase().contains(textEditingValue.text));
              },
              onSelected: (User user) {
                controller.text = user.name;
                setState(() {
                  _user = user;
                });
              },
              child: (User user) => ListTile(
                title: Text(user.name),
                subtitle: Text(user.id),
              ),
            ),
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
