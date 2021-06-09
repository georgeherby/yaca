// 🌎 Project imports:
import 'package:crypto_app/core/config/currency.dart';
import 'package:crypto_app/core/models/api/coingecko/global_market.dart';
import 'package:crypto_app/core/models/settings/chosen_currency.dart';

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

extension TotalMarketCapForCurrency on TotalMarketCap {
  double getForCurrency(String currency) {
    switch (currency.toUpperCase()) {
      case 'GBP':
        return gbp;
      case 'USD':
        return usd;
      case 'BTC':
        return btc;
      default:
        return usd;
    }


  }
}
