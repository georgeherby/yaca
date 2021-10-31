import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/core/models/api/coingecko/market_coins.dart';
import 'package:crypto_app/ui/pages/app_settings/app_settings_page.dart';
import 'package:crypto_app/ui/pages/asset/asset_page.dart';
import 'package:crypto_app/ui/pages/home/home_page.dart';
import 'package:crypto_app/ui/pages/asset/asset_exchanges_page.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(
        page: AssetPage,
        path: '/asset/:assetId',
        children: [AutoRoute(page: AssetExchangePage, path: 'exchanges')]),
    AutoRoute(page: AppSettingsPage, path: '/settings', fullscreenDialog: true),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
