import 'package:flutter/material.dart';

Future<void> showYesNoModal(BuildContext context, void Function() onYes,
    {String? text}) async {
  await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      //   isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: (context) => Container(
        color: Colors.white,
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
                    onTap: onYes,
                  ),
                  ListTile(
                    leading: Icon(Icons.cancel),
                    title: Text(
                      "Cancel",
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ));
}
