import 'package:crypto_app/old/models/api/coingecko/market_coins.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<MarketCoin>> fetchCoinMarkets(http.Client client, [String currencyCode = "gbp"]) async {
  debugPrint("fetchCoinMarkets called");

  //Can be 250 if needed
  final response = await client.get(
      "https://api.coingecko.com/api/v3/coins/markets?vs_currency=$currencyCode&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=1h%2C24h%2C7d");

  return marketCoinFromJson(response.body);
}
