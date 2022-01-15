// 🎯 Dart imports:
import 'dart:convert';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:http/http.dart' as http;

// 🌎 Project imports:
import 'package:yaca/core/models/api/coingecko/exchange_ticker.dart';

class ExchangeTickerRespository {
  final http.Client _client;

  ExchangeTickerRespository(this._client);

  Future<ExchangeTickers> getExchangeTickerForCoin(String cryptoName) async {
    debugPrint('getExchangeTicker called for $cryptoName');

    var url =
        'https://api.coingecko.com/api/v3/coins/$cryptoName/tickers?include_exchange_logo=true&order=volume_desc';
    var response =
        await _client.get(Uri.parse(url)).timeout(const Duration(seconds: 20));
    debugPrint('Response ${response.statusCode.toString()}');

    if (response.statusCode == 200) {
      return ExchangeTickers.fromJson(jsonDecode(response.body));
    } else {
      debugPrint('Error retrieving $url');
      throw Exception('Failed ${response.statusCode}');
    }
  }
}
