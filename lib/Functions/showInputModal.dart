import 'package:flutter/material.dart';

Future<void> showInputModal(BuildContext context, List<Widget> children) async {
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) => SafeArea(
            child: Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Column(mainAxisSize: MainAxisSize.min, children: children),
            ),
          ));
}
