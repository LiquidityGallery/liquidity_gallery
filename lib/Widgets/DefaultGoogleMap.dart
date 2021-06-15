import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DefaultGoogleMap extends StatelessWidget {
  const DefaultGoogleMap(
      {Key? key, required this.latitude, required this.longitude})
      : super(key: key);

  final double latitude;
  final double longitude;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        zoom: 15,
        target: LatLng(latitude, longitude),
      ),
      markers: [
        Marker(markerId: MarkerId('1'), position: LatLng(latitude, longitude))
      ].toSet(),
    );
  }
}
