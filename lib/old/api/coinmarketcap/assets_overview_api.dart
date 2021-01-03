import 'dart:convert';

import 'package:crypto_app/old/models/asset_overview.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<AssetOverview> fetchAssetsOverview(
  http.Client client, [
  bool sanbox = true,
]) async {
  debugPrint("fetchAssetsOverview called");
  if (sanbox) {
    debugPrint("Using sandbox");
  }
  String url = sanbox
      ? "https://sandbox-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?convert=GBP"
      : "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?convert=GBP";
  String api =
      sanbox ? "b54bcf4d-1bca-4e8e-9a24-22ff2c3d462c" : "469c1b99-185f-41a6-9fb2-c54ebdcc15d2";

  final response = await client.get(url, headers: {"X-CMC_PRO_API_KEY": api});

  return AssetOverview.fromJson(jsonDecode(response.body));
}
