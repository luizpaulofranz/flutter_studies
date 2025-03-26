import 'package:auto_route/auto_route.dart';
import 'package:countries_app/core/shared/domain/entity/country.dart';
import 'package:countries_app/dependency_injection.dart';
import 'package:countries_app/modules/countries/presentation/cubits/country_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class CountryCubitScreen extends StatelessWidget {
  final String countryName;
  const CountryCubitScreen({super.key, required this.countryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country - Cubit - $countryName'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<CountryCubit, Country?>(
            bloc: CountryCubit(locator())..getCountryByName(countryName),
            builder: (context, country) {
              if (country == null) {
                return const Center(child: CircularProgressIndicator());
              }

              return Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Name: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(country.name),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Capital: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(country.capital),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Region: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(country.region),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Population: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(country.population.toString()),
                    ],
                  ),
                  SvgPicture.network(country.flag),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () => context.router.pop(),
                    child: Text('Back'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
