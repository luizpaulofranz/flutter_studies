import 'package:auto_route/auto_route.dart';
import 'package:countries_app/router/router.gr.dart';
import 'package:countries_app/router/routes.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.router.pushPath(Routes.countriesBloc),
              child: Text("Countries Bloc"),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () => context.router.pushPath(Routes.countriesCubit),
              child: Text("Countries Cubit"),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () =>
                  context.router.pushPath(Routes.countriesPagination),
              child: Text("Countries Pagination"),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () => context.router.pushPath(Routes.multiLoading1),
              child: Text("Multi Loadings 1"),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () => context.router.pushPath(Routes.multiLoading2),
              child: Text("Multi Loadings 2"),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () => context.router.push(DashboardRoute()),
              child: Text("Nested Routes"),
            ),
          ],
        ),
      ),
    );
  }
}
