// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:yaca/ui/consts/constants.dart';

class FilledCard extends StatelessWidget {
  const FilledCard({
    super.key,
    required this.child,
    this.contentPadding,
    this.fullScreen = false,
  });
  final EdgeInsets? contentPadding;
  final Widget child;
  final bool fullScreen;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kCornerRadiusCircular),
      ),
      color: Theme.of(context).colorScheme.surfaceVariant,
      surfaceTintColor: Theme.of(context).colorScheme.surfaceTint,
      elevation: 0,
      child: Padding(
        padding: contentPadding ?? EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
