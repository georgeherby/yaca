// 🐦 Flutter imports:

// 🐦 Flutter imports:
import 'package:crypto_app/core/models/api/coingecko/market_coins.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:http/http.dart' as http;

// 🌎 Project imports:

class MarketOverviewRepository {
  final http.Client client;
  MarketOverviewRepository(this.client);

  Future<List<MarketCoin>> fetchCoinMarkets(String currencyCode) async {
    debugPrint('fetchCoinMarkets called for currency $currencyCode');

    final response = await client.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=$currencyCode&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=1h%2C24h%2C7d'));

    return marketCoinFromJson(response.body);
  }
}
