// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class SelectableIcon extends StatelessWidget {
  final IconData selectedIcon;
  final IconData unSelectedIcon;
  final bool isSelected;
  final double size;
  final Color selectedColor;

  const SelectableIcon({
    super.key,
    required this.selectedIcon,
    required this.unSelectedIcon,
    required this.isSelected,
    required this.size,
    required this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      isSelected ? selectedIcon : unSelectedIcon,
      size: size,
      color: isSelected
          ? selectedColor
          : (Theme.of(context).colorScheme.onSurface),
    );
  }
}
