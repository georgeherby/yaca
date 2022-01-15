// 🎯 Dart imports:
import 'dart:convert';

// 📦 Package imports:
import 'package:equatable/equatable.dart';

List<MarketCoin> marketCoinFromJson(String str) =>
    List<MarketCoin>.from(json.decode(str).map((x) => MarketCoin.fromJson(x)));

String marketCoinToJson(List<MarketCoin> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MarketCoin extends Equatable {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final double currentPrice;
  final int marketCap;
  final int marketCapRank;
  final int? fullyDilutedValuation;
  final double? totalVolume;
  final double? high24h;
  final double? low24h;
  final double? priceChange24h;
  final double? priceChangePercentage24h;
  final double? marketCapChange24h;
  final double? marketCapChangePercentage24h;
  final double? circulatingSupply;
  final double? totalSupply;
  final double? maxSupply;
  final double? ath;
  final double? athChangePercentage;
  final String? athDate;
  final String lastUpdated;
  final SparklineIn7d? sparklineIn7d;
  final double? priceChangePercentage1hInCurrency;
  final double? priceChangePercentage24hInCurrency;
  final double? priceChangePercentage7dInCurrency;
  final int? favouriteCacheId;

  const MarketCoin(
      {required this.id,
      required this.symbol,
      required this.name,
      required this.image,
      required this.currentPrice,
      required this.marketCap,
      required this.marketCapRank,
      this.fullyDilutedValuation,
      this.totalVolume,
      this.high24h,
      this.low24h,
      this.priceChange24h,
      this.priceChangePercentage24h,
      this.marketCapChange24h,
      this.marketCapChangePercentage24h,
      this.circulatingSupply,
      this.totalSupply,
      this.maxSupply,
      this.ath,
      this.athChangePercentage,
      this.athDate,
      required this.lastUpdated,
      this.sparklineIn7d,
      this.priceChangePercentage1hInCurrency,
      this.priceChangePercentage24hInCurrency,
      this.priceChangePercentage7dInCurrency,
      this.favouriteCacheId});

  MarketCoin copyWith({
    String? id,
    String? symbol,
    String? name,
    String? image,
    double? currentPrice,
    int? marketCap,
    int? marketCapRank,
    int? fullyDilutedValuation,
    double? totalVolume,
    double? high24h,
    double? low24h,
    double? priceChange24h,
    double? priceChangePercentage24h,
    double? marketCapChange24h,
    double? marketCapChangePercentage24h,
    double? circulatingSupply,
    double? totalSupply,
    double? maxSupply,
    double? ath,
    double? athChangePercentage,
    String? athDate,
    String? lastUpdated,
    SparklineIn7d? sparklineIn7d,
    double? priceChangePercentage1hInCurrency,
    double? priceChangePercentage24hInCurrency,
    double? priceChangePercentage7dInCurrency,
    int? favouriteCacheId,
  }) {
    return MarketCoin(
      id: id ?? this.id,
      symbol: symbol ?? this.symbol,
      name: name ?? this.name,
      image: image ?? this.image,
      currentPrice: currentPrice ?? this.currentPrice,
      marketCap: marketCap ?? this.marketCap,
      marketCapRank: marketCapRank ?? this.marketCapRank,
      fullyDilutedValuation:
          fullyDilutedValuation ?? this.fullyDilutedValuation,
      totalVolume: totalVolume ?? this.totalVolume,
      high24h: high24h ?? this.high24h,
      low24h: low24h ?? this.low24h,
      priceChange24h: priceChange24h ?? this.priceChange24h,
      priceChangePercentage24h:
          priceChangePercentage24h ?? this.priceChangePercentage24h,
      marketCapChange24h: marketCapChange24h ?? this.marketCapChange24h,
      marketCapChangePercentage24h:
          marketCapChangePercentage24h ?? this.marketCapChangePercentage24h,
      circulatingSupply: circulatingSupply ?? this.circulatingSupply,
      totalSupply: totalSupply ?? this.totalSupply,
      maxSupply: maxSupply ?? this.maxSupply,
      ath: ath ?? this.ath,
      athChangePercentage: athChangePercentage ?? this.athChangePercentage,
      athDate: athDate ?? this.athDate,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      sparklineIn7d: sparklineIn7d ?? this.sparklineIn7d,
      priceChangePercentage1hInCurrency: priceChangePercentage1hInCurrency ??
          this.priceChangePercentage1hInCurrency,
      priceChangePercentage24hInCurrency: priceChangePercentage24hInCurrency ??
          this.priceChangePercentage24hInCurrency,
      priceChangePercentage7dInCurrency: priceChangePercentage7dInCurrency ??
          this.priceChangePercentage7dInCurrency,
      favouriteCacheId:
          favouriteCacheId, //As null is a state i may set this to null when not set
    );
  }

  factory MarketCoin.fromJson(Map<String, dynamic> json) {
    return MarketCoin(
        id: json['id'],
        symbol: json['symbol'],
        name: json['name'],
        image: json['image'],
        currentPrice: json['current_price'].toDouble(),
        marketCap: json['market_cap'],
        marketCapRank: json['market_cap_rank'],
        fullyDilutedValuation: json['fully_diluted_valuation'],
        totalVolume: json['total_volume']?.toDouble(),
        high24h: json['high_24h']?.toDouble(),
        low24h: json['low_24h']?.toDouble(),
        priceChange24h: json['price_change_24h'],
        priceChangePercentage24h: json['price_change_percentage_24h'],
        marketCapChange24h: json['market_cap_change_24h']?.toDouble(),
        marketCapChangePercentage24h: json['market_cap_change_percentage_24h'],
        circulatingSupply: json['circulating_supply'],
        totalSupply: json['total_supply'],
        maxSupply: json['max_supply'],
        ath: json['ath'].toDouble(),
        athChangePercentage: json['ath_change_percentage'],
        athDate: json['ath_date'],
        lastUpdated: json['last_updated'],
        sparklineIn7d: json['sparkline_in_7d'] != null
            ? SparklineIn7d.fromJson(json['sparkline_in_7d'])
            : null,
        priceChangePercentage1hInCurrency:
            json['price_change_percentage_1h_in_currency'],
        priceChangePercentage24hInCurrency:
            json['price_change_percentage_24h_in_currency'],
        priceChangePercentage7dInCurrency:
            json['price_change_percentage_7d_in_currency']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['symbol'] = symbol;
    data['name'] = name;
    data['image'] = image;
    data['current_price'] = currentPrice;
    data['market_cap'] = marketCap;
    data['market_cap_rank'] = marketCapRank;
    data['fully_diluted_valuation'] = fullyDilutedValuation;
    data['total_volume'] = totalVolume;
    data['high_24h'] = high24h;
    data['low_24h'] = low24h;
    data['price_change_24h'] = priceChange24h;
    data['price_change_percentage_24h'] = priceChangePercentage24h;
    data['market_cap_change_24h'] = marketCapChange24h;
    data['market_cap_change_percentage_24h'] = marketCapChangePercentage24h;
    data['circulating_supply'] = circulatingSupply;
    data['total_supply'] = totalSupply;
    data['max_supply'] = maxSupply;
    data['ath'] = ath;
    data['ath_change_percentage'] = athChangePercentage;
    data['ath_date'] = athDate;
    // data['roi'] = this.roi;
    data['last_updated'] = lastUpdated;
    if (sparklineIn7d != null) {
      data['sparkline_in_7d'] = sparklineIn7d?.toJson();
    }
    data['price_change_percentage_1h_in_currency'] =
        priceChangePercentage1hInCurrency;
    data['price_change_percentage_24h_in_currency'] =
        priceChangePercentage24hInCurrency;
    data['price_change_percentage_7d_in_currency'] =
        priceChangePercentage7dInCurrency;
    return data;
  }

  bool get isFavourited => favouriteCacheId != null;

  double? get priceChange1h => priceChangePercentage1hInCurrency != null
      ? (priceChangePercentage1hInCurrency! / 100) * currentPrice
      : null;

  double? get priceChange7d => priceChangePercentage7dInCurrency != null
      ? (priceChangePercentage7dInCurrency! / 100) * currentPrice
      : null;

  @override
  List<Object?> get props =>
      [currentPrice, favouriteCacheId, priceChangePercentage24h];
}

class SparklineIn7d {
  final List<double> price;

  SparklineIn7d({required this.price});

  factory SparklineIn7d.fromJson(Map<String, dynamic> json) {
    return SparklineIn7d(price: json['price'].cast<double>());
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['price'] = price;
    return data;
  }
}
