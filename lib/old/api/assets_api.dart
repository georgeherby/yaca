import 'dart:convert';

import 'package:crypto_app/old/models/asset_history.dart';
import 'package:crypto_app/old/models/assets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Assets> fetchAssetsList(http.Client client, [limit = 100]) async {
  //Limit = 2000
  debugPrint("fetchAssetsList called");
  final response = await client.get('https://api.coincap.io/v2/assets?limit=$limit');

  return Assets.fromJson(jsonDecode(response.body));
}

Future<AssetHisotrySplits> fetchFullAssetHistory(http.Client client, String asset) async {
  return AssetHisotrySplits(
      last24Hours: (await _fetchLast23HoursHistory(client, asset)).history,
      all: (await _fetchAllHistory(client, asset)).history);
}

Future<AssetHistory> _fetchAllHistory(http.Client client, String asset) async {
  debugPrint("fetchLast7DaysHistory called");

  final response = await client.get('https://api.coincap.io/v2/assets/$asset/history?interval=m15');

  return AssetHistory.fromJson(jsonDecode(response.body));
}

Future<AssetHistory> _fetchLast23HoursHistory(http.Client client, String asset) async {
  debugPrint("fetchLast24HoursHistory called");

  int from = DateTime.now()
      .subtract(Duration(hours: 23, minutes: 55))
      .millisecondsSinceEpoch; //24 Hours exceeded the API max opf 1 day...
  int to = DateTime.now().millisecondsSinceEpoch;
  String url = 'https://api.coincap.io/v2/assets/$asset/history?interval=m1&start=$from&end=$to';
  debugPrint(url);
  final response = await client.get(url);

  return AssetHistory.fromJson(jsonDecode(response.body));
}
