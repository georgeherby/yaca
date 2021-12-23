// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:ionicons/ionicons.dart';

class BackChevronButton extends StatelessWidget {
  final VoidCallback onTapped;

  const BackChevronButton({Key? key, required this.onTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTapped,
      child: Icon(
        Ionicons.chevron_back_outline,
        size: 20,
        color: Theme.of(context).iconTheme.color,
      ),
    );
  }
}
