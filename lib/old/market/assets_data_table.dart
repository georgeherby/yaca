import 'package:crypto_app/old/models/asset_overview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:crypto_app/old/models/assets.dart';
import 'package:crypto_app/old/single_asset/single_asset_view.dart';
import 'package:crypto_app/old/utils/currency_formatters.dart';
import 'package:crypto_app/old/widgets/percentage_change_box.dart';

class AssetsDataTable extends StatelessWidget {
  final List<AssetData> assetsList;
  final Function(AssetData, bool) onFavourite;
  const AssetsDataTable({
    Key? key,
    required this.assetsList,
    required this.onFavourite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, top: 8, bottom: 8),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        elevation: 2,
        child: DataTable(
          dividerThickness: 0.5,
          sortAscending: true,
          sortColumnIndex: 0,
          columnSpacing: 54.0,
          dataRowHeight: 60,
          showCheckboxColumn: false,
          columns: [
            DataColumn(
              label: Text('Rank', style: TextStyle(fontWeight: FontWeight.w600)),
              numeric: true,
            ),
            DataColumn(
              label: Text('Name', style: TextStyle(fontWeight: FontWeight.w600)),
            ),
            DataColumn(
                label: Text('Market Cap', style: TextStyle(fontWeight: FontWeight.w600)),
                numeric: true),
            DataColumn(
                label: Text('Price', style: TextStyle(fontWeight: FontWeight.w600)), numeric: true),
            DataColumn(
                label: Text('7d', style: TextStyle(fontWeight: FontWeight.w600)), numeric: true),
            DataColumn(
                label: Text('24h', style: TextStyle(fontWeight: FontWeight.w600)), numeric: true),
            DataColumn(
                label: Text('1h', style: TextStyle(fontWeight: FontWeight.w600)), numeric: true),
            DataColumn(
                label: Text('', style: TextStyle(fontWeight: FontWeight.w600)), numeric: true),
          ],
          rows: List.generate(assetsList.length, (index) {
            return buildDataRow(assetsList[index], context);
          }),
        ),
      ),
    );
  }

  DataRow buildDataRow(AssetData a, BuildContext context) {
    return DataRow(
        onSelectChanged: (value) {
          debugPrint(a.name);
          Navigator.push(
              context,
              MaterialPageRoute(
                fullscreenDialog: true,
                builder: (context) {
                  return SingleAssetView(
                    asset: a,
                    onFavourite: (int id, bool isChecked) {
                      if (a.isFavourited) {
                        print("Unfaovouriting ${a.name}");
                      } else {
                        print("Favourite ${a.name}");
                      }
                      onFavourite(a, !a.isFavourited);
                    },
                  );
                },
              ));
        },
        cells: [
          DataCell(
            Text(a.cmcRank.toString()),
          ),
          DataCell(
            Row(
              children: [
                Image.network(
                  "https://static.coincap.io/assets/icons/${a.symbol.toLowerCase()}@2x.png",
                  width: 44,
                  height: 44,
                  errorBuilder: (context, error, stackTrace) {
                    debugPrint(error.toString());
                    return Container();
                  },
                ),
                VerticalDivider(
                  color: Colors.transparent,
                ),
                Text(
                  a.symbol,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                VerticalDivider(
                  color: Colors.transparent,
                ),
                Text(a.name,
                    style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black54
                            : Colors.white54)),
              ],
            ),
          ),
          DataCell(a.quote.gbp != null
              ? Text(readableCurrencyFormat.format(a.quote.gbp!.marketCap))
              : Container()),
          DataCell(a.quote.gbp != null
              ? Text(coinCurrencyFormat(a.quote.gbp!.price).format(a.quote.gbp!.price))
              : Container()),
          DataCell(a.quote.gbp?.percentChange7d != null
              ? PercentageChangeBox(a.quote.gbp!.percentChange7d!)
              : Container()),
          DataCell(a.quote.gbp?.percentChange24h != null
              ? PercentageChangeBox(a.quote.gbp!.percentChange24h!)
              : Container()),
          DataCell(a.quote.gbp?.percentChange1h != null
              ? PercentageChangeBox(a.quote.gbp!.percentChange1h!)
              : Container()),
          DataCell(
            InkWell(
              onTap: () {
                if (a.isFavourited) {
                  print("Unfaovouriting ${a.name}");
                } else {
                  print("Favourite ${a.name}");
                }
                onFavourite(a, !a.isFavourited);
              },
              child: Icon(
                a.isFavourited ? CupertinoIcons.star_fill : CupertinoIcons.star,
                size: 36,
                color: a.isFavourited
                    ? Color(0xFFF4C622)
                    : (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white24
                        : Colors.black26),
              ),
            ),
          ),
        ]);
  }
}
