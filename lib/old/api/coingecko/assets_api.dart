import 'dart:convert';

import 'package:crypto_app/old/models/api/coingecko/asset_history.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// final res = await client
//     .get('https://api.coingecko.com/api/v3/coins/$asset/market_chart?vs_currency=gbp&days=1');

// AssetHistory.fromJson(json.decode(res.body));

Future<AssetHistorySplits> fetchFullAssetHistory(http.Client client, String asset) async {
  debugPrint("fetchFullAssetHistory called");

  return AssetHistorySplits(
    last24Hours: (await _fetchLast24HoursHistory(client, asset)),
    // last7Days: (await _fetch7dHistory(client, asset)),
    // last1Month: (await _fetch1mHistory(client, asset)),
    last3Month: (await _fetch3mHistory(client, asset)),
    allMonths: (await _fetchAllHistory(client, asset)),
  );
}

Future<AssetHistory> _fetchAllHistory(http.Client client, String asset) async {
  debugPrint("_fetchAllHistory called");

  String url =
      "https://api.coingecko.com/api/v3/coins/$asset/market_chart?vs_currency=gbp&days=max";

  return await _core(client, url);
}

Future<AssetHistory> _fetch3mHistory(http.Client client, String asset) async {
  debugPrint("_fetch6mHistory called");

  String url = "https://api.coingecko.com/api/v3/coins/$asset/market_chart?vs_currency=gbp&days=90";

  return await _core(client, url);
}

// Future<AssetHistory> _fetch1mHistory(http.Client client, String asset) async {
//   debugPrint("_fetch1mHistory called");

//   String url = "https://api.coingecko.com/api/v3/coins/$asset/market_chart?vs_currency=gbp&days=30";

//   return await _core(client, url);
// }

// Future<AssetHistory> _fetch7dHistory(http.Client client, String asset) async {
//   debugPrint("_fetch7dHistory called");

//   String url = "https://api.coingecko.com/api/v3/coins/$asset/market_chart?vs_currency=gbp&days=7";

//   return await _core(client, url);
// }

Future<AssetHistory> _fetchLast24HoursHistory(http.Client client, String asset) async {
  debugPrint("_fetchLast24HoursHistory called");
  String url = "https://api.coingecko.com/api/v3/coins/$asset/market_chart?vs_currency=gbp&days=1";
  debugPrint(url);
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
