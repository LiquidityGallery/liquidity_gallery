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
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text("PLEASE ENTER PASSWORD"),
                  Icon(Icons.lock)
                ],
              ),
            ),),
            BorderTextField(
              obscureText: true,
              autofocus: true,
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
                        Navigator.pop(context);
await onPressed();

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

