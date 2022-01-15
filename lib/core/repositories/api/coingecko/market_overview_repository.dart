// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:http/http.dart' as http;

// 🌎 Project imports:
import 'package:yaca/core/models/api/coingecko/market_coins.dart';
import 'package:yaca/core/models/settings/chosen_currency.dart';

class MarketOverviewRepository {
  final http.Client _client;
  MarketOverviewRepository(this._client);

  Future<List<MarketCoin>> fetchCoinMarkets(ChosenCurrency chosenCurrency,
      {String? specficCoinIds}) async {
    var currencyCode = chosenCurrency.currencyCode;
    debugPrint('fetchCoinMarkets called for currency $currencyCode');

    const assetsPerPage = 200;

    String uri =
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=$currencyCode&order=marketCap_desc&per_page=$assetsPerPage&page=1&sparkline=true&price_change_percentage=1h%2C24h%2C7d';

    if (specficCoinIds != null) {
      uri += '&ids=$specficCoinIds';
    }

    final response =
        await _client.get(Uri.parse(uri)).timeout(const Duration(seconds: 20));

    return marketCoinFromJson(response.body);
  }
}
