// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i17;
import 'package:countries_app/home_screen.dart' as _i8;
import 'package:countries_app/modules/countries/presentation/countries_bloc_screen.dart'
    as _i1;
import 'package:countries_app/modules/countries/presentation/countries_cubit_screen.dart'
    as _i2;
import 'package:countries_app/modules/countries/presentation/country_bloc_screen.dart'
    as _i4;
import 'package:countries_app/modules/countries/presentation/country_cubit_screen.dart'
    as _i5;
import 'package:countries_app/modules/loaders/multi_loaders_screen_1.dart'
    as _i9;
import 'package:countries_app/modules/loaders/multi_loaders_screen_2.dart'
    as _i10;
import 'package:countries_app/modules/nested_routes/dashboard/dashboard_screen.dart'
    as _i7;
import 'package:countries_app/modules/nested_routes/dashboard/notifications_screen.dart'
    as _i12;
import 'package:countries_app/modules/nested_routes/dashboard/profile_screen.dart'
    as _i14;
import 'package:countries_app/modules/nested_routes/dashboard/settings/pages/notification_settings_screen.dart'
    as _i11;
import 'package:countries_app/modules/nested_routes/dashboard/settings/pages/privacy_settings_screen.dart'
    as _i13;
import 'package:countries_app/modules/nested_routes/dashboard/settings/pages/settings_screen.dart'
    as _i16;
import 'package:countries_app/modules/nested_routes/dashboard/settings/settings_nested_wrapper_screen.dart'
    as _i15;
import 'package:countries_app/modules/nested_routes/dashboard_nested_wrapper_screen.dart'
    as _i6;
import 'package:countries_app/modules/paginated/presentationn/countries_pagination_page.dart'
    as _i3;
import 'package:flutter/material.dart' as _i18;

/// generated route for
/// [_i1.CountriesBlocScreen]
class CountriesBlocRoute extends _i17.PageRouteInfo<void> {
  const CountriesBlocRoute({List<_i17.PageRouteInfo>? children})
    : super(CountriesBlocRoute.name, initialChildren: children);

  static const String name = 'CountriesBlocRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i1.CountriesBlocScreen();
    },
  );
}

/// generated route for
/// [_i2.CountriesCubitScreen]
class CountriesCubitRoute extends _i17.PageRouteInfo<void> {
  const CountriesCubitRoute({List<_i17.PageRouteInfo>? children})
    : super(CountriesCubitRoute.name, initialChildren: children);

  static const String name = 'CountriesCubitRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i2.CountriesCubitScreen();
    },
  );
}

/// generated route for
/// [_i3.CountriesPaginationPage]
class CountriesPaginationRoute extends _i17.PageRouteInfo<void> {
  const CountriesPaginationRoute({List<_i17.PageRouteInfo>? children})
    : super(CountriesPaginationRoute.name, initialChildren: children);

  static const String name = 'CountriesPaginationRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i3.CountriesPaginationPage();
    },
  );
}

/// generated route for
/// [_i4.CountryBlocScreen]
class CountryBlocRoute extends _i17.PageRouteInfo<CountryBlocRouteArgs> {
  CountryBlocRoute({
    _i18.Key? key,
    required String countryName,
    List<_i17.PageRouteInfo>? children,
  }) : super(
         CountryBlocRoute.name,
         args: CountryBlocRouteArgs(key: key, countryName: countryName),
         initialChildren: children,
       );

  static const String name = 'CountryBlocRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CountryBlocRouteArgs>();
      return _i4.CountryBlocScreen(
        key: args.key,
        countryName: args.countryName,
      );
    },
  );
}

class CountryBlocRouteArgs {
  const CountryBlocRouteArgs({this.key, required this.countryName});

  final _i18.Key? key;

  final String countryName;

  @override
  String toString() {
    return 'CountryBlocRouteArgs{key: $key, countryName: $countryName}';
  }
}

/// generated route for
/// [_i5.CountryCubitScreen]
class CountryCubitRoute extends _i17.PageRouteInfo<CountryCubitRouteArgs> {
  CountryCubitRoute({
    _i18.Key? key,
    required String countryName,
    List<_i17.PageRouteInfo>? children,
  }) : super(
         CountryCubitRoute.name,
         args: CountryCubitRouteArgs(key: key, countryName: countryName),
         initialChildren: children,
       );

  static const String name = 'CountryCubitRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CountryCubitRouteArgs>();
      return _i5.CountryCubitScreen(
        key: args.key,
        countryName: args.countryName,
      );
    },
  );
}

class CountryCubitRouteArgs {
  const CountryCubitRouteArgs({this.key, required this.countryName});

  final _i18.Key? key;

  final String countryName;

  @override
  String toString() {
    return 'CountryCubitRouteArgs{key: $key, countryName: $countryName}';
  }
}

/// generated route for
/// [_i6.DashboardNestedWrapperScreen]
class DashboardNestedWrapperRoute extends _i17.PageRouteInfo<void> {
  const DashboardNestedWrapperRoute({List<_i17.PageRouteInfo>? children})
    : super(DashboardNestedWrapperRoute.name, initialChildren: children);

  static const String name = 'DashboardNestedWrapperRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i6.DashboardNestedWrapperScreen();
    },
  );
}

