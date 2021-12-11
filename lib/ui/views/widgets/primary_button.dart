// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:crypto_app/ui/consts/constants.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key, required this.buttonText, required this.onTap})
      : super(key: key);

  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kCornerRadiusCirlcular)),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      onPressed: onTap,
      child: Text(
        buttonText,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
