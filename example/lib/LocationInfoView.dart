import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInfoView extends StatefulWidget {
  @override
  _LocationViewState createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationInfoView> {
  Location _location = new Location();

  bool _serviceEnabled = false;
  PermissionStatus _permissionStatus = PermissionStatus.denied;
  LocationData? _locationData;

  Future<void> _checkLocationPermission() async {
    print('Checking location service enable...');
    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      print('Location service disable');
      print('Requesting location service enable...');
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        print('Location service request denied');
        return;
      }
    }
    print('Location service enabled');

    print('Checking location permission...');
    _permissionStatus = await _location.hasPermission();
    if (_permissionStatus == PermissionStatus.denied) {
      print('Location permission denied');
      print('Requesting location permission...');
      _permissionStatus = await _location.requestPermission();
      if (_permissionStatus != PermissionStatus.granted) {
        print('Location permission denied');
        return;
      }
    }
    print('Location permission granted');

    print('Loading location data...');
    _locationData = await _location.getLocation();
    print('Location data loaded');
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location information'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Text('Service enabled'),
            title: Text('$_serviceEnabled'),
          ),
          ListTile(
            leading: Text('Permission granted'),
            title: Text('${_permissionStatus == PermissionStatus.granted}'),
          ),
          ListTile(
            leading: Text('Permission status'),
            title: Text('${describeEnum(_permissionStatus)}'),
          ),
          _locationData != null ? _locationDataField() : Container()
        ],
      ),
    );
  }

  Widget _locationDataField() {
    return Column(
      children: [
        ListTile(
          leading: Text('latitude'),
          title: Text('${_locationData!.latitude}'),
        ),
        ListTile(
          leading: Text('longitude'),
          title: Text('${_locationData!.longitude}'),
        ),
        ListTile(
          leading: Text('accuracy'),
          title: Text('${_locationData!.accuracy}'),
        ),
        ListTile(
          leading: Text('altitude'),
          title: Text('${_locationData!.altitude}'),
        ),
        ListTile(
          leading: Text('speed'),
          title: Text('${_locationData!.speed}'),
        ),
        ListTile(
          leading: Text('speed accuracy'),
          title: Text('${_locationData!.speedAccuracy}'),
        ),
        ListTile(
          leading: Text('heading'),
          title: Text('${_locationData!.heading}'),
        ),
        ListTile(
          leading: Text('heading accuracy'),
          title: Text('${_locationData!.headingAccuracy}'),
        ),
        ListTile(
          leading: Text('time'),
          title: Text('${_locationData!.time}'),
        ),
        ListTile(
          leading: Text('is mock?'),
          title: Text('${_locationData!.isMock}'),
        )
      ],
    );
  }
}
