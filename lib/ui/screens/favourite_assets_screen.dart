import 'package:crypto_app/core/bloc/asset_overview/asset_overview_bloc.dart';
import 'package:crypto_app/old/market/assets_data_table.dart';
import 'package:crypto_app/old/models/api/coingecko/market_coins.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteAssetsScreen extends StatelessWidget {
  const FavouriteAssetsScreen({
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
                    toolbarHeight: 38,
                    title: Text(
                      'Favourites',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    elevation: Theme.of(context).appBarTheme.elevation,
                    actions: [
                      IconButton(
                        icon: Icon(
                          CupertinoIcons.arrow_clockwise,
                          size: 19,
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
                    onFavourite: (MarketCoin a, bool isChecked) =>
                    null
                      //ase.setFavourite(a, isChecked),
                  ))
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
