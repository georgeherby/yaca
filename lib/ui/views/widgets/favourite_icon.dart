// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:ionicons/ionicons.dart';

// 🌎 Project imports:
import 'package:yaca/ui/consts/colours.dart';
import 'package:yaca/ui/views/widgets/selectable_icon.dart';

class FavouriteIcon extends StatelessWidget {
  final bool isSelected;
  final double size;

  const FavouriteIcon({super.key, required this.isSelected, this.size = 32});

  @override
  Widget build(BuildContext context) {
    return SelectableIcon(
      selectedIcon: Ionicons.star,
      unSelectedIcon: Ionicons.star_outline,
      isSelected: isSelected,
      size: size,
      selectedColor: kYellow,
    );
  }
}
