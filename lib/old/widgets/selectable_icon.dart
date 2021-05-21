// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return Icon(
      isSelected ? CupertinoIcons.star_fill : CupertinoIcons.star,
      size: size,
      color: isSelected
          ? Color(0xFFF4C622)
          : (Theme.of(context).brightness == Brightness.dark ? Colors.white24 : Colors.black26),
    );
  }
}
