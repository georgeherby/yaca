import 'package:intl/intl.dart';

extension CurrencuFormatters on num {
  String coinCurrencyFormat([String locale = 'en_GB', bool showDecimals = true]) {
    return NumberFormat.simpleCurrency(
            locale: locale,
            decimalDigits: showDecimals
                ? this.toInt() >= 2 || this.toInt() <= -2
                    ? 2
                    : 5
                : 0)
        .format(this);
  }

  String currencyFormatWithPrefix(String currencyPrefix, [bool showDecimals = true]) {
    return NumberFormat.currency(
            symbol: currencyPrefix + " ",
            decimalDigits: showDecimals
                ? this.toInt() >= 2 || this.toInt() <= -2
                    ? 2
                    : 5
                : 0)
        .format(this);
  }

  String deltaFormat() {
    String formatString =
        this.toInt() >= 2 || this.toInt() <= -2 ? "##,###,###,###.00" : "##,###,###,##0.00###";

    return new NumberFormat(
      this > 0 ? "+" + formatString : formatString,
      "en_GB",
    ).format(this);
  }
}

NumberFormat compactCurrencyFormat = NumberFormat.compactSimpleCurrency(
  decimalDigits: 2,
  locale: "en_GB",
);

NumberFormat compactNumberFormat = NumberFormat.compactLong(
  locale: "en_GB",
);
