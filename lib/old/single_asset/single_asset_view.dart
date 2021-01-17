import 'package:crypto_app/old/single_asset/exchange_list_with_filter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:crypto_app/core/viewmodels/app_settings_view_model.dart';
import 'package:crypto_app/core/viewmodels/asset_view_model.dart';
import 'package:crypto_app/old/api/coingecko/assets_api.dart';
import 'package:crypto_app/old/api/coingecko/exchange_ticker_api.dart';
import 'package:crypto_app/old/models/api/coingecko/asset_history.dart';
import 'package:crypto_app/old/models/api/coingecko/exchange_ticker.dart';
import 'package:crypto_app/old/models/api/coingecko/market_coins.dart';
import 'package:crypto_app/old/single_asset/app_bar_bottom.dart';
import 'package:crypto_app/old/widgets/asset_graph_with_switcher.dart';
import 'package:crypto_app/old/widgets/favourite_icon.dart';

class SingleAssetView extends StatelessWidget {
  final MarketCoin marketCoin;
  final Function(String, bool) onFavourite;

  const SingleAssetView({
    Key? key,
    required this.marketCoin,
    required this.onFavourite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double _bottomAppBarHeight = 120;
    debugPrint("SingleAssetView");

    return FutureBuilder(
      future: fetchFullAssetHistory(http.Client(), marketCoin.id,
          Provider.of<AppSettingsViewModel>(context, listen: false).chosenCurrency.currencyCode),
      builder: (BuildContext context, AsyncSnapshot<AssetHistorySplits> snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          print(snapshot.stackTrace);
          return Scaffold(
              appBar: AppBar(
                elevation: 0,
                leading: IconButton(
                  icon: Icon(CupertinoIcons.chevron_back),
                  onPressed: () => Navigator.pop(context),
                  color: Theme.of(context).appBarTheme.iconTheme?.color,
                ),
              ),
              body: Center(child: Icon(CupertinoIcons.exclamationmark)));
        }

        if (snapshot.hasData) {
          debugPrint("hasData");

          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 38 + _bottomAppBarHeight,
              title: Text(
                marketCoin.name,
                style: Theme.of(context).textTheme.headline6,
              ),
              elevation: 0,
              bottom: AppBarBottom(
                  height: _bottomAppBarHeight,
                  rank: marketCoin.marketCapRank,
                  symbol: marketCoin.symbol,
                  currentPrice: snapshot.data!.last24Hours.prices.length > 0
                      ? snapshot.data!.last24Hours.prices.last.value
                      : null,
                  currencySymbol: Provider.of<AppSettingsViewModel>(context, listen: false)
                      .chosenCurrency
                      .currencySymbol,
                  circulatingSupply: marketCoin.circulatingSupply,
                  percentageChange24h: marketCoin.priceChangePercentage24h,
                  priceChange24h: marketCoin.priceChange24h,
                  marketCap: marketCoin.marketCap,
                  volume24: marketCoin.totalVolume),
              brightness: Theme.of(context).brightness,
              leadingWidth: 124,
              leading: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 48,
                    alignment: AlignmentDirectional.center,
                    child: CupertinoButton(
                      color: Colors.grey,
                      child: Icon(
                        CupertinoIcons.add,
                        size: 24,
                      ),
                      // child: Icon(CupertinoIcons.chevron_back,
                      //     color: Theme.of(context).appBarTheme.iconTheme?.color),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
              actions: [
                Consumer<AssetViewModel>(builder: (BuildContext context, AssetViewModel ase, _) {
                  debugPrint("consumer");
                  return IconButton(
                    icon: FavouriteIcon(
                      isSelected: marketCoin.isFavourited,
                      size: 22,
                    ),
                    onPressed: () => onFavourite(marketCoin.id, marketCoin.isFavourited),
                  );
                })
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: AssetGraphWithSwitcher(allHistory: snapshot.data!),
                      ),
                    ),
                  ),
                  FutureBuilder(
                      future: getAllExchangeTickers(http.Client(), marketCoin.id),
                      builder:
                          (BuildContext context, AsyncSnapshot<List<ExchangeTicker>> snapshot) {
                        if (snapshot.hasError) {
                          print(snapshot.error.toString());
                          print(snapshot.stackTrace);
                        }
                        if (snapshot.hasData) {
                          return snapshot.data!.length > 0
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Material(
                                    borderRadius: BorderRadius.circular(10),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    elevation: 2,
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ExchangeListWithFilter(exchanges: snapshot.data!)),
                                  ),
                                )
                              : Container();
                        } else {
                          return Center(
                            child: CupertinoActivityIndicator(),
                          );
                        }
                      }),
                ],
              ),
            ),
          );
        } else {
          debugPrint("Loading");
          return Scaffold(
            body: Center(
              child: CupertinoActivityIndicator(),
            ),
          );
        }
      },
    );
  }
}
