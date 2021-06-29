import 'package:flutter/material.dart';
import 'package:liquidity_gallery/Functions/showInputModal.dart';
import 'package:liquidity_gallery/Functions/showModal.dart';

class ModalSheetView extends StatelessWidget {
  const ModalSheetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modal sheet example'),
      ),
      body: ListView(
        children: [
          ElevatedButton(
              onPressed: () {
                showInputModal(context, [TextField()]);
              },
              child: Text('with input')),
          ElevatedButton(
              onPressed: () {
                showModalMax(
                    context,
                    Scaffold(
                      appBar: AppBar(
                        title: Text('App bar'),
                      ),
                      body: Column(
                        children: [
                          ListTile(
                            title: Text('123'),
                          ),
                          TextField(
                            autofocus: true,
                          )
                        ],
                      ),
                    ));
              },
              child: Text('Show modal max'))
        ],
      ),
    );
  }
}
