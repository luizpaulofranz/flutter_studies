import 'package:countries_app/core/request_result.dart';
import 'package:countries_app/core/shared/data/model/countries_paginated_dto.dart';
import 'package:countries_app/core/shared/domain/entity/country.dart';
import 'package:countries_app/core/shared/domain/repository/country_repo.dart';

class GetCountriesByPage {
  final CountryRepo _countryRepo;

  GetCountriesByPage(this._countryRepo);

  Future<RequestResult<List<Country>>> execute(CountriesPaginatedDto params) =>
      _countryRepo.getCountriesByPage(params);
}
