import 'package:dio/dio.dart';

import '../Class.dart';

const _appId = 'dc871ed0a64a4214ad53eaccc9980b6b';

final symbols = Currency.values.map((e) => e.name).join(',');

Future<num> getRate(Currency from, Currency to, {double? amount}) async {
  const url = 'https://openexchangerates.org/api/latest.json';

  final queryParameters = {'app_id': _appId, 'symbols': symbols};

  final response = await Dio().get(url, queryParameters: queryParameters);

  final data = response.data;

  final rates = data['rates'];

  final fromRate = 1 / rates[from.name];

  final toRate = rates[to.name] * fromRate;

  if (amount != null) return amount * toRate;

  return toRate;
}
