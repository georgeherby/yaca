// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';

// 🌎 Project imports:
import 'package:yaca/ui/views/single_asset/singel_asset_view.dart';

class AssetDetailsPage extends StatelessWidget {
  const AssetDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final coinId = context.routeData.inheritedPathParams.getString('assetId');
    return SingleAssetView(id: coinId);
  }
}
