// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:shared_preferences/shared_preferences.dart';

// 🌎 Project imports:
import 'package:crypto_app/core/extensions/theme_mode.dart';

class ThemePreferenceRepository {
  static const thememode = 'THEME_MODE';

  Future setThemeMode(ThemeMode themeMode) async {
    debugPrint('setThemeMode = $themeMode');
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(thememode, themeMode.toStr());
  }

  Future<ThemeMode> getThemeMode() async {
    var prefs = await SharedPreferences.getInstance();
    debugPrint('getTheme = ${prefs.getString(thememode)}');

    if (prefs.getString(thememode) != null) {
      return prefs.getString(thememode)!.toThemeMode();
    } else {
      return ThemeMode.system;
    }
  }
}
