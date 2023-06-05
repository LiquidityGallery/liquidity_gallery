// import 'package:flutter/material.dart';
// import 'package:liquidity_gallery/liquidity_gallery.dart';

// class StartEndDatePickerView extends StatelessWidget {
//   const StartEndDatePickerView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Start End Date Picker Display'),
//       ),
//       body: ListView(
//         children: [
//           const ListTile(
//             title: Text('Horizontal'),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: StartEndDatePicker(
//               padding: 100,
//               direction: Axis.horizontal,
//               startDate: DateTime.now(),
//               endDate: DateTime.now(),
//               onStartDateChanged: (date) {
//                 print('start date changed to $date');
//               },
//               onEndDateChanged: (date) {
//                 print('start date changed to $date');
//               },
//             ),
//           ),
//           const ListTile(
//             title: Text('Vertical'),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: StartEndDatePicker(
//               direction: Axis.vertical,
//               startDate: DateTime.now(),
//               endDate: DateTime.now(),
//               onStartDateChanged: (date) {
//                 print('start date changed to $date');
//               },
//               onEndDateChanged: (date) {
//                 print('start date changed to $date');
//               },
//             ),
//           ),
//           const ListTile(
//             title: Text('Sized'),
//           ),
//           StartEndDatePicker(
//             width: 100,
//             height: 50,
//             direction: Axis.vertical,
//             startDate: DateTime.now(),
//             endDate: DateTime.now(),
//             onStartDateChanged: (date) {
//               print('start date changed to $date');
//             },
//             onEndDateChanged: (date) {
//               print('start date changed to $date');
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
