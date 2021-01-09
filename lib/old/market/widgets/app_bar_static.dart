import 'package:crypto_app/core/viewmodels/asset_view_model.dart';
import 'package:crypto_app/old/market/widgets/app_bar_data_block.dart';
import 'package:crypto_app/old/market/widgets/shimmer_app_bar_data_block.dart';
import 'package:crypto_app/old/models/market_overview.dart';
import 'package:crypto_app/old/utils/currency_formatters.dart';
import 'package:crypto_app/old/utils/percentage_formatters.dart';
import 'package:crypto_app/old/widgets/percentage_change_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBarStatic extends StatelessWidget with PreferredSizeWidget {
  final bool showMarketOverview;

  const AppBarStatic({Key? key, this.showMarketOverview = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          brightness: Brightness.dark,
          textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white))),
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0, top: 8.0, left: 4.0),
        child: Material(
          borderRadius: BorderRadius.circular(10),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 2,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient:
                  LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, stops: [
                0.0,
                1.0
              ], colors: [
                // Color(0xFF3F52B5),
                // Colors.blueAccent,
                Color(0xFF5866DF),
                Color(0xFFF33335),
              ]),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Spacer(),
                      showMarketOverview
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
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              ?.copyWith(color: Colors.white),
                                          textAlign: TextAlign.center,
                                        ),
                                        Divider(color: Colors.transparent, height: 8),
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Consumer<AssetViewModel>(builder:
                                                  (BuildContext context, AssetViewModel ase, _) {
                                                return ase.hasGlobalLoaded &&
                                                        ase.marketOverview != null
                                                    ? Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Text(
                                                            "?? " + //TODO Add in currency symbol
                                                                compactNumberFormat.format(
                                                                  ase.marketOverview!.data
                                                                      .totalMarketCap.gbp,
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
                                                            children: [
                                                              Text("24h "),
                                                              PercentageChangeBox(
                                                                ase.marketOverview!.data
                                                                    .marketCapChangePercentage24hUsd,
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      )
                                                    : ShimmerAppBarDataBlock();
                                              })
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            ?.copyWith(color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                      Divider(color: Colors.transparent, height: 8),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Consumer<AssetViewModel>(builder:
                                              (BuildContext context, AssetViewModel ase, _) {
                                            return ase.hasGlobalLoaded && ase.marketOverview != null
                                                ? AppBarDataBlock(
                                                    label: 'Bitcoin',
                                                    amount: percetnageFormat.format(ase
                                                            .marketOverview!
                                                            .data
                                                            .marketCapPercentage
                                                            .btc /
                                                        100),
                                                  )
                                                : ShimmerAppBarDataBlock();
                                          }),
                                          Consumer<AssetViewModel>(builder:
                                              (BuildContext context, AssetViewModel ase, _) {
                                            return ase.hasGlobalLoaded && ase.marketOverview != null
                                                ? AppBarDataBlock(
                                                    label: 'Ethereum',
                                                    amount: percetnageFormat.format(ase
                                                            .marketOverview!
                                                            .data
                                                            .marketCapPercentage
                                                            .eth /
                                                        100),
                                                  )
                                                : ShimmerAppBarDataBlock();
                                          }),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "24h Volume",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            ?.copyWith(color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                      Divider(color: Colors.transparent, height: 8),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Consumer<AssetViewModel>(builder:
                                              (BuildContext context, AssetViewModel ase, _) {
                                            return ase.hasGlobalLoaded && ase.marketOverview != null
                                                ? Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "?? " +
                                                            compactNumberFormat.format(
                                                              ase.marketOverview!.data.totalVolume
                                                                  .gbp,
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
                                                  )
                                                : ShimmerAppBarDataBlock();
                                          }),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
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
                  onPressed: () =>
                      Provider.of<AssetViewModel>(context, listen: false).fetchAssets(),
                ),
                Spacer(
                  flex: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight * 2);
}
