import '../resources/countries_en.dart';
import '../resources/countries_zh.dart';

enum Language {
  zh,
  en,
}

String? translateCountries(
    {Language from = Language.en,
    Language to = Language.zh,
    required String country}) {
  final fromData = findCountry(from, country);
  if (fromData != null) {
    final toData = findCountry(to, (fromData['id'] as int).toString());
    if (toData != null) {
      return toData['name'] as String;
    }
  }
  return null;
}

Map<String, Object>? findCountry(Language language, String country) {
  switch (language) {
    case Language.en:
      final result = countriesEn.where((data) {
        final id = data['id'] as int;
        final alpha2 = data['alpha2'] as String;
        final alpha3 = data['alpha3'] as String;
        final name = data['name'] as String;

        return getString(country) == id.toString() ||
            getString(country) == getString(alpha3) ||
            getString(country) == getString(alpha2) ||
            getString(country) == getString(name);
      });
      if (result.isNotEmpty) {
        return result.first;
      } else {
        return null;
      }
    case Language.zh:
      final result = countiesZh.where((data) {
        final id = data['id'] as int;
        final alpha2 = data['alpha2'] as String;
        final alpha3 = data['alpha3'] as String;
        final name = data['name'] as String;

        return getString(country) == id.toString() ||
            getString(country) == getString(alpha3) ||
            getString(country) == getString(alpha2) ||
            getString(country) == getString(name);
      });
      if (result.isNotEmpty) {
        return result.first;
      } else {
        return null;
      }
  }
}

String getString(String input) {
  final result = input.replaceAll(' ', '').toLowerCase();
  return result;
}
