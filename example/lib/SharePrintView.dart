import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class SharePrintView extends StatelessWidget {
  const SharePrintView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share & Print'),
      ),
      body: ListView(
        children: [
          ElevatedButton(
              onPressed: () {
                Share.share('Testing');
              },
              child: Text('Share text "Testing"'))
        ],
      ),
    );
  }
}
