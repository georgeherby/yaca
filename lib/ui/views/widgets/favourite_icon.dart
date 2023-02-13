// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:

// 🌎 Project imports:
import 'package:yaca/ui/constants/colours.dart';
import 'package:yaca/ui/views/widgets/selectable_icon.dart';

class FavouriteIcon extends StatelessWidget {
  const FavouriteIcon({super.key, required this.isSelected, this.size = 32});
  final bool isSelected;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SelectableIcon(
      selectedIcon: Icons.star_rounded,
      unSelectedIcon: Icons.star_outline_rounded,
      isSelected: isSelected,
      size: size,
      selectedColor: kYellow,
    );
  }
}
