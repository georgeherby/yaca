import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreferenceRepository {
  static const DARK_THEME = 'DARKTHEME';

  Future setDarkTheme(bool value) async {
    debugPrint('setDarkTheme = $value');
    var prefs = await SharedPreferences.getInstance();
    await prefs.setBool(DARK_THEME, value);
  }

  //TODO Add support for System preference
  Future<bool> isDarkTheme() async {
    var prefs = await SharedPreferences.getInstance();
    debugPrint('getTheme = ${prefs.getBool(DARK_THEME) ?? false}');
    return prefs.getBool(DARK_THEME) ?? false;
  }

  void invertTheme() async {
    var isDarkThemeBeforeInvert = await isDarkTheme();
    debugPrint('invertTheme was = $isDarkThemeBeforeInvert');
    var isDarkThemeAfterInvert = !isDarkThemeBeforeInvert;
    await setDarkTheme(isDarkThemeAfterInvert);
    debugPrint('invertTheme was = $isDarkThemeAfterInvert');
  }
}
