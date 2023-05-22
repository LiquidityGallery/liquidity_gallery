// import 'package:location/location.dart';

// /// Function to get current location
// /// See usage on example [LocationInfoView.dart]
// Future<void> checkLocationPermission() async {
//   Location _location = Location();

//   print('Checking location service enable...');
//   var _serviceEnabled = await _location.serviceEnabled();
//   if (!_serviceEnabled) {
//     print('Location service disable');
//     print('Requesting location service enable...');
//     _serviceEnabled = await _location.requestService();
//     if (!_serviceEnabled) {
//       print('Location service request denied');
//       return;
//     }
//   }
//   print('Location service enabled');

//   print('Checking location permission...');
//   var _permissionStatus = await _location.hasPermission();
//   if (_permissionStatus == PermissionStatus.denied) {
//     print('Location permission denied');
//     print('Requesting location permission...');
//     _permissionStatus = await _location.requestPermission();
//     if (_permissionStatus != PermissionStatus.granted) {
//       print('Location permission denied');
//       return;
//     }
//   }
//   print('Location permission granted');
// }

// Future<LocationData> getLocation() async {
//   print('Loading location data...');
//   LocationData _locationData = await Location().getLocation();
//   print('Location data loaded');
//   return _locationData;
// }
