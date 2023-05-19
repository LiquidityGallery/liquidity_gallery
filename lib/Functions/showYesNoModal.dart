import 'package:flutter/material.dart';

Future<void> showYesNoModal(BuildContext context, void Function() onYes,
    {String? text}) async {
  await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      //   isScrollControlled: true,
      shape: const RoundedRectangleBorder(
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
                          text ?? "Do you want to continue?")),
                  ListTile(
                    leading: Icon(
                      Icons.check_circle,
                      color: Colors.cyan[300],
                    ),
                    title: const Text("Yes"),
                    onTap: onYes,
                  ),
                  ListTile(
                    leading: const Icon(Icons.cancel),
                    title: const Text(
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
