// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';

// 🌎 Project imports:
import 'package:yaca/ui/pages/application_settings/application_settings_home_page.dart';
import 'package:yaca/ui/pages/application_settings/sub_page/application_settings_currency_page.dart';
import 'package:yaca/ui/pages/application_settings/sub_page/application_settings_page.dart';
import 'package:yaca/ui/pages/application_settings/sub_page/application_settings_theme_page.dart';
import 'package:yaca/ui/pages/application_settings/sub_page/application_settings_whale_page.dart';
import 'package:yaca/ui/pages/asset/asset_page.dart';
import 'package:yaca/ui/pages/asset/sub_page/asset_details_page.dart';
import 'package:yaca/ui/pages/asset/sub_page/asset_exchanges_page.dart';
import 'package:yaca/ui/pages/home/home_page.dart';
import 'package:yaca/ui/pages/search/search_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(
      page: SearchPage,
      path: '/search',
    ),
    AutoRoute(
      page: AssetPage,
      path: '/asset/:assetId',
      children: [
        AutoRoute(page: AssetDetailsPage, initial: true),
        AutoRoute(page: AssetExchangePage, path: 'exchanges'),
      ],
    ),
    AutoRoute(
        page: ApplicationSettingsHomePage,
        path: '/settings',
        fullscreenDialog: true,
        children: [
          AutoRoute(page: ApplicationSettingsPage, initial: true),
          AutoRoute(page: ApplicationSettingsCurrencyPage, path: 'currency'),
          AutoRoute(page: ApplicationSettingsThemePage, path: 'theme'),
          AutoRoute(page: ApplicationSettingsWhalePage, path: 'whale'),
        ]),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
