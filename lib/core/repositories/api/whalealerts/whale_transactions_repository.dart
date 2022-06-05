// 🎯 Dart imports:
import 'dart:convert';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:http/http.dart' as http;

// 🌎 Project imports:
import 'package:yaca/core/exceptions/missing_config_exception.dart';
import 'package:yaca/core/exceptions/rate_limit_exception.dart';
import 'package:yaca/core/models/api/whalealerts/whale_transactions.dart';
import 'package:yaca/core/repositories/preferences/api_tokens_preference.dart';
import 'package:yaca/ui/utils/view_builder/filter_list_repository.dart';

class WhaleTransactionReposiotry
    extends FilterListRepository<WhaleTransaction, String> {
  WhaleTransactionReposiotry({required this.apiPreferences});
  final client = http.Client();

  final ApiTokensPreference apiPreferences;

  @override
  Future<List<WhaleTransaction>> getAll() async {
    debugPrint('getAllWhaleTransactions called');

    final token = await apiPreferences.getWhalesApiToken();

    if (token != null) {
      //TODO Make the min value a configurable value
      final url =
          'https://api.whale-alert.io/v1/transactions?api_key=$token&min_value=5000000';
      final response = await client
          .get(Uri.parse(url), headers: {'content-type': 'application/json'});
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 429) {
        throw RateLimitException();
      }
      return WhaleTransactionResults.fromJson(jsonDecode(response.body))
          .transactions;
    } else {
      throw MissingConfigException('whale api token');
    }
  }

  //TODO Change to be filtered
  @override
  Future<List<WhaleTransaction>> getBy(String filter) async {
    debugPrint('fetchMarketOverview called');

    const url =
        'https://api.whale-alert.io/v1/transactions?api_key=quGcgSYawOg8ZOwpFXAAKU4X6FMXe2fr&min_value=5000000';
    final response = await client.get(Uri.parse(url));
    return WhaleTransactionResults.fromJson(jsonDecode(response.body))
        .transactions;
  }
}
