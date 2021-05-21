// 🐦 Flutter imports:
// 🌎 Project imports:
import 'package:crypto_app/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:crypto_app/core/bloc/asset_overview/asset_overview_bloc.dart';
import 'package:crypto_app/core/bloc/globalmarket/globalmarket_bloc.dart';
import 'package:crypto_app/core/extensions/chosen_currency.dart';
import 'package:crypto_app/old/market/assets_data_table.dart';
import 'package:crypto_app/old/market/widgets/app_bar_data_block.dart';
import 'package:crypto_app/old/market/widgets/app_bar_static.dart';
import 'package:crypto_app/old/market/widgets/shimmer_app_bar_data_block.dart';
import 'package:crypto_app/old/models/api/coingecko/market_coins.dart';
import 'package:crypto_app/old/widgets/percentage_change_box.dart';
import 'package:crypto_app/ui/pages/app_settings/app_settings_page.dart';
import 'package:crypto_app/ui/utils/currency_formatters.dart';
import 'package:crypto_app/ui/utils/percentage_formatters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

class MarketOverviewView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStatic(body: LayoutBuilder(builder: (context, constraint) {
        var mobileCompressed = constraint.maxWidth < 500;
        return Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Market Cap',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Divider(color: Colors.transparent, height: 8),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(child:
                              BlocBuilder<GlobalMarketBloc, GlobalMarketState>(
                                  builder: (context, state) {
                            if (state is GlobalMarketLoaded) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    BlocProvider.of<AppSettingsBloc>(context)
                                            .state
                                            .currency
                                            .currencySymbol +
                                        compactNumberFormat.format(
                                          state.globalMarket.data.totalMarketCap
                                              .getForCurrency(BlocProvider.of<
                                                      AppSettingsBloc>(context)
                                                  .state
                                                  .currency
                                                  .currencyCode),
                                        ),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.color),
                                  ),
                                  Divider(
                                    color: Colors.transparent,
                                    height: 4,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text('24h '),
                                      PercentageChangeBox(
                                        state.globalMarket.data
                                            .marketCapChangePercentage24hUsd,
                                      ),
                                    ],
                                  )
                                ],
                              );
                            }

                            if (state is GlobalMarketError) {
                              return Icon(CupertinoIcons.exclamationmark);
                            }
                            return ShimmerAppBarDataBlock();
                          }))
                        ])
                  ]),
            ),
            Spacer(),
            !mobileCompressed
                ? Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Dominance',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(color: Colors.white),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                        Divider(color: Colors.transparent, height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: BlocBuilder<GlobalMarketBloc,
                                  GlobalMarketState>(builder: (context, state) {
                                if (state is GlobalMarketLoaded) {
                                  return AppBarDataBlock(
                                    label: 'BTC',
                                    amount: percentageFormat.format(state
                                            .globalMarket
                                            .data
                                            .marketCapPercentage
                                            .btc /
                                        100),
                                  );
                                }

                                if (state is GlobalMarketError) {
                                  return Icon(CupertinoIcons.exclamationmark);
                                }
                                return ShimmerAppBarDataBlock();
                              }),
                            ),
                            Expanded(
                              child: BlocBuilder<GlobalMarketBloc,
                                  GlobalMarketState>(builder: (context, state) {
                                if (state is GlobalMarketLoaded) {
                                  return AppBarDataBlock(
                                    label: 'ETH',
                                    amount: percentageFormat.format(state
                                            .globalMarket
                                            .data
                                            .marketCapPercentage
                                            .eth /
                                        100),
                                  );
                                }

                                if (state is GlobalMarketError) {
                                  return Icon(CupertinoIcons.exclamationmark);
                                }
                                return ShimmerAppBarDataBlock();
                              }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Container(),
            !mobileCompressed ? Spacer() : Container(),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '24h Volume',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  Divider(color: Colors.transparent, height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child:
                          BlocBuilder<GlobalMarketBloc, GlobalMarketState>(
                              builder: (context, state) {
                        if (state is GlobalMarketLoaded) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                BlocProvider.of<AppSettingsBloc>(context,
                                            listen: true)
                                        .state
                                        .currency
                                        .currencySymbol +
                                    compactNumberFormat.format(
                                      state.globalMarket.data.totalVolume.gbp,
                                    ),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.color),
                              ),
                            ],
                          );
                        }

                        if (state is GlobalMarketError) {
                          return Icon(CupertinoIcons.exclamationmark);
                        }
                        return ShimmerAppBarDataBlock();
                      }))
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      }), refreshTapped: () {
        BlocProvider.of<GlobalMarketBloc>(context).add(GlobalMarketLoad());
        BlocProvider.of<AssetOverviewBloc>(context).add(AssetOverviewLoad());
        return;
      }),
      body: LayoutBuilder(
        builder: (context, constraint) {
          debugPrint('MarketView layoutbuilder');
          return ConstrainedBox(
            constraints: BoxConstraints(minWidth: constraint.maxWidth),
            child: BlocBuilder<AssetOverviewBloc, AssetOverviewState>(
              builder: (context, state) {
                if (state is AssetOverviewLoaded) {
                  return AssetsDataTable(
                      marketCoins: state.allAssets,
                      onFavourite: (MarketCoin marketCoin, bool isChecked) =>
                          BlocProvider.of<AssetOverviewBloc>(context).add(
                              AssetFavourited(
                                  state.allAssets, marketCoin, isChecked)));
                } else if (state is AssetOverviewLoading) {
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
                }
                return Icon(CupertinoIcons.exclamationmark);
              },
            ),
          );
        },
      ),
    );
  }
}
