// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 🌎 Project imports:
import 'package:yaca/ui/consts/constants.dart';

extension ThemeModeToString on ThemeMode {
  String toStr() {
    switch (this) {
      case ThemeMode.dark:
        return kDarkMode;
      case ThemeMode.light:
        return kLightMode;
      case ThemeMode.system:
      default:
        return kSystemMode;
    }
  }

  IconData? toIcon() {
    switch (this) {
      case ThemeMode.dark:
        return FontAwesomeIcons.moon;
      case ThemeMode.light:
        return FontAwesomeIcons.sun;
      case ThemeMode.system:
      default:
        return null;
    }
  }
}

extension StringToThemeMode on String {
  ThemeMode toThemeMode() {
    switch (this) {
      case kDarkMode:
        return ThemeMode.dark;
      case kLightMode:
        return ThemeMode.light;
      case kSystemMode:
      default:
        return ThemeMode.system;
    }
  }
}
