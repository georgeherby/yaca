// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:cached_network_image/cached_network_image.dart';

// 🌎 Project imports:
import 'package:yaca/ui/views/widgets/asset_text_icon.dart';

class AssetNetworkIcon extends StatelessWidget {
  const AssetNetworkIcon(this.iconUrl,
      {Key? key, required this.assetSymbol, required this.iconSize})
      : super(key: key);

  final String iconUrl;
  final String assetSymbol;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: iconUrl,
      filterQuality: FilterQuality.high,
      width: iconSize,
      height: iconSize,
      imageBuilder: (context, imageProvider) => Container(
        width: iconSize,
        height: iconSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      errorWidget: (context, url, error) {
        debugPrint(error.toString());
        return AssetTextIcon(assetSymbol: assetSymbol, iconSize: iconSize);
      },
    );
  }
}
