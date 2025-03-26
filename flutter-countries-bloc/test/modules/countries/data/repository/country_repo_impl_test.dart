import 'package:countries_app/core/request_result.dart';
import 'package:countries_app/core/shared/data/data_source/country_ds.dart';
import 'package:countries_app/core/shared/data/model/country_model.dart';
import 'package:countries_app/core/shared/data/repository/country_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCountryDs extends Mock implements CountryDataSource {}

void main() {
  late CountryRepoImpl repo;
  late MockCountryDs mockCountryDs;

  setUpAll(() {
    mockCountryDs = MockCountryDs();
    repo = CountryRepoImpl(mockCountryDs);
  });

  test('Test get all countries', () async {
    // Arrange
    when(() => mockCountryDs.getCountries()).thenAnswer(
      (_) async => [
        CountryModel(
          name: "France",
          capital: "Paris",
          flag: "https://flagcdn.com/fr.svg",
          population: 67391582,
          region: "Europe",
        ),
        CountryModel(
          name: "Brasil",
          capital: "Brasilia",
          flag: "https://flagcdn.com/fr.svg",
          population: 777,
          region: "America",
        ),
      ],
    );
    final expected = Success<List<CountryModel>>([
      CountryModel(
        name: "France",
        capital: "Paris",
        flag: "https://flagcdn.com/fr.svg",
        population: 67391582,
        region: "Europe",
      ),
      CountryModel(
        name: "Brasil",
        capital: "Brasilia",
        flag: "https://flagcdn.com/fr.svg",
        population: 777,
        region: "America",
      ),
    ]);
    // Act
    final result = await repo.getCountries();
    // Asset
    expect(expected, equals(result));
  });
}
