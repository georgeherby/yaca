// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';

// 🌎 Project imports:
import 'package:yaca/ui/views/asset/asset_view.dart';

class AssetDetailsPage extends StatelessWidget {
  const AssetDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final coinId = context.routeData.inheritedPathParams.getString('assetId');
    return AssetView(id: coinId);
  }
}
