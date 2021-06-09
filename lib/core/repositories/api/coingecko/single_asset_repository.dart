// 🎯 Dart imports:
import 'dart:convert';

// 🌎 Project imports:
import 'package:crypto_app/core/exceptions/rate_limit_exception.dart';
import 'package:crypto_app/core/models/api/coingecko/asset_history.dart';
// � Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:http/http.dart' as http;

class SingleAssetRespository {
  final http.Client _client;

  SingleAssetRespository(this._client);

  Future<AssetHistorySplits> fetchFullAssetHistory(
      String coinId, String currencyCode) async {
    debugPrint('fetchFullAssetHistory called for currency $currencyCode');

    return AssetHistorySplits(
      last24Hours: (await _fetchLast24HoursHistory(coinId, currencyCode)),
      last3Month: (await _fetch3mHistory(coinId, currencyCode)),
      allMonths: (await _fetchAllHistory(coinId, currencyCode)),
    );
  }

  Future<AssetHistory> _fetchAllHistory(
      String coinId, String currencyCode) async {
    debugPrint('_fetchAllHistory called for currency $currencyCode');

    var url =
        'https://api.coingecko.com/api/v3/coins/$coinId/market_chart?vs_currency=$currencyCode&days=max';

    return await _core(url);
  }

  Future<AssetHistory> _fetch3mHistory(
      String coinId, String currencyCode) async {
    debugPrint('_fetch6mHistory called for currency $currencyCode');

    var url =
        'https://api.coingecko.com/api/v3/coins/$coinId/market_chart?vs_currency=$currencyCode&days=90';

    return await _core(url);
  }

  Future<AssetHistory> _fetchLast24HoursHistory(
      String coinId, String currencyCode) async {
    debugPrint('_fetchLast24HoursHistory called for currency $currencyCode');
    var url =
        'https://api.coingecko.com/api/v3/coins/$coinId/market_chart?vs_currency=$currencyCode&days=1';
    return await _core(url);
  }

  Future<AssetHistory> _core(String url) async {
    final response = await _client.get(Uri.parse(url));
    if (response.statusCode == 429) {
      debugPrint(response.headers.toString());
      debugPrint('Rate Limted!');
      throw RateLimitException();
    }

    return AssetHistory.fromJson(jsonDecode(response.body));
  }
}
