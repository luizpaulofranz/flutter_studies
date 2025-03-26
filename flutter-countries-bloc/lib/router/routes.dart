abstract class Routes {
  static const countriesBloc = '/countries-bloc';
  static const countriesCubit = '/countries-cubit';
  static const countryBloc = '/country-bloc';
  static const countryCubit = '/country-cubit';
  static const countriesPagination = '/countries-pagination';
  static const multiLoading1 = '/multi-loading-1';
  static const multiLoading2 = '/multi-loading-2';

  static const dashboard = _NestedDashboard(_NestedSettings());
}

final class _NestedDashboard {
  final _NestedSettings settings;

  final root = '/dashboard';

  final profile = 'profile';

  final notifications = 'notifications';

  const _NestedDashboard(this.settings);
}

final class _NestedSettings {
  final root = 'settings';

  final privacy = 'privacy-settings';
  final notifications = 'notifications-settings';

  const _NestedSettings();
}
