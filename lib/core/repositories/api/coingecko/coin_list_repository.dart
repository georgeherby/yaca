// 🎯 Dart imports:

// 📦 Package imports:
import 'package:coingecko_api/coingecko_api.dart';
import 'package:coingecko_api/data/coin_short.dart';

class CoinListRepository {
  CoinListRepository(this._api);
  final CoinGeckoApi _api;

  Future<List<CoinShort>> getCoinList() async {
    final result = await _api.coins.listCoins();

    if (!result.isError) {
      return result.data;
    } else {
      throw Exception('Failed to load coin list');
    }
  }
}
