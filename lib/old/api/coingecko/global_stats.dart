import 'dart:convert';

import 'package:crypto_app/old/models/api/coingecko/global_market.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<GlobalMarket> fetchMarketOverview(http.Client client, String currencyCode) async {
  debugPrint("fetchMarketOverview called");

  String url = "https://api.coingecko.com/api/v3/global?vs_currency=$currencyCode";
  final response = await client.get(Uri.parse(url));

  return GlobalMarket.fromJson(jsonDecode(response.body));
}
