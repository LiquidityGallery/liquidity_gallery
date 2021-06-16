
import 'package:flutter/material.dart';

Future <void> showModal(BuildContext context, Widget child )async {
 await  showModalBottomSheet(
       isScrollControlled: true,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.vertical(
           top: Radius.circular(16),
         ),
       ),
       clipBehavior: Clip.antiAliasWithSaveLayer,
       context: context,
       builder: (_) => Container(
      //   height: MediaQuery.of(context).size.height * 0.92,
         child: child,
       ));
 }

Future <void> showModalMax(BuildContext context, Widget child )async {
  await  showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: (_) => Container(
        height: MediaQuery.of(context).size.height * 0.92,
        child: child,
      ));
}