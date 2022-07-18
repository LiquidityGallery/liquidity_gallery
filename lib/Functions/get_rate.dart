import 'package:http/http.dart' as http;
import 'dart:convert' show jsonDecode;

import '../Class.dart';

const key = '03ab98ff1731468b917a';

Future<num> getRate(Currency from, Currency to, {double? amount}) async {
  final url = Uri.parse(
      'https://api.exchangerate.host/convert?from=${from.name}&to=${to.name}${amount != null ? '&amount=$amount' : ''}');

  final response = await http.get(url);

  final data = jsonDecode(response.body);

  final rate = data['result'];

  return rate;
}
