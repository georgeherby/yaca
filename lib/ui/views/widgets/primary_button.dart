// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key, required this.buttonText, required this.onTap})
      : super(key: key);

  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      onPressed: onTap,
      child: Text(
        buttonText,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
