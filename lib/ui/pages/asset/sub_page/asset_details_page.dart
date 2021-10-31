// 🐦 Flutter imports:
import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/ui/views/asset/asset_view.dart';
import 'package:flutter/material.dart';

class AssetDetailsPage extends StatelessWidget {

  AssetDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var coinId = context.routeData.inheritedPathParams.getString('assetId');
    return AssetView(id: coinId);
  }
}
