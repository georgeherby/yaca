import 'package:crypto_app/core/preferences/dark_theme_preference.dart';
import 'package:crypto_app/old/models/settings/chosen_currency.dart';
import 'package:flutter/material.dart';

class AppSettingsViewModel with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool _darkThemeEnabled = false;

  bool get darkTheme => _darkThemeEnabled;

  set darkTheme(bool value) {
    _darkThemeEnabled = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }

  void invertTheme() async {
    debugPrint("invertTheme was = $_darkThemeEnabled");
    _darkThemeEnabled = !_darkThemeEnabled;
    await darkThemePreference.setDarkTheme(_darkThemeEnabled);
    debugPrint("invertTheme was = $_darkThemeEnabled");
    notifyListeners();
  }

  ChosenCurrency get chosenCurrency =>
      ChosenCurrency(currencyName: "British Pound", currencyCode: "gbp", currencySymbol: "\£");
}
