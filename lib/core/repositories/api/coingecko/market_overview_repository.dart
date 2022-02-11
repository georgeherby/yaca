// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:coingecko_api/coingecko_api.dart';
import 'package:coingecko_api/data/enumerations.dart';
import 'package:coingecko_api/data/market.dart';

// 🌎 Project imports:
import 'package:yaca/core/models/settings/chosen_currency.dart';

class MarketOverviewRepository {
  final CoinGeckoApi _api;
  MarketOverviewRepository(this._api);

  Future<List<Market>> fetchCoinMarkets(ChosenCurrency chosenCurrency,
      {List<String> specficCoinIds = const []}) async {
    var currencyCode = chosenCurrency.currencyCode;
    debugPrint('fetchCoinMarkets called for currency $currencyCode');

    const assetsPerPage = 200;

    final result = await _api.coins.listCoinMarkets(
      vsCurrency: currencyCode,
      order: CoinMarketsOrder.marketCapDescending,
      itemsPerPage: assetsPerPage,
      page: 1,
      sparkline: true,
      coinIds: specficCoinIds,
      priceChangePercentageIntervals: ['1h', '24h', '7d'],
    );

    if (!result.isError) {
      return result.data;
    } else {
      throw Exception('Failed to load coin list');
    }
  }
}
