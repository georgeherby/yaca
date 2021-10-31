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
      final args = routeData.argsAs<AssetRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: AssetPage(
              key: args.key,
              id: args.id,
              marketCoin: args.marketCoin,
              onFavourite: args.onFavourite));
    },
    AppSettingsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: AppSettingsPage(),
          fullscreenDialog: true);
    },
    AssetExchangeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const AssetExchangePage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(HomeRoute.name, path: '/'),
        RouteConfig(AssetRoute.name, path: '/asset/:assetId', children: [
          RouteConfig(AssetExchangeRoute.name,
              path: 'exchanges', parent: AssetRoute.name)
        ]),
        RouteConfig(AppSettingsRoute.name, path: '/settings')
      ];
}

/// generated route for [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for [AssetPage]
class AssetRoute extends PageRouteInfo<AssetRouteArgs> {
  AssetRoute(
      {Key? key,
      String? id,
      required MarketCoin marketCoin,
      required dynamic Function(String, bool) onFavourite,
      List<PageRouteInfo>? children})
      : super(name,
            path: '/asset/:assetId',
            args: AssetRouteArgs(
                key: key,
                id: id,
                marketCoin: marketCoin,
                onFavourite: onFavourite),
            rawPathParams: {'assetId': id},
            initialChildren: children);

  static const String name = 'AssetRoute';
}

class AssetRouteArgs {
  const AssetRouteArgs(
      {this.key, this.id, required this.marketCoin, required this.onFavourite});

  final Key? key;

  final String? id;

  final MarketCoin marketCoin;

  final dynamic Function(String, bool) onFavourite;
}

/// generated route for [AppSettingsPage]
class AppSettingsRoute extends PageRouteInfo<void> {
  const AppSettingsRoute() : super(name, path: '/settings');

  static const String name = 'AppSettingsRoute';
}

/// generated route for [AssetExchangePage]
class AssetExchangeRoute extends PageRouteInfo<void> {
  const AssetExchangeRoute() : super(name, path: 'exchanges');

  static const String name = 'AssetExchangeRoute';
}
