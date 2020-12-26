import 'dart:convert';

import 'package:crypto_app/old/models/market_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<MarketDetails> fetchMarketDetails(http.Client client, [limit = 100]) async {
  //Limit = 2000

  debugPrint("fetchMarketDetails called");
  final response = await client.get('https://api.coinpaprika.com/v1/global');

  return parseAssets(response.body);
}

MarketDetails parseAssets(String response) {
  return MarketDetails.fromJson(jsonDecode(response));
}
