// 🎯 Dart imports:
import 'dart:convert';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:http/http.dart' as http;

// 🌎 Project imports:
import 'package:yaca/core/models/api/coingecko/global_market.dart';
import 'package:yaca/core/models/settings/chosen_currency.dart';

class GlobalMarketRespository {
  final http.Client client;

  GlobalMarketRespository({required this.client});

  Future<GlobalMarket> fetchMarketOverview(ChosenCurrency currencyCode) async {
    debugPrint(
        'fetchMarketOverview called for currency ${currencyCode.currencyCode}');

    var url =
        'https://api.coingecko.com/api/v3/global?vs_currency=${currencyCode.currencyCode}';
    final response = await client.get(Uri.parse(url));

    debugPrint(response.statusCode.toString());
    if (response.statusCode != 200) {
      debugPrint(response.headers.toString());
      debugPrint('Error getting Market Overivew');
    }

    return GlobalMarket.fromJson(jsonDecode(response.body));
  }
}
