import 'package:countries_app/core/request_result.dart';
import 'package:countries_app/core/shared/data/model/country_model.dart';
import 'package:countries_app/core/shared/domain/entity/country.dart';
import 'package:countries_app/core/shared/domain/repository/country_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'country_events.dart';
part 'country_states.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final CountryRepo _countryRepo;

  CountryBloc(this._countryRepo) : super(CountryInitial()) {
    on<GetCountryByName>((event, emit) async {
      emit(CountryLoading());
      final result = await _countryRepo.getCountryByName(event.name);
      switch (result) {
        case Success<CountryModel>():
          emit(CountryLoaded(country: result.data));
        case Error<CountryModel>():
          emit(CountryError(errorMessage: result.message));
      }
    });
    on<GetCountryByNameLoading>((event, emit) => emit(CountryLoading()));
    on<GetCountryByNameSuccess>(
      (event, emit) => emit(CountryLoaded(country: event.country)),
    );
    on<GetCountryByNameFail>(
      (event, emit) => emit(CountryError(errorMessage: event.message)),
      // transformer: ,
    );
  }

  @override
  onChange(Change<CountryState> change) {
    super.onChange(change);
    print('State Change: $change');
  }

  @override
  onTransition(Transition<CountryEvent, CountryState> transition) {
    super.onTransition(transition);
    print('Transition: $transition');
  }

  Future<Country?> getCountryByName(String name) async {
    add(GetCountryByNameLoading());
    final result = await _countryRepo.getCountryByName(name);
    switch (result) {
      case Success<CountryModel> success:
        add(GetCountryByNameSuccess(success.data));
        return success.data;
      case Error<CountryModel> error:
        // Show a toast, call logs
        print(error);
        add(GetCountryByNameFail(error.message));
        return null;
    }
  }
}
