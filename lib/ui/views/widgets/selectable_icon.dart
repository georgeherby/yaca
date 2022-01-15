// 🐦 Flutter imports:
import 'package:flutter/material.dart';

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
    return Icon(
      isSelected ? selectedIcon : unSelectedIcon,
      size: size,
      color: isSelected
          ? selectedColor
          : (Theme.of(context).brightness == Brightness.dark
              ? Colors.white24
              : Colors.black26),
    );
  }
}
