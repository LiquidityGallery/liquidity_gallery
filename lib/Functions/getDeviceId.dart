






// import 'dart:io';

// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:flutter/foundation.dart';

// getDeviceId() async {
//   try {
//     if (kIsWeb) {

//     } else if (Platform.isAndroid ) {
//       DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//       AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//       print('Running on ${androidInfo.id}');
//       return androidInfo.id;
//     } else if (Platform.isIOS){
//       DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//       IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
//       print('Running on ${iosInfo.identifierForVendor}');
//       return iosInfo.identifierForVendor;
//     }
//   } catch (e) {
//     print(e);
//   }
// }