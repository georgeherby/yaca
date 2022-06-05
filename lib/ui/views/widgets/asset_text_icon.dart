// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class AssetTextIcon extends StatelessWidget {
  const AssetTextIcon(
      {super.key, required this.assetSymbol, required this.iconSize});

  final String assetSymbol;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      minRadius: iconSize / 2,
      maxRadius: iconSize / 2,
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Text(
        assetSymbol.toUpperCase(),
        overflow: TextOverflow.clip,
        maxLines: 1,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color:Theme.of(context).colorScheme.onPrimary),
      ),
    );
  }
}
