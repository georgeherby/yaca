// 🎯 Dart imports:
import 'dart:convert';

// 📦 Package imports:
import 'package:equatable/equatable.dart';

class TrendingAssets extends Equatable {
  final List<TrendingAsset> coins;
  const TrendingAssets({
    required this.coins,
  });

  TrendingAssets copyWith({
    List<TrendingAsset>? coins,
    List<dynamic>? exchanges,
  }) {
    return TrendingAssets(
      coins: coins ?? this.coins,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'coins': coins.map((x) => x.toMap()).toList(),
    };
  }

  factory TrendingAssets.fromMap(Map<String, dynamic> map) {
    return TrendingAssets(
      coins: List<TrendingAsset>.from(map['coins']?.map((x) => TrendingAsset.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory TrendingAssets.fromJson(String source) => TrendingAssets.fromMap(json.decode(source));

  @override
  String toString() => 'TrendingAsset(coins: $coins)';

  @override
  List<Object> get props => [coins];
}

class TrendingAsset extends Equatable {
  final Asset asset;
  const TrendingAsset({
    required this.asset,
  });

  TrendingAsset copyWith({
    Asset? item,
  }) {
    return TrendingAsset(
      asset: item ?? asset,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'item': asset.toMap(),
    };
  }

  factory TrendingAsset.fromMap(Map<String, dynamic> map) {
    return TrendingAsset(
      asset: Asset.fromMap(map['item']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TrendingAsset.fromJson(String source) => TrendingAsset.fromMap(json.decode(source));

  @override
  String toString() => 'Coin(item: $asset)';

  @override
  List<Object> get props => [asset];
}

class Asset extends Equatable {
  final String id;
  final int coinId;
  final String name;
  final String symbol;
  final int marketCapRank;
  final String thumb;
  final String small;
  final String large;
  final String slug;
  final double priceBtc;
  final int score;
  const Asset({
    required this.id,
    required this.coinId,
    required this.name,
    required this.symbol,
    required this.marketCapRank,
    required this.thumb,
    required this.small,
    required this.large,
    required this.slug,
    required this.priceBtc,
    required this.score,
  });

  Asset copyWith({
    String? id,
    int? coinId,
    String? name,
    String? symbol,
    int? marketCapRank,
    String? thumb,
    String? small,
    String? large,
    String? slug,
    double? priceBtc,
    int? score,
  }) {
    return Asset(
      id: id ?? this.id,
      coinId: coinId ?? this.coinId,
      name: name ?? this.name,
      symbol: symbol ?? this.symbol,
      marketCapRank: marketCapRank ?? this.marketCapRank,
      thumb: thumb ?? this.thumb,
      small: small ?? this.small,
      large: large ?? this.large,
      slug: slug ?? this.slug,
      priceBtc: priceBtc ?? this.priceBtc,
      score: score ?? this.score,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'coin_id': coinId,
      'name': name,
      'symbol': symbol,
      'market_cap_rank': marketCapRank,
      'thumb': thumb,
      'small': small,
      'large': large,
      'slug': slug,
      'price_btc': priceBtc,
      'score': score,
    };
  }

  factory Asset.fromMap(Map<String, dynamic> map) {
    return Asset(
      id: map['id'] ?? '',
      coinId: map['coin_id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      symbol: map['symbol'] ?? '',
      marketCapRank: map['market_cap_rank']?.toInt() ?? 0,
      thumb: map['thumb'] ?? '',
      small: map['small'] ?? '',
      large: map['large'] ?? '',
      slug: map['slug'] ?? '',
      priceBtc: map['price_btc']?.toDouble() ?? 0.0,
      score: map['score']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Asset.fromJson(String source) => Asset.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, coin_id: $coinId, name: $name, symbol: $symbol, market_cap_rank: $marketCapRank, thumb: $thumb, small: $small, large: $large, slug: $slug, price_btc: $priceBtc, score: $score)';
  }

  @override
  List<Object> get props {
    return [
      id,
      coinId,
      name,
      symbol,
      marketCapRank,
      thumb,
      small,
      large,
      slug,
      priceBtc,
      score,
    ];
  }
}
