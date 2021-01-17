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
    return Material(
      borderRadius: BorderRadius.circular(10),
      // clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 2,
      child: DataTable(
        dividerThickness: 0.5,
        sortAscending: true,
        sortColumnIndex: 0,
        columnSpacing: 54.0,
        dataRowHeight: 72,
        showCheckboxColumn: false,
        columns: [
          DataColumn(
            label: Text('#', style: TextStyle(fontWeight: FontWeight.w600)),
            numeric: true,
          ),
          DataColumn(
            label: Text('Name', style: TextStyle(fontWeight: FontWeight.w600)),
          ),
          DataColumn(
              label: Text('7d', style: TextStyle(fontWeight: FontWeight.w600)), numeric: true),
          DataColumn(
              label: Text('24h', style: TextStyle(fontWeight: FontWeight.w600)), numeric: true),
          DataColumn(
              label: Text('1h', style: TextStyle(fontWeight: FontWeight.w600)), numeric: true),
          DataColumn(
              label: Text('Price', style: TextStyle(fontWeight: FontWeight.w600)), numeric: true),
          DataColumn(label: Text('', style: TextStyle(fontWeight: FontWeight.w600)), numeric: true),
        ],
        rows: List.generate(marketCoins.length, (index) {
          return buildDataRow(marketCoins[index], context);
        }),
      ),
    );
  }

  DataRow buildDataRow(MarketCoin mc, BuildContext context) {
    return DataRow(
        onSelectChanged: (value) async {
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
        cells: [
          DataCell(
            Text(mc.marketCapRank.toString()),
          ),
          DataCell(
            Row(
              children: [
                Image.network(
                  mc.image,
                  filterQuality: FilterQuality.high,
                  isAntiAlias: true,
                  cacheWidth: 44,
                  cacheHeight: 44,
                  width: 44,
                  height: 44,
                  errorBuilder: (context, error, stackTrace) {
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
                Column(
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
                      style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.light
                              ? Colors.black54
                              : Colors.white54),
                    ),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: mc.sparklineIn7d != null
                      ? SimpleSparkLine(data: mc.sparklineIn7d!.price)
                      : Container(),
                ),
              ],
            ),
          ),
          DataCell(
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PercentageChangeBox(mc.priceChangePercentage7dInCurrency),
                SizedBox(height: 4),
                PriceDelta(mc.priceChange7d),
              ],
            ),
          ),
          DataCell(
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PercentageChangeBox(mc.priceChangePercentage24hInCurrency),
                SizedBox(height: 4),
                PriceDelta(mc.priceChange24h),
              ],
            ),
          ),
          DataCell(
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PercentageChangeBox(mc.priceChangePercentage1hInCurrency),
                SizedBox(height: 4),
                PriceDelta(mc.priceChange1h)
              ],
            ),
          ),
          DataCell(Text(mc.currentPrice.coinCurrencyFormat())),
          DataCell(
            InkWell(
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
              ),
            ),
          ),
        ]);
  }
}