/// generated route for
/// [_i7.DashboardScreen]
class DashboardRoute extends _i17.PageRouteInfo<void> {
  const DashboardRoute({List<_i17.PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i7.DashboardScreen();
    },
  );
}

/// generated route for
/// [_i8.HomeScreen]
class HomeRoute extends _i17.PageRouteInfo<void> {
  const HomeRoute({List<_i17.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i8.HomeScreen();
    },
  );
}

/// generated route for
/// [_i9.MultiLoadersScreen1]
class MultiLoadersRoute1 extends _i17.PageRouteInfo<void> {
  const MultiLoadersRoute1({List<_i17.PageRouteInfo>? children})
    : super(MultiLoadersRoute1.name, initialChildren: children);

  static const String name = 'MultiLoadersRoute1';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i9.MultiLoadersScreen1();
    },
  );
}

/// generated route for
/// [_i10.MultiLoadersScreen2]
class MultiLoadersRoute2 extends _i17.PageRouteInfo<void> {
  const MultiLoadersRoute2({List<_i17.PageRouteInfo>? children})
    : super(MultiLoadersRoute2.name, initialChildren: children);

  static const String name = 'MultiLoadersRoute2';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i10.MultiLoadersScreen2();
    },
  );
}

/// generated route for
/// [_i11.NotificationSettingsScreen]
class NotificationSettingsRoute
    extends _i17.PageRouteInfo<NotificationSettingsRouteArgs> {
  NotificationSettingsRoute({_i18.Key? key, List<_i17.PageRouteInfo>? children})
    : super(
        NotificationSettingsRoute.name,
        args: NotificationSettingsRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'NotificationSettingsRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<NotificationSettingsRouteArgs>(
        orElse: () => NotificationSettingsRouteArgs(),
      );
      return _i11.NotificationSettingsScreen(
        key: args.key,
        paramFromParentRoute: pathParams.getString('pathParam'),
      );
    },
  );
}

class NotificationSettingsRouteArgs {
  const NotificationSettingsRouteArgs({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return 'NotificationSettingsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i12.NotificationsScreen]
class NotificationsRoute extends _i17.PageRouteInfo<NotificationsRouteArgs> {
  NotificationsRoute({
    _i18.Key? key,
    required _i12.NotificationParams params,
    List<_i17.PageRouteInfo>? children,
  }) : super(
         NotificationsRoute.name,
         args: NotificationsRouteArgs(key: key, params: params),
         initialChildren: children,
       );

  static const String name = 'NotificationsRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NotificationsRouteArgs>();
      return _i12.NotificationsScreen(key: args.key, params: args.params);
    },
  );
}

class NotificationsRouteArgs {
  const NotificationsRouteArgs({this.key, required this.params});

  final _i18.Key? key;

  final _i12.NotificationParams params;

  @override
  String toString() {
    return 'NotificationsRouteArgs{key: $key, params: $params}';
  }
}

/// generated route for
/// [_i13.PrivacySettingsScreen]
class PrivacySettingsRoute
    extends _i17.PageRouteInfo<PrivacySettingsRouteArgs> {
  PrivacySettingsRoute({
    _i18.Key? key,
    required _i18.VoidCallback action,
    List<_i17.PageRouteInfo>? children,
  }) : super(
         PrivacySettingsRoute.name,
         args: PrivacySettingsRouteArgs(key: key, action: action),
         initialChildren: children,
       );

  static const String name = 'PrivacySettingsRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PrivacySettingsRouteArgs>();
      return _i13.PrivacySettingsScreen(key: args.key, action: args.action);
    },
  );
}

class PrivacySettingsRouteArgs {
  const PrivacySettingsRouteArgs({this.key, required this.action});

  final _i18.Key? key;

  final _i18.VoidCallback action;

  @override
  String toString() {
    return 'PrivacySettingsRouteArgs{key: $key, action: $action}';
  }
}

/// generated route for
/// [_i14.ProfileScreen]
class ProfileRoute extends _i17.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    _i18.Key? key,
    required String param,
    List<_i17.PageRouteInfo>? children,
  }) : super(
         ProfileRoute.name,
         args: ProfileRouteArgs(key: key, param: param),
         rawPathParams: {'pathParam': param},
         initialChildren: children,
       );

  static const String name = 'ProfileRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ProfileRouteArgs>(
        orElse:
            () => ProfileRouteArgs(param: pathParams.getString('pathParam')),
      );
      return _i14.ProfileScreen(key: args.key, param: args.param);
    },
  );
}

class ProfileRouteArgs {
  const ProfileRouteArgs({this.key, required this.param});

  final _i18.Key? key;

  final String param;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, param: $param}';
  }
}

/// generated route for
/// [_i15.SettingsNestedWrapperScreen]
class SettingsNestedWrapperRoute extends _i17.PageRouteInfo<void> {
  const SettingsNestedWrapperRoute({List<_i17.PageRouteInfo>? children})
    : super(SettingsNestedWrapperRoute.name, initialChildren: children);

  static const String name = 'SettingsNestedWrapperRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i15.SettingsNestedWrapperScreen();
    },
  );
}

/// generated route for
/// [_i16.SettingsScreen]
class SettingsRoute extends _i17.PageRouteInfo<void> {
  const SettingsRoute({List<_i17.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i16.SettingsScreen();
    },
  );
}
