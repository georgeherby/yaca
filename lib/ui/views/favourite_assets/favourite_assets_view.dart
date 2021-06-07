// 🐦 Flutter imports:

// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import 'package:crypto_app/core/bloc/asset_overview/asset_overview_bloc.dart';
import 'package:crypto_app/old/market/assets_data_table.dart';
import 'package:crypto_app/old/models/api/coingecko/market_coins.dart';
import 'package:crypto_app/ui/consts/constants.dart';

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
                    actions: [
                      IconButton(
                        icon: Icon(
                          CupertinoIcons.arrow_clockwise,
                        ),
                        onPressed: () =>
                            BlocProvider.of<AssetOverviewBloc>(context).add(
                          AssetOverviewLoad(),
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
