import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreference {
  static const THEME_STATUS = "THEMESTATUS";

  setDarkTheme(bool value) async {
    debugPrint("setDarkTheme = $value");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    debugPrint("getTheme = ${prefs.getBool(THEME_STATUS) ?? false}");
    return prefs.getBool(THEME_STATUS) ?? false;
  }
}
