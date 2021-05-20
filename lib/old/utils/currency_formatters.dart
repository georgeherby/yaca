import 'package:intl/intl.dart';

extension CurrencyFormatters on num {
  String currencyFormatWithPrefix(String currencyPrefix, [bool showDecimals = true]) {
    return NumberFormat.currency(
      //TODO Add in locale
            symbol: currencyPrefix + ' ',
            decimalDigits: showDecimals
                ? toInt() >= 1000 || toInt() <= -1000
                    ? 0
                    : toInt() >= 2 || toInt() <= -2
                        ? 2
                        : 4
                : 0)
        .format(this);
  }

  String deltaFormat() {
    var formatString =
        toInt() >= 2 || toInt() <= -2 ? '##,###,###,###.00' : '##,###,###,##0.00###';

    return NumberFormat(
      this > 0 ? '+' + formatString : formatString,
      'en_GB',
    ).format(this);
  }

  String volumeFormat() {
    var formatString =
        toInt() >= 2 || toInt() <= -2 ? '##,###,###,###.00' : '##,###,###,##0.00###';

    return NumberFormat(
      formatString,
      'en_GB',
    ).format(this);
  }
}

NumberFormat compactCurrencyFormat = NumberFormat.compactSimpleCurrency(
  decimalDigits: 2,
  locale: 'en_GB',
);

NumberFormat compactNumberFormat = NumberFormat.compactLong(
  locale: 'en_GB',
);
