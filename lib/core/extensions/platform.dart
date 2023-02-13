// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';

// 📦 Package imports:
import 'package:responsive_builder/responsive_builder.dart';

extension PlatformCheck on TargetPlatform {
  bool phoneOrTablet() {
    return [TargetPlatform.android, TargetPlatform.iOS].contains(this);
  }

  bool onlyMobile(BuildContext context) {
    return [TargetPlatform.iOS, TargetPlatform.android].contains(this) &&
        MediaQuery.of(context).size.width <
            ResponsiveSizingConfig.instance.breakpoints.tablet;
  }

  bool isDesktop() {
    return [TargetPlatform.macOS, TargetPlatform.windows, TargetPlatform.linux]
        .contains(this);
  }

  bool isMacOnly() {
    return [TargetPlatform.macOS].contains(this);
  }
}
