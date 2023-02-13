// 📦 Package imports:
import 'package:coingecko_api/coingecko_api.dart';
import 'package:coingecko_api/data/search_trending.dart';

class TrendingAssetRepository {
  TrendingAssetRepository(this.api);
  final CoinGeckoApi api;

  Future<List<SearchTrendingCoin>> getTrendingAssets() async {
    final result = await api.trending.getSearchTrending();

    if (!result.isError) {
      return result.data!.coins;
    } else {
      throw Exception('Failed getTrendingAssets');
    }
  }
}
