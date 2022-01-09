// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:responsive_builder/responsive_builder.dart';

// 🌎 Project imports:
import 'package:yaca/ui/consts/constants.dart';

class MaterialSurface extends StatelessWidget {
  final EdgeInsets? externalPadding;
  final EdgeInsets? contentPadding;
  final Widget child;
  final bool fullScreen;

  const MaterialSurface({
    Key? key,
    required this.child,
    this.externalPadding,
    this.contentPadding,
    this.fullScreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: externalPadding ?? EdgeInsets.zero,
        child: Material(
            borderRadius: fullScreen
                ? getValueForScreenType<BorderRadius>(
                    context: context,
                    mobile: const BorderRadius.only(
                        topLeft: Radius.circular(kCornerRadiusCirlcular),
                        topRight: Radius.circular(kCornerRadiusCirlcular)),
                    tablet: BorderRadius.circular(kCornerRadiusCirlcular),
                    desktop: BorderRadius.circular(kCornerRadiusCirlcular))
                : BorderRadius.circular(kCornerRadiusCirlcular),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: Theme.of(context).cardTheme.elevation!,
            child: Padding(
              padding: contentPadding ?? EdgeInsets.zero,
              child: child,
            )));
  }
}
