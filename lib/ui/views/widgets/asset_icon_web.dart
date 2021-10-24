import 'package:crypto_app/ui/utils/web_builder/web_builder.dart';
import 'package:crypto_app/ui/views/widgets/asset_network_icon.dart';
import 'package:crypto_app/ui/views/widgets/asset_text_icon.dart';
import 'package:flutter/material.dart';

class AssetIconWeb extends StatelessWidget {
  const AssetIconWeb(this.iconUrl,
      {Key? key, required this.assetSymbol, required this.iconSize})
      : super(key: key);

  final String iconUrl;
  final String assetSymbol;
  final double iconSize;
  @override
  Widget build(BuildContext context) {
    return WebBuilder(
      web: AssetTextIcon(
        iconSize: iconSize,
        assetSymbol: assetSymbol,
      ),
      other: AssetNetworkIcon(
        iconUrl,
        assetSymbol: assetSymbol,
        iconSize: iconSize,
      ),
    );
  }
}
