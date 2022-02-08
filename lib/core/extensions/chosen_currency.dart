// 🌎 Project imports:
import 'package:yaca/core/config/currency.dart';
import 'package:yaca/core/models/settings/chosen_currency.dart';

extension ChosenCurrencyExtension on String {
  ChosenCurrency toChosenCurrency() {
    switch (toUpperCase()) {
      case 'GBP':
        return AvailableCurrencies.gbp;
      case 'USD':
        return AvailableCurrencies.usd;
      case 'BTC':
        return AvailableCurrencies.btc;
      default:
        return AvailableCurrencies.defaultCurrency;
    }
  }
}

extension TotalMarketCapForCurrency on Map {
  double? getForCurrency(String currency) {
    return this[currency.toLowerCase()];
  }
}
