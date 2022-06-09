import 'package:flutter/material.dart';

Future<dynamic> showModal(BuildContext context, Widget child,
    {double? radius, bool? isDismissible}) async {
  return await showModalBottomSheet(
      isDismissible: isDismissible == null ? true : isDismissible,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(radius == null ? 16 : radius),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: (context) => Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              //   height: MediaQuery.of(context).size.height * 0.92,
              child: child,
            ),
          ));
}

Future<T?> showModalMax<T>(BuildContext context, Widget child,
    {double? radius, num height = 0.92, bool? isDismissible}) async {
  return await showModalBottomSheet<T>(
      isDismissible: isDismissible == null ? true : isDismissible,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(radius == null ? 16 : radius),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: (context) => Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              height: MediaQuery.of(context).size.height * height,
              child: child,
            ),
          ));
}
