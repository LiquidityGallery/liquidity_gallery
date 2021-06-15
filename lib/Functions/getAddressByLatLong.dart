import 'dart:convert';
import 'package:http/http.dart' as http;

Future getAddressFromLatLng(context, double lat, double lng) async {
  final mapApiKey = 'AIzaSyC1CXvh7Lkkem5MNP4TeB_xMNSCVx-ViHo';
  String _host = 'https://maps.google.com/maps/api/geocode/json';
  final url = '$_host?key=$mapApiKey&language=en&latlng=$lat,$lng';
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    Map data = jsonDecode(response.body);
    String _formattedAddress = data["results"][0]["formatted_address"];
    print("response ==== $_formattedAddress");
    return _formattedAddress;
  } else
    return null;
}