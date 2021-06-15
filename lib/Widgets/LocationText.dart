import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

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
    return FutureBuilder(
      future: locationFromAddress(address),
      builder: (context, AsyncSnapshot<List<Location>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final _data = snapshot.data!.first;
          return Text(
            'Latitude: ${_data.latitude}, Longitude: ${_data.longitude}',
            style: textStyle,
          );
        } else {
          return Text(
            '$loadingText',
            style: textStyle,
          );
        }
      },
    );
  }
}
