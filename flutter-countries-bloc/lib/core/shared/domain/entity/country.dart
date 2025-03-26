import 'package:equatable/equatable.dart';

class Country extends Equatable {
  final String name;
  final String capital;
  final String region;
  final int population;
  final String flag;

  const Country({
    required this.name,
    required this.capital,
    required this.region,
    required this.population,
    required this.flag,
  });

  @override
  List<Object?> get props => [name, capital, region, population, flag];
}
