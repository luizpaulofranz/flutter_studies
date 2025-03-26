part of 'country_bloc.dart';

sealed class CountryState {}

class CountryInitial extends CountryState {}

class CountryLoading extends CountryState {}

class CountryLoaded extends CountryState {
  final CountryModel country;
  CountryLoaded({required this.country});
}

class CountryError extends CountryState {
  final String errorMessage;
  CountryError({required this.errorMessage});
}
