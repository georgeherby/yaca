import 'package:crypto_app/core/viewmodels/asset_view_model.dart';
import 'package:crypto_app/old/market/widgets/app_bar_data_block.dart';
import 'package:crypto_app/old/models/market_details.dart';
import 'package:crypto_app/old/utils/currency_formatters.dart';
import 'package:crypto_app/old/utils/percentage_formatters.dart';
import 'package:crypto_app/old/widgets/percentage_change_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBarStatic extends StatelessWidget with PreferredSizeWidget {
  final MarketDetails marketDetails;

  const AppBarStatic({Key? key, required this.marketDetails}) : super(key: key);

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
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBarDataBlock(
                      label: 'Market Cap',
                      amount: readableCurrencyFormat.format(marketDetails.marketCapUsd),
                      changePer24Hours: PercentageChangeBox(marketDetails.marketCapChange24h),
                    ),
                    AppBarDataBlock(
                      label: 'Asset Count',
                      amount: marketDetails.cryptocurrenciesNumber.toString(),
                    ),
                    AppBarDataBlock(
                      label: 'BTC Dominance',
                      amount:
                          percetnageFormat.format(marketDetails.bitcoinDominancePercentage / 100),
                    ),
                    AppBarDataBlock(
                      label: '24h Volume',
                      amount: readableCurrencyFormat.format(marketDetails.volume24hUsd),
                      changePer24Hours: PercentageChangeBox(marketDetails.volume24hChange24h),
                    ),
                  ],
                ),
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
