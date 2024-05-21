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
    ApplicationSettingsHomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: const ApplicationSettingsHomePage(),
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
    ApplicationSettingsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ApplicationSettingsPage());
    },
    ApplicationSettingsCurrencyRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ApplicationSettingsCurrencyPage());
    },
    ApplicationSettingsThemeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ApplicationSettingsThemePage());
    },
    ApplicationSettingsWhaleRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ApplicationSettingsWhalePage());
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
        RouteConfig(ApplicationSettingsHomeRoute.name,
            path: '/settings',
            children: [
              RouteConfig(ApplicationSettingsRoute.name,
                  path: '', parent: ApplicationSettingsHomeRoute.name),
              RouteConfig(ApplicationSettingsCurrencyRoute.name,
                  path: 'currency', parent: ApplicationSettingsHomeRoute.name),
              RouteConfig(ApplicationSettingsThemeRoute.name,
                  path: 'theme', parent: ApplicationSettingsHomeRoute.name),
              RouteConfig(ApplicationSettingsWhaleRoute.name,
                  path: 'whale', parent: ApplicationSettingsHomeRoute.name)
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
/// [ApplicationSettingsHomePage]
class ApplicationSettingsHomeRoute extends PageRouteInfo<void> {
  const ApplicationSettingsHomeRoute({List<PageRouteInfo>? children})
      : super(ApplicationSettingsHomeRoute.name,
            path: '/settings', initialChildren: children);

  static const String name = 'ApplicationSettingsHomeRoute';
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
/// [ApplicationSettingsPage]
class ApplicationSettingsRoute extends PageRouteInfo<void> {
  const ApplicationSettingsRoute()
      : super(ApplicationSettingsRoute.name, path: '');

  static const String name = 'ApplicationSettingsRoute';
}

/// generated route for
/// [ApplicationSettingsCurrencyPage]
class ApplicationSettingsCurrencyRoute extends PageRouteInfo<void> {
  const ApplicationSettingsCurrencyRoute()
      : super(ApplicationSettingsCurrencyRoute.name, path: 'currency');

  static const String name = 'ApplicationSettingsCurrencyRoute';
}

/// generated route for
/// [ApplicationSettingsThemePage]
class ApplicationSettingsThemeRoute extends PageRouteInfo<void> {
  const ApplicationSettingsThemeRoute()
      : super(ApplicationSettingsThemeRoute.name, path: 'theme');

  static const String name = 'ApplicationSettingsThemeRoute';
}

/// generated route for
/// [ApplicationSettingsWhalePage]
class ApplicationSettingsWhaleRoute extends PageRouteInfo<void> {
  const ApplicationSettingsWhaleRoute()
      : super(ApplicationSettingsWhaleRoute.name, path: 'whale');

  static const String name = 'ApplicationSettingsWhaleRoute';
}
