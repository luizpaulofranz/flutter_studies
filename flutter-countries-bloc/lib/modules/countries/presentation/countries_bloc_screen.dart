import 'package:auto_route/auto_route.dart';
import 'package:countries_app/dependency_injection.dart';
import 'package:countries_app/modules/countries/presentation/blocs/countries/countries_bloc.dart';
import 'package:countries_app/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class CountriesBlocScreen extends StatelessWidget {
  const CountriesBlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countries - Bloc'),
      ),
      body: BlocBuilder<CountriesBloc, CountriesState>(
        // this is how we automatically send an event
        bloc: CountriesBloc(locator())..add(GetCountries()),
        builder: (context, state) {
          if (state is CountriesLoading || state is CountriesInitial) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CountriesError) {
            return Center(child: Text(state.errorMessage));
          }

          state as CountriesLoaded;

          return GridView.count(
            crossAxisCount: 2,
            children: state.countries.map(
              (country) {
                return GestureDetector(
                  onTap: () {
                    // this is to push a named route, no params accepted
                    // context.router.pushPath(Routes.country);
                    // to push and pass a param, we need to use the nenerated route class
                    context.router.push(
                      CountryBlocRoute(countryName: country.name),
                    );
                  },
                  child: Card(
                    child: Column(children: [
                      Text(country.name),
                      SizedBox(
                        height: 150,
                        child: SvgPicture.network(country.flag),
                      ),
                    ]),
                  ),
                );
              },
            ).toList(),
          );
        },
      ),
    );
  }
}
