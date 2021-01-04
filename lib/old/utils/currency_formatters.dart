import 'package:intl/intl.dart';

extension CurrencuFormatters on num {
  String coinCurrencyFormat() {
    return new NumberFormat.currency(
            locale: "en_GB", symbol: "\£", decimalDigits: this.toInt() >= 3 ? 2 : 5)
        .format(this);
  }

  String deltaFormat() {
    String formatString = this.toInt() >= 3 ? "##,###,###,###.00" : "##,###,###,##0.00###";

    return new NumberFormat(
      this > 0 ? "+" + formatString : formatString,
      "en_GB",
    ).format(this);
  }
}

NumberFormat readableCurrencyFormat = new NumberFormat.compactCurrency(
  decimalDigits: 2,
  symbol: "\£",
  locale: "en_GB",
);
