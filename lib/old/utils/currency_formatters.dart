import 'package:intl/intl.dart';

NumberFormat coinCurrencyFormat(double? price) {
  return new NumberFormat.currency(
      locale: "en_GB", symbol: "\£", decimalDigits: (price ?? 0).toInt() >= 1 ? 2 : 5);
}

NumberFormat readableCurrencyFormat = new NumberFormat.compactCurrency(
  decimalDigits: 2,
  symbol: "\£",
  locale: "en_GB",
);
