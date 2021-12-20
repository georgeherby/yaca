// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:crypto_app/ui/consts/constants.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(
      {Key? key, required this.buttonText, required this.onTap})
      : super(key: key);

  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kCornerRadiusCirlcular)),
      ),
      onPressed: onTap,
      child: Text(
        buttonText,
        style: TextStyle(color: Theme.of(context).textTheme.button?.color),
      ),
    );
  }
}
