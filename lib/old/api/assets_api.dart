import 'dart:convert';

import 'package:crypto_app/old/models/asset_history.dart';
import 'package:crypto_app/old/models/assets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Assets> fetchAssetsList(http.Client client, [limit = 100]) async {
  //Limit = 2000
  debugPrint("fetchAssetsList called");
  final response = await client.get('https://api.coincap.io/v2/assets?limit=$limit');

  return Assets.fromJson(jsonDecode(response.body));
}

Future<AssetHistorySplits> fetchFullAssetHistory(http.Client client, String asset) async {
  debugPrint("fetchFullAssetHistory called");

//TODO do this properly!
  final rate = jsonDecode(
          (await client.get("https://api.coincap.io/v2/rates/british-pound-sterling")).body)["data"]
      ["rateUsd"];

  debugPrint("USD rate used $rate");

  return AssetHistorySplits(
      last24Hours: (await _fetchLast24HoursHistory(client, asset)).history,
      last7Days: (await _fetch7dHistory(client, asset)).history,
      last1Month: (await _fetch1mHistory(client, asset)).history,
      last6Month: (await _fetch6mHistory(client, asset)).history,
      last12Months: (await _fetch1yHistory(client, asset)).history,
      usdRate: double.parse(rate));
}

Future<AssetHistory> _fetch1yHistory(http.Client client, String asset) async {
  debugPrint("_fetch1yHistory called");

  final response = await client.get('https://api.coincap.io/v2/assets/$asset/history?interval=h12');

  return AssetHistory.fromJson(jsonDecode(response.body));
}

Future<AssetHistory> _fetch6mHistory(http.Client client, String asset) async {
  debugPrint("_fetch6mHistory called");

  final response = await client.get('https://api.coincap.io/v2/assets/$asset/history?interval=h6');

  return AssetHistory.fromJson(jsonDecode(response.body));
}

Future<AssetHistory> _fetch1mHistory(http.Client client, String asset) async {
  debugPrint("_fetch1mHistory called");

  final response = await client.get('https://api.coincap.io/v2/assets/$asset/history?interval=h1');

  return AssetHistory.fromJson(jsonDecode(response.body));
}

Future<AssetHistory> _fetch7dHistory(http.Client client, String asset) async {
  debugPrint("_fetch7dHistory called");

  final response = await client.get('https://api.coincap.io/v2/assets/$asset/history?interval=m15');

  return AssetHistory.fromJson(jsonDecode(response.body));
}

Future<AssetHistory> _fetchLast24HoursHistory(http.Client client, String asset) async {
  debugPrint("_fetchLast24HoursHistory called");
  String url = 'https://api.coincap.io/v2/assets/$asset/history?interval=m1';
  debugPrint(url);
  final response = await client.get(url);

  return AssetHistory.fromJson(jsonDecode(response.body));
}
