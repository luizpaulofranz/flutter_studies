part of 'country_bloc.dart';

sealed class CountryEvent {}

final class GetCountryByNameLoading extends CountryEvent {}

final class GetCountryByName extends CountryEvent {
  final String name;
  GetCountryByName(this.name);
}

final class GetCountryByNameSuccess extends CountryEvent {
  final CountryModel country;
  GetCountryByNameSuccess(this.country);
}

final class GetCountryByNameFail extends CountryEvent {
  final String message;
  GetCountryByNameFail([this.message = "Something went wrong"]);
}
