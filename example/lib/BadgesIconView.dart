// import 'package:flutter/material.dart';
// import 'package:liquidity_gallery/liquidity_gallery.dart';
// import 'package:badges/badges.dart';

// class BadgesIconView extends StatefulWidget {
//   const BadgesIconView({Key? key}) : super(key: key);

//   @override
//   _BadgesIconViewState createState() => _BadgesIconViewState();
// }

// class _BadgesIconViewState extends State<BadgesIconView> {
//   int badges = 0;

//   void _onTap() {
//     setState(() {
//       badges += 1;
//     });
//   }

//   void _reset() {
//     setState(() {
//       badges = 0;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Badges icon'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             BadgesIcon(
//               badge: badges,
//             ),
//             ElevatedButton(onPressed: _onTap, child: Text('Tap to add badge')),
//             ElevatedButton(onPressed: _reset, child: Text('Tap to reset'))
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(
//               label: 'Normal',
//               icon: BadgesIcon(
//                 badge: badges,
//               )),
//           BottomNavigationBarItem(
//               label: 'Fading',
//               icon: BadgesIcon(
//                 badgeAnimationType: BadgeAnimationType.fade,
//                 badge: badges,
//               )),
//           BottomNavigationBarItem(
//               label: 'Scale',
//               icon: BadgesIcon(
//                 badgeAnimationType: BadgeAnimationType.scale,
//                 badge: badges,
//               )),
//           BottomNavigationBarItem(
//               label: 'Custom',
//               icon: BadgesIcon(
//                 child: Icon(Icons.badge),
//                 badge: 10,
//               ))
//         ],
//       ),
//     );
//   }
// }
