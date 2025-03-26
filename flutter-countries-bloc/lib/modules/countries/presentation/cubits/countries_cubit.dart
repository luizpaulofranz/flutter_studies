import 'package:countries_app/core/request_result.dart';
import 'package:countries_app/core/shared/data/model/country_model.dart';
import 'package:countries_app/core/shared/domain/entity/country.dart';
import 'package:countries_app/core/shared/domain/repository/country_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountriesCubit extends Cubit<List<Country>> {
  final CountryRepo _countryRepo;

  CountriesCubit(this._countryRepo) : super([]);

  Future<List<Country>> getCountries() async {
    final result = await _countryRepo.getCountries();
    switch (result) {
      case Success<List<CountryModel>> success:
        emit(success.data);
        return success.data;
      case Error error:
        // Show a toast, call logs
        print(error);
        emit([]);
        return [];
    }
  }
}
