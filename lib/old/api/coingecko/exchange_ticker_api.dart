import 'dart:convert';

import 'package:crypto_app/old/models/api/coingecko/exchange_ticker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<ExchangeTicker>> getAllExchangeTickers(
  http.Client client,
  String cryptoName,
) async {
  return [
    await _getExchangeTicker(client, cryptoName, "binance"),
    await _getExchangeTicker(client, cryptoName, "gdax"),
    await _getExchangeTicker(client, cryptoName, "bitfinex"),
    await _getExchangeTicker(client, cryptoName, "kraken"),
    await _getExchangeTicker(client, cryptoName, "gemini"),
    await _getExchangeTicker(client, cryptoName, "huobi"),
    await _getExchangeTicker(client, cryptoName, "binance_us"),
    await _getExchangeTicker(client, cryptoName, "crypto_com"),
    await _getExchangeTicker(client, cryptoName, "bitstamp"),
    await _getExchangeTicker(client, cryptoName, "bithumb"),
    await _getExchangeTicker(client, cryptoName, "hitbtc"),
    await _getExchangeTicker(client, cryptoName, "hotbit"),
    await _getExchangeTicker(client, cryptoName, "gate"),
    await _getExchangeTicker(client, cryptoName, "etorox"),
  ];
}

Future<ExchangeTicker> _getExchangeTicker(
    http.Client client, String cryptoName, String exchangeId) async {
  debugPrint("fetchMarketOverview called for $cryptoName on $exchangeId");

  String url =
      "https://api.coingecko.com/api/v3/exchanges/$exchangeId/tickers?include_exchange_logo=true&coin_ids=$cryptoName";
  final response = await client.get(url);
  debugPrint("Response ${response.statusCode.toString()}");
  return ExchangeTicker.fromJson(jsonDecode(response.body));
}
