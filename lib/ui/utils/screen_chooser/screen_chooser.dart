// 🐦 Flutter imports:
import 'package:flutter/material.dart';

enum ScreenSize { small, medium, large }
extension PlatformFunctions on TargetPlatform {
  bool isMobilePlatform() {
    return [TargetPlatform.android, TargetPlatform.iOS].contains(this);
  }

  bool isDesktopPlatform() {
    return [TargetPlatform.windows, TargetPlatform.linux, TargetPlatform.macOS]
        .contains(this);
  }
}

extension ScreenTypeChecker on ScreenSize {
  bool isSmall() {
    return this == ScreenSize.small;
  }

  bool isMedium() {
    return this == ScreenSize.medium;
  }

  bool isLarge() {
    return this == ScreenSize.large;
  }
}

ScreenSize getScreenSize(Size size, TargetPlatform targetPlatform, bool isWeb) {
  var deviceWidth = size.shortestSide;

  if (isWeb || targetPlatform.isDesktopPlatform()) {
    deviceWidth = size.width;
  }

  if (deviceWidth >= 950) {
    return ScreenSize.large;
  } else if (deviceWidth >= 600) {
    return ScreenSize.medium;
  }
  return ScreenSize.small;
}
