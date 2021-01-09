import 'package:crypto_app/core/viewmodels/asset_view_model.dart';
import 'package:crypto_app/old/market/assets_data_table.dart';
import 'package:crypto_app/old/market/widgets/app_bar_static.dart';
import 'package:crypto_app/old/models/api/coingecko/market_coins.dart';
import 'package:crypto_app/old/models/asset_overview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MarketView extends StatelessWidget {
  const MarketView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStatic(showMarketOverview: true),
      body: LayoutBuilder(
        builder: (context, constraint) {
          debugPrint("MarketView layoutbuilder");
          return SingleChildScrollView(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(minWidth: constraint.maxWidth, minHeight: constraint.maxHeight),
                child: IntrinsicWidth(
                  child: Consumer<AssetViewModel>(
                    builder: (BuildContext context, AssetViewModel ase, _) {
                      debugPrint("Consumer AssetViewModel");

                      return ase.hasAssetsLoaded
                          ? AssetsDataTable(
                              marketCoins: ase.assetList,
                              onFavourite: (MarketCoin a, bool isChecked) =>
                                  ase.setFavourite(a, isChecked),
                            )
                          : Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CupertinoActivityIndicator(),
                              ],
                            );
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
