import 'package:countries_app/core/request_result.dart';
import 'package:countries_app/core/shared/data/model/countries_paginated_dto.dart';
import 'package:countries_app/core/shared/data/model/country_model.dart';

abstract class CountryRepo {
  Future<RequestResult<List<CountryModel>>> getCountries();
  Future<RequestResult<CountryModel>> getCountryByName(String name);
  Future<RequestResult<List<CountryModel>>> getCountriesByPage(
    CountriesPaginatedDto pagination,
  );
}
