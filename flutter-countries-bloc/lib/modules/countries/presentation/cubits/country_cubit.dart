import 'package:countries_app/core/request_result.dart';
import 'package:countries_app/core/shared/data/model/country_model.dart';
import 'package:countries_app/core/shared/domain/entity/country.dart';
import 'package:countries_app/core/shared/domain/repository/country_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryCubit extends Cubit<Country?> {
  final CountryRepo _countryRepo;

  CountryCubit(this._countryRepo) : super(null);

  Future<Country?> getCountryByName(String name) async {
    final result = await _countryRepo.getCountryByName(name);
    switch (result) {
      case Success<CountryModel> success:
        emit(success.data);
        return success.data;
      case Error error:
        // Show a toast, call logs
        print(error);
        emit(null);
        return null;
    }
  }
}
