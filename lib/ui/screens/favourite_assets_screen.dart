import 'package:crypto_app/core/viewmodels/asset_view_model.dart';
import 'package:crypto_app/old/market/assets_data_table.dart';
import 'package:crypto_app/old/models/assets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteAssetsScreen extends StatelessWidget {
  const FavouriteAssetsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<AssetViewModel>(builder: (BuildContext context, AssetViewModel ase, _) {
      return ase.favourites.length > 0
          ? AssetsDataTable(
              assetsList: ase.favourites,
              onFavourite: (Asset a, bool isChecked) => ase.setFavourite(a, isChecked),
            )
          : Center(
              child: Text("No favourites"),
            );
    }));
  }
}
