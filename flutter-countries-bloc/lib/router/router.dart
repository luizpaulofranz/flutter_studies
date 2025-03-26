import 'package:auto_route/auto_route.dart';
import 'package:countries_app/router/routes.dart';

import 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          path: '/',
          initial: true,
        ),
        AutoRoute(
          page: CountriesBlocRoute.page,
          path: Routes.countriesBloc,
          // initial: true,
        ),
        AutoRoute(
          page: CountriesCubitRoute.page,
          path: Routes.countriesCubit,
          // initial: true,
        ),
        AutoRoute(page: CountryBlocRoute.page, path: Routes.countryBloc),
        AutoRoute(page: CountryCubitRoute.page, path: Routes.countryCubit),
        AutoRoute(
          page: CountriesPaginationRoute.page,
          path: Routes.countriesPagination,
        ),
        AutoRoute(page: MultiLoadersRoute1.page, path: Routes.multiLoading1),
        AutoRoute(page: MultiLoadersRoute2.page, path: Routes.multiLoading2),
        // Nested Routes
        AutoRoute(
          page: DashboardNestedWrapperRoute.page,
          path: Routes.dashboard.root,
          children: [
            AutoRoute(
              page: DashboardRoute.page,
              path: '',
              initial: true,
            ),
            AutoRoute(
              page: ProfileRoute.page,
              path: '${Routes.dashboard.profile}/:pathParam',
            ),
            AutoRoute(
              page: NotificationsRoute.page,
              path: Routes.dashboard.notifications,
            ),
            AutoRoute(
              page: SettingsNestedWrapperRoute.page,
              // When we declare a path param on a host route, the param is available for all child routes
              // look at the NotificationSettingsScreen
              path: '${Routes.dashboard.settings.root}/:pathParam',
              children: [
                AutoRoute(
                  page: SettingsRoute.page,
                  path: '',
                  initial: true,
                ),
                AutoRoute(
                  // here we are passing complex params, like callbacks
                  page: PrivacySettingsRoute.page,
                  path: Routes.dashboard.settings.privacy,
                ),
                AutoRoute(
                  page: NotificationSettingsRoute.page,
                  path: Routes.dashboard.settings.notifications,
                ),
              ],
            ),
          ],
        ),
      ];
}
