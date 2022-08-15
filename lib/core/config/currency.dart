// 🌎 Project imports:
import 'package:flutter/material.dart';
import 'package:yaca/core/models/settings/chosen_currency.dart';

class AvailableCurrencies {
  static ChosenCurrency usd = const ChosenCurrency(
    currencyName: 'US Dollar',
    currencyCode: 'USD',
    currencyType: CurrencyType.fiat,
    currencyIcon: Icons.attach_money_rounded,
    currencyString: '\$',
  );

  static ChosenCurrency eur = const ChosenCurrency(
    currencyName: 'Euro',
    currencyCode: 'EUR',
    currencyType: CurrencyType.fiat,
    currencyIcon: Icons.euro_rounded,
    currencyString: '€',
  );

  static ChosenCurrency gbp = const ChosenCurrency(
    currencyName: 'British Pound',
    currencyCode: 'GBP',
    currencyType: CurrencyType.fiat,
    currencyIcon: Icons.currency_pound_rounded,
    currencyString: '£',
  );

  static ChosenCurrency btc = const ChosenCurrency(
    currencyName: 'Bitcoin',
    currencyCode: 'BTC',
    currencyType: CurrencyType.crypto,
    currencyIcon: Icons.currency_bitcoin_rounded,
    currencyString: '₿',
  );

  //Took out as no Material Icons for this currency
  // static ChosenCurrency eth = const ChosenCurrency(
  //   currencyName: 'Ethereum',
  //   currencyCode: 'ETH',
  //   currencyType: CurrencyType.crypto,
  //   currencyIcon: SvgIcon('assets/crypto_icons/eth.svg'),
  //   currencyString: 'Ξ',
  // );

  //Took out as no Material Icons for this currency
  // static ChosenCurrency ltc = const ChosenCurrency(
  //   currencyName: 'Litecoin',
  //   currencyCode: 'LTC',
  //   currencyType: CurrencyType.crypto,
  //   currencyIcon: SvgIcon('assets/crypto_icons/ltc.svg'),
  //   currencyString: 'Ł',
  // );

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
        eur,
        gbp,
        usd,
      ];

  static ChosenCurrency get defaultCurrency => usd;
}
