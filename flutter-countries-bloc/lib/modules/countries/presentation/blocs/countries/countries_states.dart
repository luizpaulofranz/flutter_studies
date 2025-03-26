part of 'countries_bloc.dart';

sealed class CountriesState {}

class CountriesInitial extends CountriesState {}

class CountriesLoading extends CountriesState {}

class CountriesLoaded extends CountriesState {
  final List<Country> countries;
  CountriesLoaded({required this.countries});
}

class CountriesError extends CountriesState {
  final String errorMessage;
  CountriesError({required this.errorMessage});
}
