// 🌎 Project imports:
import 'api/coingecko/market_coins.dart';

class AssetsList {
  final List<MarketCoin> assets;

  AssetsList({required this.assets});

  // double get avg1hChange =>
  //     assets.where((element) => element.priceChangePercentage1hInCurrency != null).length /
  //     ((assets.fold<double>(
  //         0.0,
  //         (previousValue, element) =>
  //             previousValue +
  //             ((element.priceChangePercentage1hInCurrency != null
  //                 ? (element.priceChangePercentage1hInCurrency!)
  //                 : 0.0)))));
  // double get avg24hChange =>
  //     assets.where((element) => element.priceChangePercentage24hInCurrency != null).length /
  //     ((assets.fold<double>(
  //         0.0,
  //         (previousValue, element) =>
  //             previousValue +
  //             ((element.priceChangePercentage24hInCurrency != null
  //                 ? (element.priceChangePercentage24hInCurrency)
  //                 : 0.0)))));
  // double get avg7dChange =>
  //     assets.where((element) => element.priceChangePercentage7dInCurrency != null).length /
  //     ((assets.fold<double>(
  //         0.0,
  //         (previousValue, element) =>
  //             previousValue +
  //             ((element.priceChangePercentage7dInCurrency != null
  //                 ? (element.priceChangePercentage7dInCurrency!)
  //                 : 0.0)))));
}
