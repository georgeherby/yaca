// 🎯 Dart imports:

// 📦 Package imports:
import 'package:coingecko_api/data/market.dart';
import 'package:equatable/equatable.dart';

class MarketCoin extends Equatable {
  final Market market;

  final int? favouriteCacheId;

  const MarketCoin({required this.market, this.favouriteCacheId});

  MarketCoin copyWith({
    Market? market,
    int? favouriteCacheId,
  }) {
    return MarketCoin(
      market: market ?? this.market,

      favouriteCacheId:
          favouriteCacheId, //As null is a state i may set this to null when not set
    );
  }

  bool get isFavourited => favouriteCacheId != null;

  double? get priceChange1h => market.priceChangePercentage1hInCurrency != null && market.currentPrice != null
      ? (market.priceChangePercentage1hInCurrency! / 100) * market.currentPrice!
      : null;

  double? get priceChange7d => market.priceChangePercentage7dInCurrency != null &&
              market.currentPrice != null
      ? (market.priceChangePercentage7dInCurrency! / 100) * market.currentPrice!
      : null;

  @override
  List<Object?> get props => [
        market,
        favouriteCacheId,
      ];
}
