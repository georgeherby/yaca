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
          Spacer(
            flex: 50,
          ),
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
                                    child: Column(children: [
                                      Text(
                                        "Market Cap",
                                        style: Theme.of(context).textTheme.headline6,
                                      ),
                                      Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            AppBarDataBlock(
                                              label: 'All coins',
                                              amount: readableCurrencyFormat.format(ase
                                                  .marketOverview!.data.quote.usd.totalMarketCap),
                                            ),
                                            AppBarDataBlock(
                                              label: 'Altcoins coins',
                                              amount: readableCurrencyFormat.format(ase
                                                  .marketOverview!.data.quote.usd.altcoinMarketCap),
                                            ),
                                          ])
                                    ]),
                                  ),
                                  Spacer(),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          "Dominance",
                                          style: Theme.of(context).textTheme.headline6,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    child: Column(
                                      children: [
                                        Text(
                                          "24h Volume",
                                          style: Theme.of(context).textTheme.headline6,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            AppBarDataBlock(
                                              label: 'All coins',
                                              amount: readableCurrencyFormat.format(ase
                                                  .marketOverview!.data.quote.usd.totalVolume24h),
                                            ),
                                            AppBarDataBlock(
                                              label: 'Altcoin only',
                                              amount: readableCurrencyFormat.format(ase
                                                  .marketOverview!.data.quote.usd.totalVolume24h),
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
            flex: 40,
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
