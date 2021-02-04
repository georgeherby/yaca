import 'package:crypto_app/core/viewmodels/app_settings_view_model.dart';
import 'package:crypto_app/core/viewmodels/asset_view_model.dart';
import 'package:crypto_app/old/market/assets_data_table.dart';
import 'package:crypto_app/old/models/api/coingecko/market_coins.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteAssetsScreen extends StatelessWidget {
  const FavouriteAssetsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AssetViewModel>(
      builder: (BuildContext context, AssetViewModel ase, _) {
        if (ase.hasAssetsLoaded) {
          return ase.favourites.assets.length > 0
              ? Scaffold(
                  appBar: AppBar(
                    toolbarHeight: 38,
                    title: Text(
                      "Favourites",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    elevation: 0,
                    actions: [
                      IconButton(
                        icon: Icon(
                          CupertinoIcons.arrow_clockwise,
                          size: 19,
                        ),
                        onPressed: () => Provider.of<AssetViewModel>(context, listen: false)
                            .fetchAssets(Provider.of<AppSettingsViewModel>(context, listen: false)
                                .chosenCurrency
                                .currencyCode),
                      ),
                    ],
                  ),
                  body: AssetsDataTable(
                    marketCoins: ase.favourites.assets,
                    onFavourite: (MarketCoin a, bool isChecked) => ase.setFavourite(a, isChecked),
                  ))
              : Center(
                  child: Text("No favourites"),
                );
        } else {
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
      },
    );
  }
}
