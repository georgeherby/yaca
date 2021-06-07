// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';

extension PlatformCheck on TargetPlatform {
  bool isMobile() {
    return [TargetPlatform.android, TargetPlatform.iOS].contains(this);
  }
}