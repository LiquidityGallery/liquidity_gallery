import 'package:flutter/material.dart';

Future<dynamic> showModal(BuildContext context,
    Widget child, {double? radius}) async {
  return  await showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(radius==null ? 16: radius),
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
    Widget child, {double? radius, num height=0.92}) async {
  return await showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(radius==null ? 16: radius),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: (_) =>
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height * height,
            child: child,
          ));
}
