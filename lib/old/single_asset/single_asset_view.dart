import 'package:crypto_app/old/models/asset_overview.dart';
import 'package:crypto_app/old/widgets/asset_graph_with_switcher.dart';
import 'package:crypto_app/old/widgets/percentage_change_box.dart';
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
        title: Text(
          asset.name,
        ),
        elevation: 0,
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
                    children: [
                      Card(
                        clipBehavior: Clip.antiAlias,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: AssetGraphWithSwitcher(allHistory: snapshot.data!),
                        ),
                      ),
                      Card(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Market Data (24h)",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Text(
                                  "#" + asset.cmcRank.toString(),
                                  style: Theme.of(context).textTheme.headline6,
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Market Cap", style: Theme.of(context).textTheme.subtitle1),
                                Row(
                                  children: [
                                    Text(asset.quote.gbp?.marketCap.toString() ?? "-"),
                                    asset.quote.gbp?.percentChange24h != null
                                        ? PercentageChangeBox(asset.quote.gbp!.percentChange24h!)
                                        : Container()
                                  ],
                                ),
                              ],
                            ),
                            Wrap(
                              alignment: WrapAlignment.start,
                              spacing: 8.0,
                              runSpacing: 4.0,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Volumne", style: Theme.of(context).textTheme.subtitle1),
                                    Text(asset.quote.gbp?.volume24h.toString() ?? "-"),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Circulation Supply",
                                        style: Theme.of(context).textTheme.subtitle1),
                                    Text("${asset.symbol} ${asset.circulatingSupply}"),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ))
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
