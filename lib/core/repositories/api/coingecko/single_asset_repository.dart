// 🎯 Dart imports:
import 'dart:convert';

// 🐦 Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:http/http.dart' as http;

// 🌎 Project imports:
import 'package:yaca/core/exceptions/rate_limit_exception.dart';
import 'package:yaca/core/models/api/coingecko/asset_history.dart';
import 'package:yaca/core/models/api/coingecko/single_asset_data/single_asset_data.dart';
import 'package:yaca/core/models/settings/chosen_currency.dart';

class AssetRespository {
  final http.Client _client;

  AssetRespository(this._client);

  Future<AssetHistorySplits> fetchFullAssetHistory(
      String coinId, ChosenCurrency currencyCode) async {
    debugPrint(
        'fetchFullAssetHistory $coinId called for currency $currencyCode');

    return AssetHistorySplits(
      last24Hours: (await _fetchLast24HoursHistory(coinId, currencyCode)),
      last3Month: (await _fetch3mHistory(coinId, currencyCode)),
      allMonths: (await _fetchAllHistory(coinId, currencyCode)),
    );
  }

  Future<AssetHistory> _fetchAllHistory(
      String coinId, ChosenCurrency chosenCurrency) async {
    debugPrint('_fetchAllHistory called for currency $chosenCurrency');

    var url =
        'https://api.coingecko.com/api/v3/coins/$coinId/market_chart?vs_currency=${chosenCurrency.currencyCode}&days=max';

    return await _core(url);
  }

  Future<AssetHistory> _fetch3mHistory(
      String coinId, ChosenCurrency chosenCurrency) async {
    debugPrint('_fetch6mHistory called for currency $chosenCurrency');

    var url =
        'https://api.coingecko.com/api/v3/coins/$coinId/market_chart?vs_currency=${chosenCurrency.currencyCode}&days=90';

    return await _core(url);
  }

  Future<AssetHistory> _fetchLast24HoursHistory(
      String coinId, ChosenCurrency chosenCurrency) async {
    debugPrint(
        '_fetchLast24HoursHistory called for currency ${chosenCurrency.currencyCode}');
    var url =
        'https://api.coingecko.com/api/v3/coins/$coinId/market_chart?vs_currency=${chosenCurrency.currencyCode}&days=1';
    return await _core(url);
  }

  Future<AssetHistory> _core(String url) async {
    final response =
        await _client.get(Uri.parse(url)).timeout(const Duration(seconds: 20));
    if (response.statusCode == 429) {
      debugPrint(response.headers.toString());
      debugPrint('Rate Limted!');
      throw RateLimitException();
    }

    return AssetHistory.fromJson(jsonDecode(response.body));
  }

  Future<SingleAssetData> getSingleAssetData(String marketCoinId) async {
    final response = await _client.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/$marketCoinId?tickers=false&market_data=true&community_data=true&developer_data=true'));

    if (response.statusCode == 429) {
      debugPrint(response.headers.toString());
      debugPrint('Rate Limted!');
      throw RateLimitException();
    }

    return SingleAssetData.fromJson(response.body);
  }
}
