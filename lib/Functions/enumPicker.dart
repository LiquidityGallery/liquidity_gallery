import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:liquidity_gallery/liquidity_gallery.dart';

///URL Launcher simple version
Future<dynamic> enumPicker(context, values, {bool isListview = false}) async {
  if (isListview == false) {
    return await showModal(
        context,
        SafeArea(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
          ...values
              .map((e) => InkWell(
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Center(
                              child: Text(describeEnum(e)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context, e);
                    },
                  ))
              .toList()
        ])),
        radius: 0);
  } else {
    return await showModalMax(
        context,
        SafeArea(
            child: ListView(children: [
          ...values
              .map((e) => InkWell(
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Center(
                              child: Text(describeEnum(e)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context, e);
                    },
                  ))
              .toList()
        ])),
        radius: 0,
        height: 0.8);
  }
}
