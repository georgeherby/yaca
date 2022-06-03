// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:yaca/ui/utils/web_builder/web_builder.dart';
import 'package:yaca/ui/views/widgets/asset_network_icon.dart';
import 'package:yaca/ui/views/widgets/asset_text_icon.dart';

class AssetIconWeb extends StatelessWidget {
  const AssetIconWeb(this.iconUrl,
      {super.key, required this.assetSymbol, required this.iconSize});

  final String? iconUrl;
  final String assetSymbol;
  final double iconSize;
  @override
  Widget build(BuildContext context) {
    return iconUrl != null
        ? WebBuilder(
            web: AssetTextIcon(
              iconSize: iconSize,
              assetSymbol: assetSymbol,
            ),
            other: AssetNetworkIcon(
              iconUrl!,
              assetSymbol: assetSymbol,
              iconSize: iconSize,
            ),
          )
        : AssetTextIcon(
            iconSize: iconSize,
            assetSymbol: assetSymbol,
          );
  }
}
