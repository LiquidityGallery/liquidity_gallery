import 'package:flutter/material.dart';

Future<bool> onYesNo(BuildContext context, {String? text}) async {
  final _bool = await showModalBottomSheet<bool>(
      //   isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: (_) => Container(
            //   height: MediaQuery.of(context).size.height * 0.92,
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                      title: Text(
                          text == null ? "Do you want to continue?" : text)),
                  ListTile(
                    leading: Icon(
                      Icons.check_circle,
                      color: Colors.cyan[300],
                    ),
                    title: Text("Yes"),
                    onTap: () => Navigator.pop(context, true),
                  ),
                  ListTile(
                    leading: Icon(Icons.cancel),
                    title: Text(
                      "Cancel",
                    ),
                    onTap: () {
                      Navigator.pop(context, false);
                    },
                  ),
                ],
              ),
            ),
          ));
  if (_bool == null || !_bool) {
    return false;
  } else {
    return true;
  }
}
