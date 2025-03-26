import 'package:countries_app/core/pagination/pagination.dart';
import 'package:countries_app/core/pagination/pagination_dto.dart';
import 'package:countries_app/core/pagination/sort_dto.dart';
import 'package:countries_app/core/request_result.dart';
import 'package:countries_app/core/shared/data/model/countries_paginated_dto.dart';
import 'package:countries_app/core/shared/domain/entity/country.dart';
import 'package:countries_app/core/shared/domain/repository/country_repo.dart';

class CountriesPaginationCubit extends PaginatedListCubit<Country, void> {
  CountriesPaginationCubit({required CountryRepo countryRepo})
      : super(
          onFetch: (p) async {
            final result = await countryRepo.getCountriesByPage(
              CountriesPaginatedDto(
                pagination: PaginationDto(p.limit, p.skip),
                sort: SortDto(SortOrder.asc, 'name'),
              ),
            );
            switch (result) {
              case Success<List<Country>> success:
                return success.data;
              case Error<List<Country>> error:
                // log error, show toast
                print(error);
                return [];
            }
          },
          limit: 10,
        );
}
