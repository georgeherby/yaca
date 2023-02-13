// 🎯 Dart imports:

// 🐦 Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:coingecko_api/coingecko_api.dart';
import 'package:coingecko_api/data/coin.dart';
import 'package:coingecko_api/data/market_chart_data.dart';

// 🌎 Project imports:
import 'package:yaca/core/models/api/asset_history_splits.dart';
import 'package:yaca/core/models/settings/chosen_currency.dart';

class AssetRepository {
  AssetRepository(this._api);
  final CoinGeckoApi _api;

  Future<AssetHistorySplits> fetchFullAssetHistory(
      String coinId, ChosenCurrency currencyCode) async {
    debugPrint(
        'fetchFullAssetHistory $coinId called for currency $currencyCode');

    return AssetHistorySplits(
      last24Hours: await _getAssetHistory(coinId, currencyCode, 1),
      last3Month: await _getAssetHistory(coinId, currencyCode, 90),
      allMonths: await _getAssetHistory(coinId, currencyCode, null),
    );
  }

  Future<List<MarketChartData>> _getAssetHistory(
      String coinId, ChosenCurrency vsCurrency, int? days) async {
    final result = await _api.coins.getCoinMarketChart(
        id: coinId, vsCurrency: vsCurrency.currencyCode, days: days);

    if (!result.isError) {
      return result.data;
    } else {
      throw Exception('Failed to load coin list');
    }
  }

  Future<Coin> getSingleAssetData(String marketCoinId) async {
    final result = await _api.coins.getCoinData(
        localization: false,
        id: marketCoinId,
        tickers: false,
        marketData: true,
        communityData: true,
        developerData: true,
        sparkline: false);

    if (!result.isError) {
      return result.data!;
    } else {
      throw Exception('Failed to load coin list');
    }
  }
}
