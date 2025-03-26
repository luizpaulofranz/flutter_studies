import 'package:countries_app/core/request_result.dart';
import 'package:countries_app/core/shared/data/model/country_model.dart';
import 'package:countries_app/core/shared/domain/entity/country.dart';
import 'package:countries_app/core/shared/domain/repository/country_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'countries_events.dart';
part 'countries_states.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  final CountryRepo _countryRepo;

  CountriesBloc(this._countryRepo) : super(CountriesInitial()) {
    on<GetCountries>((event, emit) async {
      emit(CountriesLoading());
      final result = await _countryRepo.getCountries();

      switch (result) {
        case Success<List<CountryModel>>():
          emit(CountriesLoaded(countries: result.data));
        case Error<List<CountryModel>>():
          emit(CountriesError(errorMessage: result.message));
      }
    });
  }
}
