import 'package:crypto_app/old/widgets/asset_graph_with_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'package:crypto_app/core/viewmodels/asset_view_model.dart';
import 'package:crypto_app/old/api/assets_api.dart';
import 'package:crypto_app/old/models/asset_history.dart';
import 'package:crypto_app/old/models/assets.dart';

class SingleAssetView extends StatelessWidget {
  final Asset asset;
  final Function(String, bool) onFavourite;

  const SingleAssetView({
    Key? key,
    required this.asset,
    required this.onFavourite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          asset.name,
        ),
        elevation: 0,
        brightness: Theme.of(context).brightness,
        leading: IconButton(
          icon: Icon(CupertinoIcons.xmark),
          onPressed: () => Navigator.pop(context),
          color: Theme.of(context).appBarTheme.iconTheme?.color,
        ),
        actions: [
          Consumer<AssetViewModel>(builder: (BuildContext context, AssetViewModel ase, _) {
            return IconButton(
              icon: Icon(
                asset.isFavourited ? CupertinoIcons.star_fill : CupertinoIcons.star,
                color: asset.isFavourited
                    ? Color(0xFFF4C622)
                    : (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white24
                        : Colors.black26),
              ),
              onPressed: () => onFavourite(asset.id, asset.isFavourited),
            );
          })
        ],
      ),
      body: FutureBuilder(
        future: fetchFullAssetHistory(http.Client(), asset.id.toLowerCase()),
        builder: (BuildContext context, AsyncSnapshot<AssetHisotrySplits> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            print(snapshot.stackTrace);
          }

          return snapshot.hasData
              ? AssetGraphWithSwitcher(allHistory: snapshot.data!)
              : Center(
                  child: CupertinoActivityIndicator(),
                );
        },
      ),
    );
  }
}
