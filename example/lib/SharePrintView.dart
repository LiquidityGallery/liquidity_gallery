import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class SharePrintView extends StatelessWidget {
  const SharePrintView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Share & Print'),
      ),
      body: ListView(
        children: [
          ElevatedButton(
              onPressed: () {
                Share.share('Testing');
              },
              child: const Text('Share text "Testing"'))
        ],
      ),
    );
  }
}
