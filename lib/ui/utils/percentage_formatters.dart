// 📦 Package imports:
import 'package:intl/intl.dart';

NumberFormat percentageFormat =
    NumberFormat.decimalPercentPattern(locale: 'en_US', decimalDigits: 2);

NumberFormat percentageFormatWithoutNegative =
    NumberFormat('##,###,###,##0.00%');
