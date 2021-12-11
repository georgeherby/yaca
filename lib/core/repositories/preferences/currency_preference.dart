// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:shared_preferences/shared_preferences.dart';

class CurrencyPreferenceRepository {
  static const currencyCode = 'CHOSEN_CURRRENCY_CODE';
  static const defaultCurrency = 'USD';

  Future set(String value) async {
    var formattedValue = value.toUpperCase();
    debugPrint('CurrencyPreference.set = $formattedValue');
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(currencyCode, formattedValue);
  }

  Future<String> get() async {
    var prefs = await SharedPreferences.getInstance();
    var preference = prefs.getString(currencyCode);

    debugPrint('CurrencyPreference.get = $preference');
    return (preference ?? defaultCurrency).toUpperCase();
  }
}
