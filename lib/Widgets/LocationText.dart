import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

/// Simply display location from address given, can directly call
/// [locationFromAddress] to get result
class LocationText extends StatelessWidget {
  const LocationText(
      {Key? key,
      required this.address,
      this.textStyle,
      this.loadingText = 'Loading location...'})
      : super(key: key);
  final String address;
  final TextStyle? textStyle;
  final String loadingText;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return const Text('Current not supported for web');
    } else {
      return FutureBuilder(
        future: locationFromAddress(address),
        builder: (context, AsyncSnapshot<List<Location>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final data = snapshot.data!.first;
            return Text(
              'Latitude: ${data.latitude}, Longitude: ${data.longitude}',
              style: textStyle,
            );
          } else {
            return Text(
              loadingText,
              style: textStyle,
            );
          }
        },
      );
    }
  }
}
