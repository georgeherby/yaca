// 🎯 Dart imports:
import 'dart:convert';

// 🌎 Project imports:
import 'package:crypto_app/old/models/api/coingecko/global_market.dart';
// � Flutter imports:
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:http/http.dart' as http;

class GlobalMarketRespository {
  final String currencyCode;
  final http.Client client;

  GlobalMarketRespository({required this.currencyCode, required this.client});

  Future<GlobalMarket> fetchMarketOverview() async {
    debugPrint('fetchMarketOverview called for currency $currencyCode');

    var url =
        'https://api.coingecko.com/api/v3/global?vs_currency=$currencyCode';
    final response = await client.get(Uri.parse(url));

    debugPrint(response.statusCode.toString());
    if (response.statusCode != 200) {
      debugPrint(response.headers.toString());
      debugPrint('Error getting Market Overivew');
    }

    return GlobalMarket.fromJson(jsonDecode(response.body));
  }
}
