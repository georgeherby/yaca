// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectableIcon extends StatelessWidget {
  final IconData selectedIcon;
  final IconData unSelectedIcon;
  final bool isSelected;
  final double size;

  const SelectableIcon(
      {Key? key,
      required this.selectedIcon,
      required this.unSelectedIcon,
      required this.isSelected,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FaIcon(
      isSelected ? FontAwesomeIcons.solidStar : FontAwesomeIcons.star,
      size: size,
      color: isSelected
          ? Color(0xFFE4B256)
          : (Theme.of(context).brightness == Brightness.dark
              ? Colors.white24
              : Colors.black26),
    );
  }
}
