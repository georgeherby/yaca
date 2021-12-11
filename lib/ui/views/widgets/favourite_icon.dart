// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 🌎 Project imports:
import 'package:crypto_app/ui/consts/colours.dart';
import 'package:crypto_app/ui/views/widgets/selectable_icon.dart';

class FavouriteIcon extends StatelessWidget {
  final bool isSelected;
  final double size;

  const FavouriteIcon({Key? key, required this.isSelected, this.size = 32})
      : super(key: key);

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
