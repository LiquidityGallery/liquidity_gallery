import 'package:location/location.dart';

/// Function to get current location
/// See usage on example [LocationInfoView.dart]
Future<void> checkLocationPermission() async {
  Location location = Location();

  print('Checking location service enable...');
  var serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    print('Location service disable');
    print('Requesting location service enable...');
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      print('Location service request denied');
      return;
    }
  }
  print('Location service enabled');

  print('Checking location permission...');
  var permissionStatus = await location.hasPermission();
  if (permissionStatus == PermissionStatus.denied) {
    print('Location permission denied');
    print('Requesting location permission...');
    permissionStatus = await location.requestPermission();
    if (permissionStatus != PermissionStatus.granted) {
      print('Location permission denied');
      return;
    }
  }
  print('Location permission granted');
}

Future<LocationData> getLocation() async {
  print('Loading location data...');
  LocationData locationData = await Location().getLocation();
  print('Location data loaded');
  return locationData;
}
