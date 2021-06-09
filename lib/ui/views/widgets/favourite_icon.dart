// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:crypto_app/ui/views/widgets/selectable_icon.dart';

class FavouriteIcon extends StatelessWidget {
  final bool isSelected;
  final double size;

  const FavouriteIcon({Key? key, required this.isSelected, this.size = 32});

  @override
  Widget build(BuildContext context) {
    return SelectableIcon(
      selectedIcon: CupertinoIcons.star_fill,
      unSelectedIcon: CupertinoIcons.star,
      isSelected: isSelected,
      size: size,
    );
  }
}
