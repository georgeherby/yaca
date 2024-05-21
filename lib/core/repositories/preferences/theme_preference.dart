// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:shared_preferences/shared_preferences.dart';

// 🌎 Project imports:
import 'package:yaca/core/extensions/theme_mode.dart';

class ThemePreferenceRepository {
  static const _themeMode = 'THEME_MODE';

  Future setThemeMode(ThemeMode themeMode) async {
    debugPrint('setThemeMode = $themeMode');
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeMode, themeMode.toStr());
  }

  Future<ThemeMode> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    debugPrint('getTheme = ${prefs.getString(_themeMode)}');

    if (prefs.getString(_themeMode) != null) {
      return prefs.getString(_themeMode)!.toThemeMode();
    } else {
      return ThemeMode.system;
    }
  }
}
