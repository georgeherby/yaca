// 🌎 Project imports:
import 'package:crypto_app/old/models/settings/chosen_currency.dart';

class AvailableCurrencies {
  static ChosenCurrency usd = const ChosenCurrency(
      currencyName: 'US Dollar', currencyCode: 'USD', currencySymbol: '\$');

  static ChosenCurrency gbp = const ChosenCurrency(
      currencyName: 'British Pound', currencyCode: 'GBP', currencySymbol: '£');

  static ChosenCurrency btc = const ChosenCurrency(
      currencyName: 'Bitcoin', currencyCode: 'BTC', currencySymbol: '₿');

  static List<ChosenCurrency> get listOfAvailableCurrencies => [btc, usd, gbp];

  static ChosenCurrency get defaultCurrency => usd;
}
