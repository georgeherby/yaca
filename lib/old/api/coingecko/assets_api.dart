import 'dart:convert';

import 'package:crypto_app/old/models/api/coingecko/asset_history.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<AssetHistorySplits> fetchFullAssetHistory(
    http.Client client, String asset, String currencyCode) async {
  debugPrint("fetchFullAssetHistory called");

  return AssetHistorySplits(
    last24Hours: (await _fetchLast24HoursHistory(client, asset, currencyCode)),
    last3Month: (await _fetch3mHistory(client, asset, currencyCode)),
    allMonths: (await _fetchAllHistory(client, asset, currencyCode)),
  );
}

Future<AssetHistory> _fetchAllHistory(http.Client client, String asset, String currencyCode) async {
  debugPrint("_fetchAllHistory called");

  String url =
      "https://api.coingecko.com/api/v3/coins/$asset/market_chart?vs_currency=$currencyCode&days=max";

  return await _core(client, url);
}

Future<AssetHistory> _fetch3mHistory(http.Client client, String asset, String currencyCode) async {
  debugPrint("_fetch6mHistory called");

  String url =
      "https://api.coingecko.com/api/v3/coins/$asset/market_chart?vs_currency=$currencyCode&days=90";

  return await _core(client, url);
}

Future<AssetHistory> _fetchLast24HoursHistory(
    http.Client client, String asset, String currencyCode) async {
  debugPrint("_fetchLast24HoursHistory called");
  String url =
      "https://api.coingecko.com/api/v3/coins/$asset/market_chart?vs_currency=$currencyCode&days=1";
  return await _core(client, url);
}

Future<AssetHistory> _core(http.Client client, String url) async {
  final response = await client.get(url);
  if (response.statusCode == 429) {
    debugPrint(response.headers.toString());
    debugPrint("RateLimted!");
  }

  return AssetHistory.fromJson(jsonDecode(response.body));
}
