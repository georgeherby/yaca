// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:yaca/ui/consts/constants.dart';

class TonalButton extends StatelessWidget {
  const TonalButton({super.key, required this.buttonText, required this.onTap});

  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: Theme.of(context).colorScheme.secondaryContainer,
        onSurface: Theme.of(context).colorScheme.onSurface,
        onPrimary: Theme.of(context).colorScheme.onSecondaryContainer,
        surfaceTintColor: Theme.of(context).colorScheme.surfaceTint,
        shadowColor: Theme.of(context).colorScheme.shadow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kCornerRadiusCirlcular),
        ),
      ),
      onPressed: onTap,
      child: Text(
        buttonText,
        style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
      ),
    );
  }
}
