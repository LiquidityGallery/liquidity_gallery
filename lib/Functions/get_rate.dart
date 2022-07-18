import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Class.dart';

/// A Calculator.
class Forex {
  late Map<String, dynamic> _rates;

  Future<void> _fetchCurrencies() async {
    Uri baseUri = Uri.parse('http://www.convertmymoney.com/rates.json');
    final response = await http.get(baseUri);
    Map<String, dynamic> jsonResponse =
        json.decode(response.body) as Map<String, dynamic>;
    _rates = jsonResponse.remove("rates") as Map<String, dynamic>;
  }

  /// converts amount from one currency into another using current forex prices.
  Future<double> getCurrencyConverted(String sourceCurrency,
      String destinationCurrency, double sourceAmount) async {
    await _fetchCurrencies();
    List<String> availableCurrencies = await getAvailableCurrencies();
    if (!availableCurrencies.contains(sourceCurrency)) {
      throw Exception(
          "Source Currency provided is invalid. Please Use ISO-4217 currency codes only.");
    }
    if (!availableCurrencies.contains(destinationCurrency)) {
      throw Exception(
          "Destination Currency provided is invalid. Please Use ISO-4217 currency codes only.");
    }

    final totalDollarsOfSourceCurrency = sourceAmount / _rates[sourceCurrency];
    final totalDestinationCurrency =
        totalDollarsOfSourceCurrency * _rates[destinationCurrency];
    return totalDestinationCurrency;
  }

  /// returns a Map containing prices of all currencies with their currency_code as key.
  Future<Map<String, double>> getAllCurrenciesPrices() async {
    await _fetchCurrencies();
    Map<String, double> result = <String, double>{};
    for (var element in _rates.keys) {
      result[element] = double.parse(_rates[element].toString());
    }
    return result;
  }

  /// returns a list of all supported currencies.
  Future<List<String>> getAvailableCurrencies() async {
    if (_rates == null) {
      await _fetchCurrencies();
    }
    return _rates.keys.toList();
  }
}

const key = '03ab98ff1731468b917a';

Future<num> getRateWeb(http.Client client, Currency from, Currency to) async {
  final response = await client.get(
    Uri.parse(
        'https://free.currconv.com/api/v7/convert?q=${from.name}_${to.name}&compact=ultra&apiKey=$key'),
  );
  return parse(response.body);
}

num parse(String responseBody) {
  final parsed = jsonDecode(responseBody) as Map<String, dynamic>;
  if (parsed.isEmpty) {
    throw 'Given currency not found.';
  } else {
    return parsed.values.first;
  }
}

Future<num> getRate(Currency from, Currency to, {double? amount}) async {
  final url = Uri.parse(
      'https://api.exchangerate.host/convert?from=${from.name}&to=${to.name}${amount != null ? '&amount=$amount' : ''}');

  final response = await http.get(url);

  final data = jsonDecode(response.body);

  final rate = data['result'];

  return rate;
}
