// 🐦 Flutter imports:
// 📦 Package imports:
import 'package:cached_network_image/cached_network_image.dart';
// 🌎 Project imports:
import 'package:crypto_app/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:crypto_app/core/bloc/asset_overview/asset_overview_bloc.dart';
import 'package:crypto_app/old/models/api/coingecko/market_coins.dart';
import 'package:crypto_app/old/widgets/favourite_icon.dart';
import 'package:crypto_app/old/widgets/percentage_change_box.dart';
import 'package:crypto_app/old/widgets/price_delta.dart';
import 'package:crypto_app/old/widgets/simple_spark_line.dart';
import 'package:crypto_app/ui/pages/single_asset/single_asset_page.dart';
import 'package:crypto_app/ui/utils/currency_formatters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    debugPrint('AssetsDataTable - build');
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        // clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: Theme.of(context).cardTheme.elevation!,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            // debugPrint(constraints.maxWidth.toString());
            var collapsedView = constraints.maxWidth <= 800;
            var mobile = constraints.maxWidth <= 490;
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, bottom: 8.0),
                    child: buildRow(
                      mobile: mobile,
                      collapsed: collapsedView,
                      rank: Text('#',
                          style: Theme.of(context).textTheme.subtitle1,
                          textAlign: TextAlign.center),
                      iconNameSpark: Text('Name',
                          style: Theme.of(context).textTheme.subtitle1,
                          textAlign: TextAlign.start),
                      d7: Text('7d',
                          style: Theme.of(context).textTheme.subtitle1,
                          textAlign: TextAlign.center),
                      h24: Text('24h',
                          style: Theme.of(context).textTheme.subtitle1,
                          textAlign: TextAlign.center),
                      h1: Text('1h',
                          style: Theme.of(context).textTheme.subtitle1,
                          textAlign: TextAlign.center),
                      price: Text('Price',
                          style: Theme.of(context).textTheme.subtitle1,
                          textAlign: TextAlign.right),
                      favourite: Text('', textAlign: TextAlign.center),
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
                        var mc = marketCoins[index];

                        return InkWell(
                          onTap: () async {
                            debugPrint(mc.name);
                            await Navigator.push(
                              context,
                              CupertinoPageRoute(
                                fullscreenDialog: true,
                                builder: (context) {
                                  return SingleAssetPage(
                                    marketCoin: mc,
                                    onFavourite: (String id, bool isChecked) =>
                                        onFavourite(mc, !mc.isFavourited),
                                  );
                                },
                              ),
                            );
                            debugPrint('Finished');
                          },
                          child: SizedBox(
                            height: 72,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: buildRow(
                                mobile: mobile,
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
                                          backgroundColor:
                                              Theme.of(context).accentColor,
                                          child: Text(
                                            mc.symbol.toUpperCase(),
                                            overflow: TextOverflow.clip,
                                            maxLines: 1,
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption,
                                          ),
                                        );
                                      },
                                    ),
                                    VerticalDivider(
                                      color: Colors.transparent,
                                    ),
                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                          maxWidth: collapsedView ? 64 : 120),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            mc.symbol.toUpperCase(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2,
                                          ),
                                          Text(
                                            mc.name,
                                            maxLines: 2,
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                            .brightness ==
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
                                            padding: const EdgeInsets.only(
                                                top: 8.0, bottom: 8.0),
                                            child: mc.sparklineIn7d != null
                                                ? SimpleSparkLine(
                                                    data:
                                                        mc.sparklineIn7d!.price)
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
                                    PercentageChangeBox(
                                        mc.priceChangePercentage7dInCurrency),
                                    SizedBox(height: 4),
                                    PriceDelta(mc.priceChange7d),
                                  ],
                                ),
                                h24: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    PercentageChangeBox(
                                        mc.priceChangePercentage24hInCurrency),
                                    SizedBox(height: 4),
                                    PriceDelta(mc.priceChange24h),
                                  ],
                                ),
                                h1: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    PercentageChangeBox(
                                        mc.priceChangePercentage1hInCurrency),
                                    SizedBox(height: 4),
                                    PriceDelta(mc.priceChange1h)
                                  ],
                                ),
                                price: Text(
                                  mc.currentPrice.currencyFormatWithPrefix(
                                      BlocProvider.of<AppSettingsBloc>(context)
                                          .state
                                          .currency
                                          .currencySymbol),
                                  textAlign: collapsedView
                                      ? TextAlign.center
                                      : TextAlign.end,
                                ),
                                favourite: BlocBuilder<AssetOverviewBloc,
                                    AssetOverviewState>(
                                  builder: (context, state) {
                                    if (state is AssetOverviewLoaded) {
                                      return IconButton(
                                          icon: FavouriteIcon(
                                            isSelected: mc.isFavourited,
                                            size: 22,
                                          ),
                                          onPressed: () {
                                            return onFavourite(
                                                mc, !mc.isFavourited);
                                          });
                                    }
                                    return CupertinoActivityIndicator();
                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
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
      required Widget favourite,
      required bool mobile}) {
    return Row(
      children: [
        Expanded(flex: 15, child: rank),
        Expanded(flex: collapsed ? 80 : 200, child: iconNameSpark),
        !mobile ? Expanded(flex: collapsed ? 45 : 35, child: d7) : Container(),
        !mobile ? Expanded(flex: collapsed ? 45 : 35, child: h24) : Container(),
        !mobile ? Expanded(flex: collapsed ? 45 : 35, child: h1) : Container(),
        Expanded(flex: collapsed ? 40 : 30, child: price),
        Expanded(flex: 15, child: favourite),
      ],
    );
  }
}
