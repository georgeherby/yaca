import 'package:crypto_app/core/viewmodels/asset_view_model.dart';
import 'package:crypto_app/old/market/assets_data_table.dart';
import 'package:crypto_app/old/market/widgets/app_bar_static.dart';
import 'package:crypto_app/old/models/api/coingecko/market_coins.dart';
import 'package:crypto_app/old/models/asset_overview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteAssetsScreen extends StatelessWidget {
  const FavouriteAssetsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarStatic(),
        body: LayoutBuilder(builder: (context, constraint) {
          return SingleChildScrollView(
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ConstrainedBox(
                      constraints: BoxConstraints(minWidth: constraint.maxWidth),
                      child: IntrinsicWidth(child: Consumer<AssetViewModel>(
                          builder: (BuildContext context, AssetViewModel ase, _) {
                        return ase.favourites.length > 0
                            ? AssetsDataTable(
                                marketCoins: ase.favourites,
                                onFavourite: (MarketCoin a, bool isChecked) =>
                                    ase.setFavourite(a, isChecked),
                              )
                            : Center(
                                child: Text("No favourites"),
                              );
                      })))));
        }));
  }
}
