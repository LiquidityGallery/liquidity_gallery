import 'package:flutter/material.dart';

import 'ConfirmButton.dart';



class AlertPanel extends StatelessWidget {
  final String? text;

  const AlertPanel({Key? key, this.text=''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return                             SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("注意"),
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
          body: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Icon(
                      Icons.info,
                      size: 100,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                      "${text}"),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                Row(
                  children: [
                    Expanded(
                        child: ConfirmButton(
                          text: '我明白並了解風險',
                          onPressed: () {
                            Navigator.pop(context, true);
                          },
                          color: Colors.grey[800],
                        ))
                  ],
                )
              ]),
        ));
  }
}
