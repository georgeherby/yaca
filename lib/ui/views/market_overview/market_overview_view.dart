// 🌎 Project imports:
import 'package:crypto_app/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:crypto_app/core/bloc/asset_overview/asset_overview_bloc.dart';
import 'package:crypto_app/core/bloc/globalmarket/globalmarket_bloc.dart';
import 'package:crypto_app/core/extensions/chosen_currency.dart';
import 'package:crypto_app/core/extensions/platform.dart';
import 'package:crypto_app/core/models/api/coingecko/market_coins.dart';
import 'package:crypto_app/ui/consts/colours.dart';
import 'package:crypto_app/ui/consts/constants.dart';
import 'package:crypto_app/ui/pages/app_settings/app_settings_page.dart';
import 'package:crypto_app/ui/utils/currency_formatters.dart';
import 'package:crypto_app/ui/utils/percentage_formatters.dart';
import 'package:crypto_app/ui/views/market_overview/widgets/assets_data_table.dart';
import 'package:crypto_app/ui/views/market_overview/widgets/shimmer_app_bar_data_block.dart';
import 'package:crypto_app/ui/views/widgets/percentage_change_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MarketOverviewView extends StatefulWidget {
  @override
  _MarketOverviewViewState createState() => _MarketOverviewViewState();
}

