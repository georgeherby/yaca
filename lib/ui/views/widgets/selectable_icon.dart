// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectableIcon extends StatelessWidget {
  final IconData selectedIcon;
  final IconData unSelectedIcon;
  final bool isSelected;
  final double size;
  final Color selectedColor;

  const SelectableIcon({   
    Key? key,
    required this.selectedIcon,
    required this.unSelectedIcon,
    required this.isSelected,
    required this.size,
    required this.selectedColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FaIcon(
      isSelected ? FontAwesomeIcons.solidStar : FontAwesomeIcons.star,
      size: size,
      color: isSelected
          ? selectedColor
          : (Theme.of(context).brightness == Brightness.dark
              ? Colors.white24
              : Colors.black26),
    );
  }
}
