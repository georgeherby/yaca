// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:

// 🌎 Project imports:

class MaterialSurface extends StatelessWidget {
  final EdgeInsets? contentPadding;
  final Widget child;
  final bool fullScreen;

  const MaterialSurface({
    super.key,
    required this.child,
    this.contentPadding,
    this.fullScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: contentPadding ?? EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