class _MarketOverviewViewState extends State<MarketOverviewView> {
  bool _showAllAssets = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Crypto App',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        centerTitle: true,
        actions: [
          (Theme.of(context).platform.isDesktop())
              ? IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.syncAlt,
                    size: Theme.of(context).platform == TargetPlatform.macOS
                        ? 20
                        : Theme.of(context).iconTheme.size,
                  ),
                  tooltip: 'Refresh',
                  onPressed: () {
                    BlocProvider.of<GlobalMarketBloc>(context).add(
                        GlobalMarketLoad(
                            BlocProvider.of<AppSettingsBloc>(context)
                                .state
                                .currency
                                .currencyCode));
                    BlocProvider.of<AssetOverviewBloc>(context).add(
                        AssetOverviewLoad(
                            BlocProvider.of<AppSettingsBloc>(context)
                                .state
                                .currency
                                .currencyCode));
                    return;
                  })
              : Container()
        ],
        toolbarHeight: kToolBarWithTickerHeight,
        leading: (Theme.of(context).platform.isDesktop())
            ? Container()
            : IconButton(
                tooltip: 'Open settings',
                onPressed: () => Navigator.of(context).push(
                  CupertinoPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => AppSettingsPage(),
                  ),
                ),
                icon: FaIcon(FontAwesomeIcons.cog),
              ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              // topRight: Radius.circular(40.0),
              bottomRight: Radius.circular(10.0),
              // topLeft: Radius.circular(40.0),
              bottomLeft: Radius.circular(10.0)),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kTickerTapHeight),
          child: SizedBox(
            height: kTickerTapHeight,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0)),
                  ),
                  child: BlocBuilder<GlobalMarketBloc, GlobalMarketState>(
                    builder: (context, state) {
                      if (state is GlobalMarketLoaded) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              1000, //double.maxFinite.toInt(), https://github.com/flutter/flutter/issues/76640
                          itemBuilder: (context, index) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: 8),
                                Text(
                                  'Total Market Cap:',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  '${BlocProvider.of<AppSettingsBloc>(context).state.currency.currencySymbol + compactNumberFormat(context).format(state.globalMarket.data.totalMarketCap.getForCurrency(BlocProvider.of<AppSettingsBloc>(context).state.currency.currencyCode))}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(color: Colors.white),
                                ),
                                SizedBox(width: 8),
                                PercentageChangeBox(state.globalMarket.data
                                    .marketCapChangePercentage24hUsd),
                                VerticalDivider(
                                  thickness: 2,
                                  color: Colors.white,
                                  indent: kTickerTapHeight / 4,
                                  endIndent: kTickerTapHeight / 4,
                                ),
                                Text(
                                  '24h Volume:',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  '${BlocProvider.of<AppSettingsBloc>(context).state.currency.currencySymbol + compactNumberFormat(context).format(
                                        state.globalMarket.data.totalVolume.gbp,
                                      )}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(color: Colors.white),
                                ),
                                VerticalDivider(
                                  thickness: 2,
                                  color: Colors.white,
                                  indent: kTickerTapHeight / 4,
                                  endIndent: kTickerTapHeight / 4,
                                ),
                                Text(
                                  'Dominance:',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'BTC ${percentageFormat.format(state.globalMarket.data.marketCapPercentage.btc / 100)}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(color: Colors.white),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'ETH ${percentageFormat.format(state.globalMarket.data.marketCapPercentage.eth / 100)}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(color: Colors.white),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'BNB ${percentageFormat.format(state.globalMarket.data.marketCapPercentage.bnb / 100)}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(color: Colors.white),
                                ),
                                SizedBox(width: 8),
                              ],
                            );
                          },
                        );
                      }

                      if (state is GlobalMarketError) {
                        return Icon(CupertinoIcons.exclamationmark);
                      }
                      return ShimmerAppBarDataBlock();
                    },
                  )),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: LayoutBuilder(
          builder: (context, constraint) {
            var currencyCode = BlocProvider.of<AppSettingsBloc>(context)
                .state
                .currency
                .currencyCode;
            debugPrint('MarketView layoutbuilder $currencyCode');

            return ConstrainedBox(
              constraints: BoxConstraints(minWidth: constraint.maxWidth),
              child: BlocBuilder<AssetOverviewBloc, AssetOverviewState>(
                builder: (context, state) {
                  if (state is AssetOverviewLoaded) {
                    print('rebuild AssetOverviewLoaded');
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                          child: OutlinedButton.icon(
                            onPressed: () {
                              setState(() {
                                _showAllAssets = !_showAllAssets;
                              });
                            },
                            style: OutlinedButton.styleFrom(
                              tapTargetSize: MaterialTapTargetSize.padded,
                              visualDensity:
                                  VisualDensity(horizontal: 0, vertical: 0),
                              primary: Theme.of(context).primaryColor,
                              backgroundColor: _showAllAssets
                                  ? Theme.of(context).chipTheme.backgroundColor
                                  : Theme.of(context).chipTheme.selectedColor,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                            icon: FaIcon(
                                _showAllAssets
                                    ? FontAwesomeIcons.star
                                    : FontAwesomeIcons.solidStar,
                                size: 16,
                                color: _showAllAssets
                                    ? Theme.of(context)
                                        .iconTheme
                                        .color
                                        ?.withOpacity(0.5)
                                    : kGold),
                            label: Text('Favourites',
                                style: _showAllAssets
                                    ? Theme.of(context).textTheme.bodyText2
                                    : Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        ?.copyWith(color: Colors.white)),
                          ),
                        ),
                        Expanded(
                          child: AssetsDataTable(
                            marketCoins: _showAllAssets
                                ? state.allAssets
                                : state.favouriteAssets,
                            onRefresh: () async {
                              BlocProvider.of<GlobalMarketBloc>(context).add(
                                  GlobalMarketLoad(
                                      BlocProvider.of<AppSettingsBloc>(context)
                                          .state
                                          .currency
                                          .currencyCode));
                              BlocProvider.of<AssetOverviewBloc>(context).add(
                                  AssetOverviewLoad(
                                      BlocProvider.of<AppSettingsBloc>(context)
                                          .state
                                          .currency
                                          .currencyCode));
                              return;
                            },
                            onFavourite: (MarketCoin marketCoin,
                                    bool isChecked) =>
                                BlocProvider.of<AssetOverviewBloc>(context).add(
                              AssetFavourited(
                                  state.allAssets, marketCoin, isChecked),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else if (state is AssetOverviewError) {
                    return Icon(CupertinoIcons.exclamationmark);
                  }
                  return LayoutBuilder(builder: (context, constraint) {
                    return ConstrainedBox(
                      constraints:
                          BoxConstraints(minHeight: constraint.maxHeight),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CupertinoActivityIndicator(),
                        ],
                      ),
                    );
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
