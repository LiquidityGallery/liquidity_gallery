import 'package:flutter/material.dart';

Future<dynamic> showModal(BuildContext context,
    Widget child,) async {
  return  await showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: (_) =>
          Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              //   height: MediaQuery.of(context).size.height * 0.92,
              child: child,
            ),
          ));
}

Future<dynamic> showModalMax(BuildContext context,
    Widget child,) async {
  return await showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: (_) =>
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.92,
            child: child,
          ));
}
