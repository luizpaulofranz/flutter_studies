import 'package:countries_app/core/pagination/sort_dto.dart';
import 'package:countries_app/core/shared/data/data_source/country_ds.dart';
import 'package:countries_app/core/shared/data/model/countries_paginated_dto.dart';
import 'package:countries_app/core/shared/data/model/country_model.dart';
import 'package:dio/dio.dart';

class CountryDsImpl extends CountryDataSource {
  final Dio apiClient;

  CountryDsImpl({required this.apiClient});

  List<CountryModel>? _allCountries;

  @override
  Future<List<CountryModel>> getCountries() async {
    final response = await apiClient.get('https://restcountries.com/v3.1/all');
    final dataList = response.data as List;
    // final dataList = dataList.
    // return dataList.map((c) => CountryModel.fromJson(c)).toList();
    return dataList
        .sublist(0, 45)
        .map((c) => CountryModel.fromJson(c))
        .toList();
  }

  @override
  Future<CountryModel?> getCountryByName(String name) async {
    final response =
        await apiClient.get('https://restcountries.com/v3.1/name/$name');

    return (CountryModel.fromJson(response.data.first));
  }

  @override
  Future<List<CountryModel>> getCountriesByPage(
    CountriesPaginatedDto pagination,
  ) async {
    if (_allCountries == null) {
      final response =
          await apiClient.get('https://restcountries.com/v3.1/all');
      final dataList = response.data as List;
      // final dataList = dataList.
      // return dataList.map((c) => CountryModel.fromJson(c)).toList();
      final items =
          dataList.sublist(0, 50).map((c) => CountryModel.fromJson(c)).toList();
      items.sort(
        (a, b) {
          if (pagination.sort.order == SortOrder.asc) {
            return a.name.compareTo(b.name);
          } else {
            return b.name.compareTo(a.name);
          }
        },
      );
      _allCountries = items;
    }

    if (pagination.pagination.skip + pagination.pagination.limit >
        _allCountries!.length) {
      return [];
    }

    final result = _allCountries!.sublist(
      pagination.pagination.skip,
      pagination.pagination.skip + pagination.pagination.limit,
    );

    return result;
    // .toList();
  }
}
