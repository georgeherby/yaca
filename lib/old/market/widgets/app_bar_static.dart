import 'package:crypto_app/core/viewmodels/asset_view_model.dart';
import 'package:crypto_app/old/market/widgets/app_bar_data_block.dart';
import 'package:crypto_app/old/models/market_overview.dart';
import 'package:crypto_app/old/utils/currency_formatters.dart';
import 'package:crypto_app/old/utils/percentage_formatters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBarStatic extends StatelessWidget with PreferredSizeWidget {
  final bool showMarletOverview;

  const AppBarStatic({Key? key, this.showMarletOverview = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Expanded(
            flex: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Spacer(),
                showMarletOverview
                    ? Consumer<AssetViewModel>(
                        builder: (BuildContext context, AssetViewModel ase, _) {
                        return ase.hasGlobalLoaded && ase.marketOverview != null
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Market Cap",
                                            style: Theme.of(context).textTheme.headline6,
                                            textAlign: TextAlign.center,
                                          ),
                                          Divider(color: Colors.transparent, height: 8),
                                          Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                AppBarDataBlock(
                                                  label: 'All',
                                                  amount: readableCurrencyFormat.format(ase
                                                      .marketOverview!
                                                      .data
                                                      .quote
                                                      .usd
                                                      .totalMarketCap),
                                                ),
                                                AppBarDataBlock(
                                                  label: 'Altcoins',
                                                  amount: readableCurrencyFormat.format(ase
                                                      .marketOverview!
                                                      .data
                                                      .quote
                                                      .usd
                                                      .altcoinMarketCap),
                                                ),
                                              ])
                                        ]),
                                  ),
                                  Spacer(),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Dominance",
                                          style: Theme.of(context).textTheme.headline6,
                                          textAlign: TextAlign.center,
                                        ),
                                        Divider(color: Colors.transparent, height: 8),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            AppBarDataBlock(
                                              label: 'Bitcoin',
                                              amount: percetnageFormat.format(
                                                  ase.marketOverview!.data.btcDominance / 100),
                                            ),
                                            AppBarDataBlock(
                                              label: 'Ethereum',
                                              amount: percetnageFormat.format(
                                                  ase.marketOverview!.data.ethDominance / 100),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "24h Volume",
                                          style: Theme.of(context).textTheme.headline6,
                                          textAlign: TextAlign.center,
                                        ),
                                        Divider(color: Colors.transparent, height: 8),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            AppBarDataBlock(
                                              label: 'All',
                                              amount: readableCurrencyFormat.format(ase
                                                  .marketOverview!.data.quote.usd.totalVolume24h),
                                            ),
                                            AppBarDataBlock(
                                              label: 'Altcoin',
                                              amount: readableCurrencyFormat.format(ase
                                                  .marketOverview!.data.quote.usd.altcoinVolume24h),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : Center(child: CupertinoActivityIndicator());
                      })
                    : Container(),
                Spacer(),
              ],
            ),
          ),
          Spacer(
            flex: 5,
          ),
          IconButton(
            icon: Icon(CupertinoIcons.arrow_clockwise),
            onPressed: () => Provider.of<AssetViewModel>(context, listen: false).fetchAssets(),
          ),
          Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight * 2);
}
