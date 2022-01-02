// 📦 Package imports:
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:yaca/core/models/api/coingecko/simple_asset.dart';

class CoinListReposiotry {
  final http.Client _client;

  CoinListReposiotry(this._client);

  Future<List<SimpleAsset>> getCoinList() async {
    final response = await _client
        .get(
          Uri.parse('https://api.coingecko.com/api/v3/coins/list'),
        )
        .timeout(const Duration(seconds: 20));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return (json as List).map((e) => SimpleAsset.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load coin list');
    }
  }
}
