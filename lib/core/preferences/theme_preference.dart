// 🐦 Flutter imports:
import 'package:crypto_app/core/extensions/theme_mode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferenceRepository {
  static const THEME_MODE = 'THEME_MODE';

  Future setThemeMode(ThemeMode themeMode) async {
    debugPrint('setThemeMode = $themeMode');
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(THEME_MODE, themeMode.toStr());
  }

  Future<ThemeMode> getThemeMode() async {
    var prefs = await SharedPreferences.getInstance();
    debugPrint('getTheme = ${prefs.getString(THEME_MODE)}');

    if (prefs.getString(THEME_MODE) != null) {
      return prefs.getString(THEME_MODE)!.toThemeMode();
    } else {
      return ThemeMode.system;
    }
  }
}
