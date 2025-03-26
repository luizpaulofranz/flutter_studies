import 'package:countries_app/core/shared/data/model/country_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_data.dart';

void main() {
  final input = singleCountryData;
  test('Test fromJson method', () {
    // Arrange
    final expected = CountryModel(
      name: "France",
      capital: "Paris",
      flag: "https://flagcdn.com/fr.svg",
      population: 67391582,
      region: "Europe",
    );
    // Act
    final result = CountryModel.fromJson(input);
    // Asset
    expect(expected, equals(result));
  });
}
