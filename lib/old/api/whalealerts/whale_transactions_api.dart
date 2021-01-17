import 'dart:convert';

import 'package:crypto_app/old/models/api/whalealerts/whale_transactions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<WhaleTransactions> fetchWhaleTransactions(http.Client client) async {
  debugPrint("fetchMarketOverview called");

  String url =
      "https://api.whale-alert.io/v1/transactions?api_key=quGcgSYawOg8ZOwpFXAAKU4X6FMXe2fr&min_value=5000000";
  final response = await client.get(Uri.parse(url));

  return WhaleTransactions.fromJson(jsonDecode(response.body));
}
