import 'package:flutter/material.dart';

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
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (_) => SafeArea(
                      child: Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  autofocus: true,
                                )
                              ],
                            ),
                          ),
                    ));
              },
              child: Text('with input'))
        ],
      ),
    );
  }
}
