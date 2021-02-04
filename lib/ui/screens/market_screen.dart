import 'package:crypto_app/core/viewmodels/app_settings_view_model.dart';
import 'package:crypto_app/core/viewmodels/asset_view_model.dart';
import 'package:crypto_app/old/market/assets_data_table.dart';
import 'package:crypto_app/old/market/widgets/app_bar_data_block.dart';
import 'package:crypto_app/old/market/widgets/app_bar_static.dart';
import 'package:crypto_app/old/market/widgets/shimmer_app_bar_data_block.dart';
import 'package:crypto_app/old/models/api/coingecko/market_coins.dart';
import 'package:crypto_app/old/utils/currency_formatters.dart';
import 'package:crypto_app/old/utils/percentage_formatters.dart';
import 'package:crypto_app/old/widgets/percentage_change_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  _MarketScreenState createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      if (Provider.of<AssetViewModel>(context, listen: false).assetList.assets.isEmpty) {
        Provider.of<AssetViewModel>(context, listen: false).fetchAssets(
            Provider.of<AppSettingsViewModel>(context, listen: false).chosenCurrency.currencyCode);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStatic(
        body: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Text(
                  "Market Cap",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                Divider(color: Colors.transparent, height: 8),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                  Expanded(child: Consumer<AssetViewModel>(
                      builder: (BuildContext context, AssetViewModel ase, _) {
                    return ase.hasGlobalLoaded && ase.marketOverview != null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                Provider.of<AppSettingsViewModel>(context, listen: false)
                                        .chosenCurrency
                                        .currencySymbol +
                                    compactNumberFormat.format(
                                      ase.marketOverview!.data.totalMarketCap.gbp,
                                    ),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Theme.of(context).textTheme.bodyText1?.color),
                              ),
                              Divider(
                                color: Colors.transparent,
                                height: 4,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("24h "),
                                  PercentageChangeBox(
                                    ase.marketOverview!.data.marketCapChangePercentage24hUsd,
                                  ),
                                ],
                              )
                            ],
                          )
                        : ShimmerAppBarDataBlock();
                  }))
                ])
              ]),
            ),
            Spacer(),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Dominance",
                    style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  Divider(color: Colors.transparent, height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Consumer<AssetViewModel>(
                            builder: (BuildContext context, AssetViewModel ase, _) {
                          return ase.hasGlobalLoaded && ase.marketOverview != null
                              ? AppBarDataBlock(
                                  label: 'BTC',
                                  amount: percentageFormat.format(
                                      ase.marketOverview!.data.marketCapPercentage.btc / 100),
                                )
                              : ShimmerAppBarDataBlock();
                        }),
                      ),
                      Expanded(
                        child: Consumer<AssetViewModel>(
                            builder: (BuildContext context, AssetViewModel ase, _) {
                          return ase.hasGlobalLoaded && ase.marketOverview != null
                              ? AppBarDataBlock(
                                  label: 'ETH',
                                  amount: percentageFormat.format(
                                      ase.marketOverview!.data.marketCapPercentage.eth / 100),
                                )
                              : ShimmerAppBarDataBlock();
                        }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "24h Volume",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  Divider(color: Colors.transparent, height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: Consumer<AssetViewModel>(
                          builder: (BuildContext context, AssetViewModel ase, _) {
                        return ase.hasGlobalLoaded && ase.marketOverview != null
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    Provider.of<AppSettingsViewModel>(context, listen: false)
                                            .chosenCurrency
                                            .currencySymbol +
                                        compactNumberFormat.format(
                                          ase.marketOverview!.data.totalVolume.gbp,
                                        ),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Theme.of(context).textTheme.bodyText1?.color),
                                  ),
                                ],
                              )
                            : ShimmerAppBarDataBlock();
                      })),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        refreshTapped: () => Provider.of<AssetViewModel>(context, listen: false).fetchAssets(
            Provider.of<AppSettingsViewModel>(context, listen: false).chosenCurrency.currencyCode),
      ),
      body: LayoutBuilder(
        builder: (context, constraint) {
          debugPrint("MarketView layoutbuilder");
          return ConstrainedBox(
            constraints: BoxConstraints(minWidth: constraint.maxWidth),
            child: Consumer<AssetViewModel>(
              builder: (BuildContext context, AssetViewModel ase, _) {
                debugPrint("Consumer AssetViewModel");

                return ase.hasAssetsLoaded
                    ? AssetsDataTable(
                        marketCoins: ase.assetList.assets,
                        onFavourite: (MarketCoin a, bool isChecked) =>
                            ase.setFavourite(a, isChecked),
                      )
                    : ConstrainedBox(
                        constraints: BoxConstraints(minHeight: constraint.maxHeight),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CupertinoActivityIndicator(),
                          ],
                        ),
                      );
              },
            ),
          );
        },
      ),
    );
  }
}
