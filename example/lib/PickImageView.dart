// import 'package:flutter/material.dart';
// import 'package:liquidity_gallery/Functions/pickFile.dart';
// import 'package:liquidity_gallery/Functions/pickImage.dart';
// import 'package:liquidity_gallery/liquidity_gallery.dart';

// class PickImageView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Pick image'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: ElevatedButton(
//               onPressed: () async {
//                 final _file = await pickImage();
//                 print(_file.name);
//               },
//               child: Text('Pick image'),
//             ),
//           ),
//           Center(child: ElevatedButton(onPressed: () async {
//             await takeImage();
//           }, child: Text('Take picture'))),
//           Center(child: ElevatedButton(onPressed: () async {
//             final _file = await pickFile();
//             print(_file.name);
//           }, child: Text('Pick file'),),)
//         ],
//       ),
//     );
//   }
// }
