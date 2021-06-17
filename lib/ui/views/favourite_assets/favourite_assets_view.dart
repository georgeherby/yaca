// 🐦 Flutter imports:
import 'package:crypto_app/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:crypto_app/core/bloc/asset_overview/asset_overview_bloc.dart';
// 🌎 Project imports:
import 'package:crypto_app/core/extensions/platform.dart';
import 'package:crypto_app/core/models/api/coingecko/market_coins.dart';
import 'package:crypto_app/ui/consts/constants.dart';
import 'package:crypto_app/ui/pages/app_settings/app_settings_page.dart';
import 'package:crypto_app/ui/views/widgets/assets_data_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FavouriteAssetsView extends StatelessWidget {
  const FavouriteAssetsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssetOverviewBloc, AssetOverviewState>(
      builder: (context, state) {
        if (state is AssetOverviewLoaded) {
          return state.favouriteAssets.isNotEmpty
              ? Scaffold(
                  appBar: AppBar(
                    toolbarHeight:
                        Theme.of(context).platform == TargetPlatform.macOS
                            ? kTitleBarMacOSHeight
                            : kToolbarHeight,
                    title: Text(
                      'Favourites',
                      style: Theme.of(context).appBarTheme.titleTextStyle,
                    ),
                    centerTitle: true,
                    elevation: Theme.of(context).appBarTheme.elevation,
                    leading: Theme.of(context).platform.isMobile()
                        ? IconButton(
                            tooltip: 'Open settings',
                            onPressed: () => Navigator.of(context).push(
                              CupertinoPageRoute(
                                fullscreenDialog: true,
                                builder: (context) => AppSettingsPage(),
                              ),
                            ),
                            icon: FaIcon(FontAwesomeIcons.cog),
                          )
                        : Container(),
                    actions: [
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.syncAlt),
                        onPressed: () =>
                            BlocProvider.of<AssetOverviewBloc>(context).add(
                          AssetOverviewLoad(
                              BlocProvider.of<AppSettingsBloc>(context)
                                  .state
                                  .currency
                                  .currencyCode),
                        ),
                      )
                    ],
                  ),
                  body: AssetsDataTable(
                      marketCoins: state.favouriteAssets,
                      onFavourite: (MarketCoin marketCoin, bool isChecked) =>
                          BlocProvider.of<AssetOverviewBloc>(context).add(
                              AssetFavourited(
                                  state.allAssets, marketCoin, isChecked))))
              : Center(
                  child: Text('No favourites'),
                );
        } else if (state is AssetOverviewLoading) {
          return LayoutBuilder(builder: (context, constraint) {
            return ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoActivityIndicator(),
                ],
              ),
            );
          });
        }
        return Icon(CupertinoIcons.exclamationmark);
      },
    );
  }
}
