import 'package:auto_route/auto_route.dart';
import 'package:countries_app/core/pagination/pagination.dart';
import 'package:countries_app/core/shared/domain/entity/country.dart';
import 'package:countries_app/dependency_injection.dart';
import 'package:countries_app/modules/paginated/cubit/countries_pagination_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CountriesPaginationPage extends StatelessWidget {
  const CountriesPaginationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countries - Pagination'),
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (context) =>
              CountriesPaginationCubit(countryRepo: locator())..refetch(null),
          child: BlocBuilder<CountriesPaginationCubit,
              PaginatedListState<Country>>(
            builder: (context, state) {
              if (state.isInited && state.items.isNotEmpty) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.items.length,
                        itemBuilder: (context, index) {
                          final country = state.items[index];
                          return ListTile(
                            leading: Text(
                              country.name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: Text(country.capital),
                          );
                        },
                      ),
                    ),
                    if (state.isDone)
                      Center(child: Text('No more countries to List !'))
                    else
                      ElevatedButton(
                        child: const Text('Load more'),
                        onPressed: () =>
                            context.read<CountriesPaginationCubit>().next(null),
                      )
                  ],
                );
              }

              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => context.router.pop(),
                      child: Text('Back'),
                    ),
                    const CircularProgressIndicator(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
