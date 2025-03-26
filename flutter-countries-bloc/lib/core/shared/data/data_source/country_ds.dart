import 'package:countries_app/core/shared/data/model/countries_paginated_dto.dart';
import 'package:countries_app/core/shared/data/model/country_model.dart';

abstract class CountryDataSource {
  Future<List<CountryModel>> getCountries();
  Future<CountryModel?> getCountryByName(String name);
  Future<List<CountryModel>> getCountriesByPage(
    CountriesPaginatedDto pagination,
  );
}
