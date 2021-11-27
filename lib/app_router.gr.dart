// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(routeData: routeData, child: HomePage());
    },
    AssetRoute.name: (routeData) {
      final pathParams = routeData.pathParams;
      final args = routeData.argsAs<AssetRouteArgs>(
          orElse: () => AssetRouteArgs(id: pathParams.getString('assetId')));
      return MaterialPageX<dynamic>(
          routeData: routeData, child: AssetPage(key: args.key, id: args.id));
    },
    AppSettingsHomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: AppSettingsHomePage(),
          fullscreenDialog: true);
    },
    AssetDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<AssetDetailsRouteArgs>(
          orElse: () => const AssetDetailsRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData, child: AssetDetailsPage(key: args.key));
    },
    AssetExchangeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const AssetExchangePage());
    },
    AppSettingsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: AppSettingsPage());
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

/// generated route for [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for [AssetPage]
class AssetRoute extends PageRouteInfo<AssetRouteArgs> {
  AssetRoute({Key? key, required String id, List<PageRouteInfo>? children})
      : super(name,
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
}

/// generated route for [AppSettingsHomePage]
class AppSettingsHomeRoute extends PageRouteInfo<void> {
  const AppSettingsHomeRoute({List<PageRouteInfo>? children})
      : super(name, path: '/settings', initialChildren: children);

  static const String name = 'AppSettingsHomeRoute';
}

/// generated route for [AssetDetailsPage]
class AssetDetailsRoute extends PageRouteInfo<AssetDetailsRouteArgs> {
  AssetDetailsRoute({Key? key})
      : super(name, path: '', args: AssetDetailsRouteArgs(key: key));

  static const String name = 'AssetDetailsRoute';
}

class AssetDetailsRouteArgs {
  const AssetDetailsRouteArgs({this.key});

  final Key? key;
}

/// generated route for [AssetExchangePage]
class AssetExchangeRoute extends PageRouteInfo<void> {
  const AssetExchangeRoute() : super(name, path: 'exchanges');

  static const String name = 'AssetExchangeRoute';
}

/// generated route for [AppSettingsPage]
class AppSettingsRoute extends PageRouteInfo<void> {
  const AppSettingsRoute() : super(name, path: '');

  static const String name = 'AppSettingsRoute';
}

/// generated route for [AppSettingsCurrencyPage]
class AppSettingsCurrencyRoute extends PageRouteInfo<void> {
  const AppSettingsCurrencyRoute() : super(name, path: 'currency');

  static const String name = 'AppSettingsCurrencyRoute';
}

/// generated route for [AppSettingsThemePage]
class AppSettingsThemeRoute extends PageRouteInfo<void> {
  const AppSettingsThemeRoute() : super(name, path: 'theme');

  static const String name = 'AppSettingsThemeRoute';
}

/// generated route for [AppSettingsWhalePage]
class AppSettingsWhaleRoute extends PageRouteInfo<void> {
  const AppSettingsWhaleRoute() : super(name, path: 'whale');

  static const String name = 'AppSettingsWhaleRoute';
}
