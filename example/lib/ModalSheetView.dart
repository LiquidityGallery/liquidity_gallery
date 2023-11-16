import 'package:flutter/material.dart';
import 'package:liquidity_gallery/Functions/showInputModal.dart';
import 'package:liquidity_gallery/Functions/showModal.dart';

class ModalSheetView extends StatelessWidget {
  const ModalSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modal sheet example'),
      ),
      body: ListView(
        children: [
          ElevatedButton(
              onPressed: () {
                showInputModal(context, [const TextField()]);
              },
              child: const Text('with input')),
          ElevatedButton(
              onPressed: () {
                showModalMax(
                    context,
                    Scaffold(
                      appBar: AppBar(
                        title: const Text('App bar'),
                      ),
                      body: const Column(
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
              child: const Text('Show modal max'))
        ],
      ),
    );
  }
}
