// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:intl/intl.dart';

extension CurrencyFormatters on num {
  String currencyFormatWithPrefix(String currencyPrefix, BuildContext context,
      [bool showDecimals = true]) {
    var formatString = toInt() >= 10000
        ? '##,###,###,###'
        : toInt() >= 2 || toInt() <= -2
            ? '##,###,###,###.00'
            : '##,###,###,##0.00###';

    return NumberFormat(
      currencyPrefix + formatString,
      Localizations.localeOf(context).toString(),
    ).format(this);
  }

  String deltaFormat() {
    var formatString = toInt() >= 2 || toInt() <= -2
        ? '##,###,###,###.00'
        : '##,###,###,##0.00##';

    return NumberFormat(
      formatString,
      'en_GB',
    ).format(abs());
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
