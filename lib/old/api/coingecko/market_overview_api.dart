import 'package:crypto_app/old/models/api/coingecko/market_coins.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MarketOverviewRepository {
  final http.Client client;
  final String currencyCode;
  MarketOverviewRepository(this.client, this.currencyCode);

  Future<List<MarketCoin>> fetchCoinMarkets() async {
    debugPrint('fetchCoinMarkets called for currency $currencyCode');

    final response = await client.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=$currencyCode&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=1h%2C24h%2C7d'));

    return marketCoinFromJson(response.body);
  }
}
