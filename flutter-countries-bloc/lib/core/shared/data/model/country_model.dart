import 'package:countries_app/core/shared/domain/entity/country.dart';

class CountryModel extends Country {
  const CountryModel({
    required super.name,
    required super.capital,
    required super.region,
    required super.population,
    required super.flag,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name']?['common'] ?? "",
      capital: json['capital']?[0] ?? "",
      region: json['region'] ?? "",
      population: json['population'] ?? "",
      flag: json['flags']?['svg'] ?? "",
    );
  }
}
