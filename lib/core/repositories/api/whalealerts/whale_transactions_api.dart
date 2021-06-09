// 🎯 Dart imports:
import 'dart:convert';

// 🐦 Flutter imports:
import 'package:crypto_app/core/models/api/whalealerts/whale_transactions.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:http/http.dart' as http;

// 🌎 Project imports:
import 'package:crypto_app/core/exceptions/rate_limit_exception.dart';
import 'package:crypto_app/ui/utils/view_builder/filter_list_repository.dart';

class WhaleTransactionReposiotry
    extends FilterListRepository<Transactions, String> {
  final client = http.Client();

  @override
  Future<List<Transactions>> getAll() async {
    debugPrint('getAllWhaleTransactions called');

    var url =
        'https://api.whale-alert.io/v1/transactions?api_key=quGcgSYawOg8ZOwpFXAAKU4X6FMXe2fr&min_value=5000000';
    final response = await client.get(Uri.parse(url));
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 429) {
      throw RateLimitException();
    }
    return WhaleTransactions.fromJson(jsonDecode(response.body)).transactions;
  }

  //TODO Change to be filtered
  @override
  Future<List<Transactions>> getBy(String filter) async {
    debugPrint('fetchMarketOverview called');

    var url =
        'https://api.whale-alert.io/v1/transactions?api_key=quGcgSYawOg8ZOwpFXAAKU4X6FMXe2fr&min_value=5000000';
    final response = await client.get(Uri.parse(url));
    return WhaleTransactions.fromJson(jsonDecode(response.body)).transactions;
  }
}
