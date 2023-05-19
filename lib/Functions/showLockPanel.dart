import 'package:flutter/material.dart';

import '../liquidity_gallery.dart';

Future<dynamic> showLockPanel(
    BuildContext context, Function onPressed, String password) async {
  TextEditingController controller = TextEditingController();

  return await showModal(
      context,
      Column(mainAxisSize: MainAxisSize.min, children: [
        const Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [Text("PLEASE ENTER PASSWORD"), Icon(Icons.lock)],
            ),
          ),
        ),
        BorderTextField(
          maxLines: 1,
          obscureText: true,
          autofocus: true,
          controller: controller,
          labeltext: 'Password',
        ),
        Row(
          children: [
            Expanded(
              child: ConfirmButton(
                text: 'ENTER',
                onPressed: () async {
                  if (controller.text == password) {
                    Navigator.pop(context);
                    await onPressed();
                  } else {
                    Navigator.pop(context);
                    showMessage(context, 'Password failed');
                  }
                },
                radius: 0,
                color: Colors.grey[800],
              ),
            ),
          ],
        )
      ]),
      radius: 0);
}
