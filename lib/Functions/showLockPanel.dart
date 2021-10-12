import 'package:flutter/material.dart';

import '../liquidity_gallery.dart';

Future<dynamic> showLockPanel(BuildContext context,
    Function onPressed, String password) async {
  TextEditingController _controller =TextEditingController();


  return  await                                           showModal(
      context,
      Column(
          mainAxisSize:
          MainAxisSize.min,
          children: [
            Center(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("PLEASE ENTER PASSWORD"),
            ),),
            BorderTextField(
              controller: _controller,
              labeltext: 'Password',
            ),
            Row(
              children: [
                Expanded(
                  child: ConfirmButton(
                    text: 'ENTER',
                    onPressed:
                        () async {
                      if (_controller
                          .text ==
                          password) {
onPressed();
                      } else {
                        Navigator.pop(
                            context);
                        showMessage(
                            context,
                            'Password failed');
                      }
                    },
                    radius: 0, color: Colors.grey[800],
                  ),
                ),
              ],
            )
          ]),
      radius: 0);
}

