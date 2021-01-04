import 'package:crypto_app/old/models/asset_overview.dart';
import 'package:crypto_app/old/single_asset/app_bar_bottom.dart';
import 'package:crypto_app/old/widgets/asset_graph_with_switcher.dart';
import 'package:crypto_app/old/widgets/percentage_change_box.dart';
import 'package:crypto_app/old/widgets/price_delta.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'package:crypto_app/core/viewmodels/asset_view_model.dart';
import 'package:crypto_app/old/api/assets_api.dart';
import 'package:crypto_app/old/models/asset_history.dart';

class SingleAssetView extends StatelessWidget {
  final AssetData asset;
  final Function(int, bool) onFavourite;

  const SingleAssetView({
    Key? key,
    required this.asset,
    required this.onFavourite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(asset.name),
        elevation: 0,
        bottom: AppBarBottom(
            rank: asset.cmcRank,
            symbol: asset.symbol,
            circulatingSupply: asset.circulatingSupply,
            percentageChange24h: asset.quote.gbp?.percentChange24h,
            priceChange24h: asset.quote.gbp?.priceChange24h,
            marketCap: asset.quote.gbp?.marketCap,
            volume24: asset.quote.gbp?.volume24h),
        brightness: Theme.of(context).brightness,
        leading: IconButton(
          icon: Icon(CupertinoIcons.xmark),
          onPressed: () => Navigator.pop(context),
          color: Theme.of(context).appBarTheme.iconTheme?.color,
        ),
        actions: [
          Consumer<AssetViewModel>(builder: (BuildContext context, AssetViewModel ase, _) {
            return IconButton(
              icon: Icon(
                asset.isFavourited ? CupertinoIcons.star_fill : CupertinoIcons.star,
                color: asset.isFavourited
                    ? Color(0xFFF4C622)
                    : (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white24
                        : Colors.black26),
              ),
              onPressed: () => onFavourite(asset.id, asset.isFavourited),
            );
          })
        ],
      ),
      body: FutureBuilder(
        future: fetchFullAssetHistory(http.Client(), asset.slug),
        builder: (BuildContext context, AsyncSnapshot<AssetHistorySplits> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            print(snapshot.stackTrace);
          }

          return snapshot.hasData
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        clipBehavior: Clip.antiAlias,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: AssetGraphWithSwitcher(allHistory: snapshot.data!),
                        ),
                      ),
                    ],
                  ),
                )
              : Center(
                  child: CupertinoActivityIndicator(),
                );
        },
      ),
    );
  }
}
