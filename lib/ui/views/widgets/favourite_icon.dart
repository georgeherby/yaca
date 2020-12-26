// 🐦 Flutter imports:
import 'package:crypto_app/ui/consts/colours.dart';
// 🌎 Project imports:
import 'package:crypto_app/ui/views/widgets/selectable_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FavouriteIcon extends StatelessWidget {
  final bool isSelected;
  final double size;

  const FavouriteIcon({Key? key, required this.isSelected, this.size = 32});

  @override
  Widget build(BuildContext context) {
    return SelectableIcon(
      selectedIcon: FontAwesomeIcons.solidStar,
      unSelectedIcon: FontAwesomeIcons.star,
      isSelected: isSelected,
      size: size,
      selectedColor: kGold,
    );
  }
}
