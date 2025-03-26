import 'package:auto_route/auto_route.dart';
import 'package:countries_app/core/shared/domain/entity/country.dart';
import 'package:countries_app/dependency_injection.dart';
import 'package:countries_app/modules/countries/presentation/cubits/countries_cubit.dart';
import 'package:countries_app/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class CountriesCubitScreen extends StatelessWidget {
  const CountriesCubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countries - Cubit'),
      ),
      body: BlocBuilder<CountriesCubit, List<Country>>(
        // this is how we automatically call a cubit method
        bloc: CountriesCubit(locator())..getCountries(),
        builder: (context, countries) {
          if (countries.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return GridView.count(
            crossAxisCount: 2,
            children: countries.map(
              (country) {
                return GestureDetector(
                  onTap: () {
                    // this is to push a named route, no params accepted
                    // context.router.pushPath(Routes.country);
                    // to push and pass a param, we need to use the nenerated route class
                    context.router.push(
                      CountryCubitRoute(countryName: country.name),
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
