// 🎯 Dart imports:

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:coingecko_api/coingecko_api.dart';
import 'package:coingecko_api/data/global_coin_data.dart';

// 🌎 Project imports:
import 'package:yaca/core/models/settings/chosen_currency.dart';

class GlobalMarketRepository {
  GlobalMarketRepository(this._api);
  final CoinGeckoApi _api;

  Future<GlobalCoinData> fetchMarketOverview(
      ChosenCurrency currencyCode) async {
    debugPrint('fetchMarketOverview callled for currency: $currencyCode');

    final result = await _api.global.getGlobalData();

    if (!result.isError) {
      return result.data!;
    } else {
      throw Exception('Failed to load coin list');
    }
  }
}
