import 'package:crypto_app/ui/consts/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension ThemeModeToString on ThemeMode {
  String toStr() {
    switch (this) {
      case ThemeMode.dark:
        return kDARK_MODE;
      case ThemeMode.light:
        return kLIGHT_MODE;
      case ThemeMode.system:
      default:
        return kSYSTEM_MODE;
    }
  }

  IconData toIcon() {
    switch (this) {
      case ThemeMode.dark:
        return CupertinoIcons.moon;
      case ThemeMode.light:
        return CupertinoIcons.sun_max;
      case ThemeMode.system:
      default:
        return CupertinoIcons.phone;
    }
  }
}

extension StringToThemeMode on String {
  ThemeMode toThemeMode() {
    switch (this) {
      case kDARK_MODE:
        return ThemeMode.dark;
      case kLIGHT_MODE:
        return ThemeMode.light;
      case kSYSTEM_MODE:
      default:
        return ThemeMode.system;
    }
  }
}
