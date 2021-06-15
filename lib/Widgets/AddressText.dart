import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

/// Simply display address from location given, can directly call
/// [placemarkFromCoordinates] to get result
class AddressText extends StatelessWidget {
  const AddressText(
      {Key? key,
      required this.latitude,
      required this.longitude,
      this.loadingText = 'Loading address...'})
      : super(key: key);
  final double latitude;
  final double longitude;

  /// Text when loading
  final String loadingText;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: placemarkFromCoordinates(latitude, longitude),
      builder: (context, AsyncSnapshot<List<Placemark>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Text('${snapshot.data?.first.toJson()}');
        } else {
          return Text('$loadingText');
        }
      },
    );
  }
}
