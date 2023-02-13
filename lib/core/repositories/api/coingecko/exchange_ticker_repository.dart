// 🎯 Dart imports:

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:coingecko_api/coingecko_api.dart';
import 'package:coingecko_api/data/ticker.dart';

class ExchangeTickerRepository {
  ExchangeTickerRepository(this._api);
  final CoinGeckoApi _api;

  Future<List<Ticker>> getExchangeTickerForCoin(String cryptoName) async {
    debugPrint('getExchangeTicker called for $cryptoName');

    final result = await _api.coins.listCoinTickers(
        id: cryptoName, includeExchangeLogo: true, order: 'volume_desc');

    if (!result.isError) {
      return result.data;
    } else {
      throw Exception('Failed to load coin list');
    }
  }
}
