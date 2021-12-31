import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  final String assetPath;
  final double? size;
  final Color? color;

  const SvgIcon(this.assetPath, {Key? key, this.size, this.color})
      : super(key: key);

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
