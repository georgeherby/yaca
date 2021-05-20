import 'dart:convert';

import 'package:crypto_app/old/models/api/coingecko/exchange_ticker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<ExchangeTicker>> getAllExchangeTickers(
  http.Client client,
  String cryptoName,
) {
  return Future.wait([
    _getExchangeTicker(client, cryptoName, 'binance'),
    _getExchangeTicker(client, cryptoName, 'gdax'),
    _getExchangeTicker(client, cryptoName, 'bitfinex'),
    _getExchangeTicker(client, cryptoName, 'kraken'),
    _getExchangeTicker(client, cryptoName, 'gemini'),
    _getExchangeTicker(client, cryptoName, 'huobi'),
    _getExchangeTicker(client, cryptoName, 'binance_us'),
    _getExchangeTicker(client, cryptoName, 'crypto_com'),
    _getExchangeTicker(client, cryptoName, 'bitstamp'),
    _getExchangeTicker(client, cryptoName, 'bithumb'),
    _getExchangeTicker(client, cryptoName, 'hitbtc'),
    _getExchangeTicker(client, cryptoName, 'hotbit'),
    _getExchangeTicker(client, cryptoName, 'gate'),
    _getExchangeTicker(client, cryptoName, 'etorox'),
  ]).then((List<ExchangeTicker?> list) {
    list.removeWhere((v) => v == null);
    return list.map((e) => e!).toList();
  });
}

Future<ExchangeTicker?> _getExchangeTicker(
    http.Client client, String cryptoName, String exchangeId) async {
  debugPrint('getExchangeTicker called for $cryptoName on $exchangeId');

  var url =
      'https://api.coingecko.com/api/v3/exchanges/$exchangeId/tickers?include_exchange_logo=true&depth=true&coin_ids=$cryptoName';
  var response = await client.get(Uri.parse(url));
  debugPrint('Response ${response.statusCode.toString()} for $exchangeId');

  if (response.statusCode == 429) {
    debugPrint('Being Throttled wait 500ms');
    await Future.delayed(Duration(milliseconds: 500));
    response = await client.get(Uri.parse(url));
  }

  if (response.statusCode == 200) {
    return ExchangeTicker.fromJson(jsonDecode(response.body));
  } else {
    debugPrint('Error retrieving $url');
    return null;
  }
}
