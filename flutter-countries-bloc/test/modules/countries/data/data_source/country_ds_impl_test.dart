import 'package:countries_app/core/shared/data/data_source/country_ds_impl.dart';
import 'package:countries_app/core/shared/data/model/country_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../test_data.dart';

class DioMock extends Mock implements Dio {}

void main() {
  late DioMock apiClient;
  late CountryDsImpl dataSource;
  setUpAll(() {
    apiClient = DioMock();
    dataSource = CountryDsImpl(apiClient: apiClient);
  });
  test("Test Get All Countries Request", () async {
    // Arrange
    when(() => apiClient.get(any())).thenAnswer(
      (_) async => Response(
        data: allCountriesData,
        requestOptions:
            RequestOptions(path: "https://restcountries.com/v3.1/all"),
        statusCode: 200,
      ),
    );

    final expected = [
      CountryModel(
        name: "South Georgia",
        capital: "King Edward Point",
        flag: "https://flagcdn.com/gs.svg",
        population: 30,
        region: "Antarctic",
      ),
      CountryModel(
        name: "Grenada",
        capital: "St. George's",
        flag: "https://flagcdn.com/gd.svg",
        population: 112519,
        region: "Americas",
      ),
    ];

    // Act
    final result = await dataSource.getCountries();
    // Assert
    expect(expected, equals(result));
    verify(() => apiClient.get('https://restcountries.com/v3.1/all')).called(1);
  });
}
