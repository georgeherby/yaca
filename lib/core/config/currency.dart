// 🌎 Project imports:
import 'package:yaca/core/models/settings/chosen_currency.dart';
import 'package:yaca/ui/views/widgets/icons/svg_icon.dart';

class AvailableCurrencies {
  static ChosenCurrency usd = const ChosenCurrency(
    currencyName: 'US Dollar',
    currencyCode: 'USD',
    currencyType: CurrencyType.fiat,
    currencyIcon: SvgIcon('assets/fiat_icons/usd.svg'),
    currencyString: '\$',
  );

  static ChosenCurrency eur = const ChosenCurrency(
    currencyName: 'Euro',
    currencyCode: 'EUR',
    currencyType: CurrencyType.fiat,
    currencyIcon: SvgIcon('assets/fiat_icons/eur.svg'),
    currencyString: '€',
  );

  static ChosenCurrency gbp = const ChosenCurrency(
    currencyName: 'British Pound',
    currencyCode: 'GBP',
    currencyType: CurrencyType.fiat,
    currencyIcon: SvgIcon('assets/fiat_icons/gbp.svg'),
    currencyString: '£',
  );

  static ChosenCurrency btc = const ChosenCurrency(
    currencyName: 'Bitcoin',
    currencyCode: 'BTC',
    currencyType: CurrencyType.crypto,
    currencyIcon: SvgIcon('assets/crypto_icons/btc.svg'),
    currencyString: '₿',
  );

  static ChosenCurrency eth = const ChosenCurrency(
    currencyName: 'Ethereum',
    currencyCode: 'ETH',
    currencyType: CurrencyType.crypto,
    currencyIcon: SvgIcon('assets/crypto_icons/eth.svg'),
    currencyString: 'Ξ',
  );
  static ChosenCurrency ltc = const ChosenCurrency(
    currencyName: 'Litecoin',
    currencyCode: 'LTC',
    currencyType: CurrencyType.crypto,
    currencyIcon: SvgIcon('assets/crypto_icons/ltc.svg'),
    currencyString: 'Ł',
  );

  //Taken out due to issues with number formatting on mobile home screen
  // static ChosenCurrency bnb = const ChosenCurrency(
  //   currencyName: 'Binance Coin',
  //   currencyCode: 'BNB',
  //   currencyType: CurrencyType.crypto,
  //   currencyIcon: SvgIcon("assets/crypto_icons/bnb.svg"),
  //   currencyString: 'BNB',
  // );

  static List<ChosenCurrency> get listOfAvailableCurrencies => [
        btc,
        eth,
        ltc,
        eur,
        gbp,
        usd,
      ];

  static ChosenCurrency get defaultCurrency => usd;
}
