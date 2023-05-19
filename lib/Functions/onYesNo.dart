import 'package:flutter/material.dart';

Future<bool> onYesNo(BuildContext context, {String? text}) async {
  final result = await showModalBottomSheet<bool>(
      //   isScrollControlled: true,
      shape: const RoundedRectangleBorder(
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
                  ListTile(title: Text(text ?? "Do you want to continue?")),
                  ListTile(
                    leading: Icon(
                      Icons.check_circle,
                      color: Colors.cyan[300],
                    ),
                    title: const Text("Yes"),
                    onTap: () => Navigator.pop(context, true),
                  ),
                  ListTile(
                    leading: const Icon(Icons.cancel),
                    title: const Text(
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
  if (result == null || !result) {
    return false;
  } else {
    return true;
  }
}
