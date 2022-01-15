// 🌎 Project imports:
import 'package:yaca/core/models/api/coingecko/single_asset_data/common/double_per_currency.dart';
import 'package:yaca/core/models/settings/chosen_currency.dart';

extension DoublePerCurrencyExt on DoublePerCurrency {
  double? getValueForCurrency(ChosenCurrency _chosenCurrency) {
    switch (_chosenCurrency.currencyCode.toUpperCase()) {
      // Fiat
      case 'GBP':
        return gbp;
      case 'USD':
        return usd;
      case 'EUR':
        return eur;

      // Crypto
      case 'BTC':
        return btc;
      case 'ETH':
        return eth;
      case 'LTC':
        return ltc;
      default:
        throw Exception(
            "Currency not supported ${_chosenCurrency.currencyCode}");
    }
  }
}
