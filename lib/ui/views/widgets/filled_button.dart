// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:yaca/ui/consts/constants.dart';

class FilledButton extends StatelessWidget {
  const FilledButton(
      {super.key, required this.buttonText, required this.onTap});

  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 1,
        primary: Theme.of(context).colorScheme.primary,
        onSurface: Theme.of(context).colorScheme.onSurface,
        onPrimary: Theme.of(context).colorScheme.onPrimary,
        surfaceTintColor: Theme.of(context).colorScheme.surfaceTint,
        shadowColor: Theme.of(context).colorScheme.shadow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kCornerRadiusCirlcular),
        ),
      ),
      onPressed: onTap,
      child: Text(buttonText),
    );
  }
}
