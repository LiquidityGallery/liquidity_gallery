import 'package:flutter/material.dart';
import 'package:liquidity_gallery/Widgets/LocationText.dart';
import 'package:liquidity_gallery/liquidity_gallery.dart';
import 'package:location/location.dart';

class LocationView extends StatefulWidget {
  @override
  _LocationViewState createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  LocationData? _locationData;

  @override
  void initState() {
    super.initState();

    /// Get permission for using location, usually put in the start of the app
    // checkLocationPermission();

    /// Get location
    getLocation().then((value) {
      setState(() {
        _locationData = value;
      });
    }).timeout(Duration(seconds: 10), onTimeout: () {
      /// Display a message when loaded for 10 seconds
      showMessage(context, 'Location loaded timeout, please re-try');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
      ),
      body: _locationData == null
          ? Center(child: CircularProgressIndicator.adaptive())
          : _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        ListTile(
          title: Text('latitude'),
          subtitle: Text('${_locationData!.latitude}'),
        ),
        ListTile(
          title: Text('longitude'),
          subtitle: Text('${_locationData!.longitude}'),
        ),
        ListTile(
          title: Text('Location to Address'),
          subtitle: AddressText(
            latitude: _locationData!.latitude ?? 0,
            longitude: _locationData!.longitude ?? 0,
          ),
        ),
        // ListTile(
        //   title: Text('Address to Location'),
        //   subtitle: LocationText(
        //     address: '88 Kwok Shui Road',
        //   ),
        // ),
        Center(

        ),
        Expanded(
            child: DefaultGoogleMap(
          longitude: _locationData!.longitude ?? 0,
          latitude: _locationData!.latitude ?? 0,
        )),
      ],
    );
  }
}
