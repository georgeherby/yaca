import 'package:http/http.dart' as http;
import 'package:yaca/core/models/api/coingecko/tranding_asset.dart';

class TrendingAssetRepository {
  final http.Client _client;

  TrendingAssetRepository(this._client);

  Future<List<TrendingAsset>> getTrendingAssets() async {
    final response = await _client
        .get(
          Uri.parse('https://api.coingecko.com/api/v3/search/trending'),
        )
        .timeout(const Duration(seconds: 20));

    if (response.statusCode == 200) {
      return TrendingAssets.fromJson(response.body).coins;
    } else {
      throw Exception('Failed to load coin list');
    }
  }
}
