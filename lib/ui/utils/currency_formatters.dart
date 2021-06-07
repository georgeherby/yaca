// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:intl/intl.dart';

extension CurrencyFormatters on num {
  String currencyFormatWithPrefix(String currencyPrefix, BuildContext context,
      [bool showDecimals = true]) {
    return NumberFormat.currency(
            locale: Localizations.localeOf(context).toString(),
            symbol: currencyPrefix,
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
    var formatString = toInt() >= 2 || toInt() <= -2
        ? '##,###,###,###.00'
        : '##,###,###,##0.00###';

    return NumberFormat(
      this > 0 ? '+' + formatString : formatString,
      'en_GB',
    ).format(this);
  }

  String volumeFormat(BuildContext context) {
    var formatString = toInt() >= 2 || toInt() <= -2
        ? '##,###,###,###.00'
        : '##,###,###,##0.00###';

    return NumberFormat(
      formatString,
      Localizations.localeOf(context).toString(),
    ).format(this);
  }
}

NumberFormat compactCurrencyFormat(BuildContext context) {
  return NumberFormat.compactSimpleCurrency(
      decimalDigits: 2, locale: Localizations.localeOf(context).toString());
}

NumberFormat compactNumberFormat(BuildContext context) {
  return NumberFormat.compactLong(
      locale: Localizations.localeOf(context).toString());
}
