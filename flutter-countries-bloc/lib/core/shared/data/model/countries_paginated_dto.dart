import 'package:countries_app/core/pagination/pagination_dto.dart';
import 'package:countries_app/core/pagination/sort_dto.dart';

class CountriesPaginatedDto {
  final PaginationDto pagination;
  final SortDto sort;

  CountriesPaginatedDto({required this.pagination, required this.sort});

  Map<String, dynamic> toJson() {
    return {...pagination.toJson(), ...sort.toJson()};
  }
}
