// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    SearchRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SearchPage());
    },
    AssetRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<AssetRouteArgs>(
          orElse: () => AssetRouteArgs(id: pathParams.getString('assetId')));
      return MaterialPageX<dynamic>(
          routeData: routeData, child: AssetPage(key: args.key, id: args.id));
    },
    AppSettingsHomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: const AppSettingsHomePage(),
          fullscreenDialog: true);
    },
    AssetDetailsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const AssetDetailsPage());
    },
    AssetExchangeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const AssetExchangePage());
    },
    AppSettingsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const AppSettingsPage());
    },
    AppSettingsCurrencyRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const AppSettingsCurrencyPage());
    },
    AppSettingsThemeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const AppSettingsThemePage());
    },
    AppSettingsWhaleRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const AppSettingsWhalePage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(HomeRoute.name, path: '/'),
        RouteConfig(SearchRoute.name, path: '/search'),
        RouteConfig(AssetRoute.name, path: '/asset/:assetId', children: [
          RouteConfig(AssetDetailsRoute.name,
              path: '', parent: AssetRoute.name),
          RouteConfig(AssetExchangeRoute.name,
              path: 'exchanges', parent: AssetRoute.name)
        ]),
        RouteConfig(AppSettingsHomeRoute.name, path: '/settings', children: [
          RouteConfig(AppSettingsRoute.name,
              path: '', parent: AppSettingsHomeRoute.name),
          RouteConfig(AppSettingsCurrencyRoute.name,
              path: 'currency', parent: AppSettingsHomeRoute.name),
          RouteConfig(AppSettingsThemeRoute.name,
              path: 'theme', parent: AppSettingsHomeRoute.name),
          RouteConfig(AppSettingsWhaleRoute.name,
              path: 'whale', parent: AppSettingsHomeRoute.name)
        ])
      ];
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [SearchPage]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute() : super(SearchRoute.name, path: '/search');

  static const String name = 'SearchRoute';
}

/// generated route for
/// [AssetPage]
class AssetRoute extends PageRouteInfo<AssetRouteArgs> {
  AssetRoute({Key? key, required String id, List<PageRouteInfo>? children})
      : super(AssetRoute.name,
            path: '/asset/:assetId',
            args: AssetRouteArgs(key: key, id: id),
            rawPathParams: {'assetId': id},
            initialChildren: children);

  static const String name = 'AssetRoute';
}

class AssetRouteArgs {
  const AssetRouteArgs({this.key, required this.id});

  final Key? key;

  final String id;

  @override
  String toString() {
    return 'AssetRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [AppSettingsHomePage]
class AppSettingsHomeRoute extends PageRouteInfo<void> {
  const AppSettingsHomeRoute({List<PageRouteInfo>? children})
      : super(AppSettingsHomeRoute.name,
            path: '/settings', initialChildren: children);

  static const String name = 'AppSettingsHomeRoute';
}

/// generated route for
/// [AssetDetailsPage]
class AssetDetailsRoute extends PageRouteInfo<void> {
  const AssetDetailsRoute() : super(AssetDetailsRoute.name, path: '');

  static const String name = 'AssetDetailsRoute';
}

/// generated route for
/// [AssetExchangePage]
class AssetExchangeRoute extends PageRouteInfo<void> {
  const AssetExchangeRoute()
      : super(AssetExchangeRoute.name, path: 'exchanges');

  static const String name = 'AssetExchangeRoute';
}

/// generated route for
/// [AppSettingsPage]
class AppSettingsRoute extends PageRouteInfo<void> {
  const AppSettingsRoute() : super(AppSettingsRoute.name, path: '');

  static const String name = 'AppSettingsRoute';
}

/// generated route for
/// [AppSettingsCurrencyPage]
class AppSettingsCurrencyRoute extends PageRouteInfo<void> {
  const AppSettingsCurrencyRoute()
      : super(AppSettingsCurrencyRoute.name, path: 'currency');

  static const String name = 'AppSettingsCurrencyRoute';
}

/// generated route for
/// [AppSettingsThemePage]
class AppSettingsThemeRoute extends PageRouteInfo<void> {
  const AppSettingsThemeRoute()
      : super(AppSettingsThemeRoute.name, path: 'theme');

  static const String name = 'AppSettingsThemeRoute';
}

/// generated route for
/// [AppSettingsWhalePage]
class AppSettingsWhaleRoute extends PageRouteInfo<void> {
  const AppSettingsWhaleRoute()
      : super(AppSettingsWhaleRoute.name, path: 'whale');

  static const String name = 'AppSettingsWhaleRoute';
}
