// 🎯 Dart imports:
import 'dart:convert';

// 📦 Package imports:
import 'package:coingecko_api/helpers/helpers.dart';

var maxMonths = Helpers.parseMarketChartData(
  json.decode('''
 {
  "prices": [
    [
      1367107200000,
      86.889
    ],
    [
      1367193600000,
      93.0697
    ],
    [
      1367280000000,
      89.8481
    ],
    [
      1367366400000,
      74.9767
    ]
  ]
}
  '''),
);
