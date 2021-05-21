// 🎯 Dart imports:
import 'dart:convert';

// 🐦 Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:http/http.dart' as http;

// 🌎 Project imports:
import 'package:crypto_app/core/exceptions/rate_limit_exception.dart';
import 'package:crypto_app/old/models/api/coingecko/asset_history.dart';

Future<AssetHistorySplits> fetchFullAssetHistory(
    http.Client client, String asset, String currencyCode) async {
  debugPrint('fetchFullAssetHistory called for currency $currencyCode');

  return AssetHistorySplits(
    last24Hours: (await _fetchLast24HoursHistory(client, asset, currencyCode)),
    last3Month: (await _fetch3mHistory(client, asset, currencyCode)),
    allMonths: (await _fetchAllHistory(client, asset, currencyCode)),
  );
}

Future<AssetHistory> _fetchAllHistory(http.Client client, String asset, String currencyCode) async {
  debugPrint('_fetchAllHistory called for currency $currencyCode');

  var url =
      'https://api.coingecko.com/api/v3/coins/$asset/market_chart?vs_currency=$currencyCode&days=max';

  return await _core(client, url);
}

Future<AssetHistory> _fetch3mHistory(http.Client client, String asset, String currencyCode) async {
  debugPrint('_fetch6mHistory called for currency $currencyCode');

  var url =
      'https://api.coingecko.com/api/v3/coins/$asset/market_chart?vs_currency=$currencyCode&days=90';

  return await _core(client, url);
}

Future<AssetHistory> _fetchLast24HoursHistory(
    http.Client client, String asset, String currencyCode) async {
  debugPrint('_fetchLast24HoursHistory called for currency $currencyCode');
  var url =
      'https://api.coingecko.com/api/v3/coins/$asset/market_chart?vs_currency=$currencyCode&days=1';
  return await _core(client, url);
}

Future<AssetHistory> _core(http.Client client, String url) async {
  final response = await client.get(Uri.parse(url));
  if (response.statusCode == 429) {
    debugPrint(response.headers.toString());
    debugPrint('Rate Limted!');
      throw RateLimitException();
    
  }

  return AssetHistory.fromJson(jsonDecode(response.body));
}
