import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:crypto_app/old/models/assets.dart';
import 'package:crypto_app/old/single_asset/single_asset_view.dart';
import 'package:crypto_app/old/utils/currency_formatters.dart';
import 'package:crypto_app/old/widgets/percentage_change_box.dart';

class AssetsDataTable extends StatelessWidget {
  final List<Asset> assetsList;
  final Function(Asset, bool) onFavourite;
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
                label: Text('Change', style: TextStyle(fontWeight: FontWeight.w600)),
                numeric: true),
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

  DataRow buildDataRow(Asset a, BuildContext context) {
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
                    onFavourite: (String id, bool isChecked) {
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
            Text(a.rank),
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
          DataCell(Text(readableCurrencyFormat.format(a.marketCapUsd))),
          DataCell(Text(coinCurrencyFormat(a.priceUsd).format(a.priceUsd))),
          DataCell(a.changePercent24Hr != null
              ? PercentageChangeBox(a.changePercent24Hr!)
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
