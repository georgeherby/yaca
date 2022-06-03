// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  final String assetPath;
  final double? size;
  final Color? color;

  const SvgIcon(this.assetPath, {super.key, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      height: size ?? Theme.of(context).iconTheme.size,
      width: size ?? Theme.of(context).iconTheme.size,
      color: color ?? Theme.of(context).iconTheme.color,
    );
  }
}
