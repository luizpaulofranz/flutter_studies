import 'package:auto_route/auto_route.dart';
import 'package:countries_app/dependency_injection.dart';
import 'package:countries_app/modules/countries/presentation/blocs/country/country_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class CountryBlocScreen extends StatelessWidget {
  final String countryName;
  const CountryBlocScreen({super.key, required this.countryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country - Bloc - $countryName'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<CountryBloc, CountryState>(
            // this is how we automatically send an event
            bloc: CountryBloc(locator())..add(GetCountryByName(countryName)),
            builder: (context, state) {
              if (state is CountryInitial || state is CountryLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is CountryError) {
                return Center(child: Text(state.errorMessage));
              }

              state as CountryLoaded;

              return Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Name: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(state.country.name),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Capital: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(state.country.capital),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Region: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(state.country.region),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Population: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(state.country.population.toString()),
                    ],
                  ),
                  SvgPicture.network(state.country.flag),
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
