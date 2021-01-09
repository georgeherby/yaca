import 'package:intl/intl.dart';

extension CurrencuFormatters on num {
  String coinCurrencyFormat() {
    return NumberFormat.currency(
            locale: "en_GB",
            symbol: "\£",
            decimalDigits: this.toInt() >= 2 || this.toInt() <= -2 ? 2 : 5)
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
