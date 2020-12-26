import 'package:crypto_app/core/viewmodels/asset_view_model.dart';
import 'package:crypto_app/old/market/assets_data_table.dart';
import 'package:crypto_app/old/market/widgets/app_bar_static.dart';
import 'package:crypto_app/old/models/assets.dart';
import 'package:crypto_app/old/models/market_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MarketView extends StatelessWidget {
  final MarketDetails marketDetails;

  const MarketView({Key? key, required this.marketDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStatic(marketDetails: marketDetails),
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: constraint.maxWidth),
                child: IntrinsicWidth(
                  child: Consumer<AssetViewModel>(
                    builder: (BuildContext context, AssetViewModel ase, _) {
                      return ase.hasLoaded
                          ? AssetsDataTable(
                              assetsList: ase.assetList,
                              onFavourite: (Asset a, bool isChecked) =>
                                  ase.setFavourite(a, isChecked),
                            )
                          : Center(child: CupertinoActivityIndicator());
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
