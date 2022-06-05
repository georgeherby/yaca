// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:yaca/ui/consts/constants.dart';

class ElevatedCard extends StatelessWidget {
  const ElevatedCard({
    super.key,
    required this.child,
    this.contentPadding,
    this.margin,
    this.fullScreen = false,
  });
  final EdgeInsets? contentPadding;
  final EdgeInsets? margin;
  final Widget child;
  final bool fullScreen;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kCornerRadiusCirlcular),
      ),
      elevation: 1,
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: contentPadding ?? EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
