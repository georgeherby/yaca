// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:shared_preferences/shared_preferences.dart';

class CurrencyPreferenceRepository {
  static const CURRENCY_CODE = 'CHOSEN_CURRRENCY_CODE';
  static const DEFAULT_CURRENCY = 'USD';

  Future set(String value) async {
    var formattedValue = value.toUpperCase();
    debugPrint('CurrencyPreference.set = $formattedValue');
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(CURRENCY_CODE, formattedValue);
  }

  Future<String> get() async {
    var prefs = await SharedPreferences.getInstance();
    var preference = prefs.getString(CURRENCY_CODE);

    debugPrint('CurrencyPreference.get = $preference');
    return (preference ?? DEFAULT_CURRENCY).toUpperCase();
  }
}
