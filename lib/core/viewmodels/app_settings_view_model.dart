import 'package:crypto_app/core/preferences/dark_theme_preference.dart';
import 'package:flutter/material.dart';

class AppSettingsViewModel with ChangeNotifier {
  DarkThemePreferenceRepository darkThemePreference = DarkThemePreferenceRepository();
  // CurrencyPreferenceRepository currencyPreference = CurrencyPreferenceRepository();
  // bool _darkThemeEnabled = false;

  // ChosenCurrency _chosenCurrency = ChosenCurrency(
  //     currencyName: "British Pound", currencyCode: "GBP", currencySymbol: "\£");

  //TODO Add back default
  // ChosenCurrency _chosenCurrency = AvailableCurrencies.defaultCurrency;

  // bool get darkTheme => _darkThemeEnabled;

  // set darkTheme(bool value) {
  //   _darkThemeEnabled = value;
  //   darkThemePreference.setDarkTheme(value);
  //   notifyListeners();
  // }



  // ChosenCurrency get chosenCurrency => _chosenCurrency;

  // set chosenCurrency(ChosenCurrency value) {
  //   _chosenCurrency = value;
  //   currencyPreference.set(value.currencyCode);
  //   notifyListeners();
  // }
}
