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

  Future<List<ExchangeTicker>> getAllExchangeTickers(
    String coinId,
  ) {
    return Future.wait([
      _getExchangeTicker(_client, coinId, 'binance'),
      _getExchangeTicker(_client, coinId, 'gdax'),
      _getExchangeTicker(_client, coinId, 'bitfinex'),
      _getExchangeTicker(_client, coinId, 'kraken'),
      _getExchangeTicker(_client, coinId, 'gemini'),
      _getExchangeTicker(_client, coinId, 'huobi'),
      _getExchangeTicker(_client, coinId, 'binance_us'),
      _getExchangeTicker(_client, coinId, 'crypto_com'),
      _getExchangeTicker(_client, coinId, 'bitstamp'),
      _getExchangeTicker(_client, coinId, 'bithumb'),
      _getExchangeTicker(_client, coinId, 'hitbtc'),
      _getExchangeTicker(_client, coinId, 'hotbit'),
      _getExchangeTicker(_client, coinId, 'gate'),
      _getExchangeTicker(_client, coinId, 'etorox'),
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
      await Future.delayed(const Duration(milliseconds: 500));
      response = await client.get(Uri.parse(url));
    }

    if (response.statusCode == 200) {
      return ExchangeTicker.fromJson(jsonDecode(response.body));
    } else {
      debugPrint('Error retrieving $url');
      return null;
    }
  }
}
