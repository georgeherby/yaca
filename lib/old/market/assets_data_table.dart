import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_app/old/models/api/coingecko/market_coins.dart';
import 'package:crypto_app/old/widgets/favourite_icon.dart';
import 'package:crypto_app/old/widgets/price_delta.dart';
import 'package:crypto_app/old/widgets/simple_spark_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:crypto_app/old/single_asset/single_asset_view.dart';
import 'package:crypto_app/old/utils/currency_formatters.dart';
import 'package:crypto_app/old/widgets/percentage_change_box.dart';

class AssetsDataTable extends StatelessWidget {
  final List<MarketCoin> marketCoins;
  final Function(MarketCoin, bool) onFavourite;
  const AssetsDataTable({
    Key? key,
    required this.marketCoins,
    required this.onFavourite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("AssetsDataTable - build");
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Material(
          borderRadius: BorderRadius.circular(10),
          // clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 2,
          child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
            print(constraints.maxWidth);
            bool collapsedView = constraints.maxWidth <= 800;
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                    child: buildRow(
                      collapsed: collapsedView,
                      rank: Text("#",
                          style: Theme.of(context).textTheme.subtitle1,
                          textAlign: TextAlign.center),
                      iconNameSpark: Text("Name",
                          style: Theme.of(context).textTheme.subtitle1, textAlign: TextAlign.start),
                      d7: Text("7d",
                          style: Theme.of(context).textTheme.subtitle1,
                          textAlign: TextAlign.center),
                      h24: Text("24h",
                          style: Theme.of(context).textTheme.subtitle1,
                          textAlign: TextAlign.center),
                      h1: Text("1h",
                          style: Theme.of(context).textTheme.subtitle1,
                          textAlign: TextAlign.center),
                      price: Text("Price",
                          style: Theme.of(context).textTheme.subtitle1,
                          textAlign: TextAlign.center),
                      favourite: Text("", textAlign: TextAlign.center),
                    ),
                  ),
                  Divider(
                    indent: 24,
                    endIndent: 24,
                    height: 1,
                    thickness: 1,
                  ),
                  Expanded(
                    child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            indent: 24,
                            endIndent: 24,
                            height: 1,
                            thickness: 1,
                          );
                        },
                        shrinkWrap: true,
                        itemCount: marketCoins.length,
                        itemBuilder: (BuildContext context, int index) {
                          MarketCoin mc = marketCoins[index];

                          return InkWell(
                            onTap: () async {
                              debugPrint(mc.name);
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  fullscreenDialog: true,
                                  builder: (context) {
                                    return SingleAssetView(
                                      marketCoin: mc,
                                      onFavourite: (String id, bool isChecked) {
                                        if (mc.isFavourited) {
                                          print("Unfaovouriting ${mc.name}");
                                        } else {
                                          print("Favourite ${mc.name}");
                                        }
                                        onFavourite(mc, !mc.isFavourited);
                                      },
                                    );
                                  },
                                ),
                              );
                              debugPrint("Finished");
                            },
                            child: SizedBox(
                              height: 72,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: buildRow(
                                  collapsed: collapsedView,
                                  rank: Text(mc.marketCapRank.toString(),
                                      textAlign: TextAlign.center),
                                  iconNameSpark: Row(
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: mc.image,
                                        filterQuality: FilterQuality.high,
                                        // isAntiAlias: true,
                                        // cacheWidth: 44,
                                        // cacheHeight: 44,
                                        width: 44,
                                        height: 44,
                                        errorWidget: (context, url, error) {
                                          debugPrint(error.toString());
                                          return CircleAvatar(
                                            minRadius: 22,
                                            maxRadius: 22,
                                            backgroundColor: Theme.of(context).accentColor,
                                            child: Text(
                                              mc.symbol.toUpperCase(),
                                              overflow: TextOverflow.clip,
                                              maxLines: 1,
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context).textTheme.caption,
                                            ),
                                          );
                                        },
                                      ),
                                      VerticalDivider(
                                        color: Colors.transparent,
                                      ),
                                      ConstrainedBox(
                                        constraints:
                                            BoxConstraints(maxWidth: collapsedView ? 64 : 120),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              mc.symbol.toUpperCase(),
                                              style: Theme.of(context).textTheme.subtitle2,
                                            ),
                                            Text(
                                              mc.name,
                                              maxLines: 2,
                                              style: TextStyle(
                                                  color: Theme.of(context).brightness ==
                                                          Brightness.light
                                                      ? Colors.black54
                                                      : Colors.white54),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Spacer(
                                        flex: 2,
                                      ),
                                      collapsedView
                                          ? Container()
                                          : Padding(
                                              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                                              child: mc.sparklineIn7d != null
                                                  ? SimpleSparkLine(data: mc.sparklineIn7d!.price)
                                                  : Container(),
                                            ),
                                      Spacer(
                                        flex: 1,
                                      ),
                                    ],
                                  ),
                                  d7: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      PercentageChangeBox(mc.priceChangePercentage7dInCurrency),
                                      SizedBox(height: 4),
                                      PriceDelta(mc.priceChange7d),
                                    ],
                                  ),
                                  h24: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      PercentageChangeBox(mc.priceChangePercentage24hInCurrency),
                                      SizedBox(height: 4),
                                      PriceDelta(mc.priceChange24h),
                                    ],
                                  ),
                                  h1: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      PercentageChangeBox(mc.priceChangePercentage1hInCurrency),
                                      SizedBox(height: 4),
                                      PriceDelta(mc.priceChange1h)
                                    ],
                                  ),
                                  price: Text(
                                    mc.currentPrice.coinCurrencyFormat(),
                                    textAlign: collapsedView ? TextAlign.center : TextAlign.end,
                                  ),
                                  favourite: InkWell(
                                    onTap: () {
                                      if (mc.isFavourited) {
                                        print("Unfaovouriting ${mc.name}");
                                      } else {
                                        print("Favourite ${mc.name}");
                                      }
                                      onFavourite(mc, !mc.isFavourited);
                                    },
                                    child: FavouriteIcon(
                                      isSelected: mc.isFavourited,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            );
          })),
    );
  }

  Row buildRow(
      {required bool collapsed,
      required Widget rank,
      required Widget iconNameSpark,
      required Widget d7,
      required Widget h24,
      required Widget h1,
      required Widget price,
      required Widget favourite}) {
    return Row(
      children: [
        Expanded(flex: 15, child: rank),
        Expanded(flex: collapsed ? 80 : 200, child: iconNameSpark),
        Expanded(flex: collapsed ? 45 : 35, child: d7),
        Expanded(flex: collapsed ? 45 : 35, child: h24),
        Expanded(flex: collapsed ? 45 : 35, child: h1),
        Expanded(flex: collapsed ? 40 : 30, child: price),
        Expanded(flex: 15, child: favourite),
      ],
    );
  }
}
