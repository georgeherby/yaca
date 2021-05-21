// 🎯 Dart imports:
import 'dart:convert';

List<MarketCoin> marketCoinFromJson(String str) =>
    List<MarketCoin>.from(json.decode(str).map((x) => MarketCoin.fromJson(x)));

String marketCoinToJson(List<MarketCoin> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MarketCoin {
  late String id;
  late String symbol;
  late String name;
  late String image;
  late double currentPrice;
  late int marketCap;
  late int marketCapRank;
  late int? fullyDilutedValuation;
  late double? totalVolume;
  late double? high24h;
  late double? low24h;
  late double? priceChange24h;
  late double? priceChangePercentage24h;
  late double? marketCapChange24h;
  late double? marketCapChangePercentage24h;
  late double? circulatingSupply;
  late double? totalSupply;
  late double? maxSupply;
  late double? ath;
  late double? athChangePercentage;
  late String? athDate;
  late String lastUpdated;
  late SparklineIn7d? sparklineIn7d;
  late double? priceChangePercentage1hInCurrency;
  late double? priceChangePercentage24hInCurrency;
  late double? priceChangePercentage7dInCurrency;
  int? favouriteCacheId;

  MarketCoin(
      {required this.id,
      required this.symbol,
      required this.name,
      required this.image,
      required this.currentPrice,
      required this.marketCap,
      required this.marketCapRank,
      required this.fullyDilutedValuation,
      required this.totalVolume,
      required this.high24h,
      required this.low24h,
      required this.priceChange24h,
      required this.priceChangePercentage24h,
      required this.marketCapChange24h,
      required this.marketCapChangePercentage24h,
      required this.circulatingSupply,
      required this.totalSupply,
      required this.maxSupply,
      required this.ath,
      required this.athChangePercentage,
      required this.athDate,
      required this.lastUpdated,
      required this.sparklineIn7d,
      required this.priceChangePercentage1hInCurrency,
      required this.priceChangePercentage24hInCurrency,
      required this.priceChangePercentage7dInCurrency});

  MarketCoin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbol = json['symbol'];
    name = json['name'];
    image = json['image'];
    currentPrice = json['current_price'].toDouble();
    marketCap = json['market_cap'];
    marketCapRank = json['market_cap_rank'];
    fullyDilutedValuation = json['fully_diluted_valuation'];
    totalVolume = json['total_volume'] != null ? json['total_volume'].toDouble() : null;
    high24h = json['high_24h'] != null ? json['high_24h'].toDouble() : null;
    low24h = json['low_24h'] != null ? json['low_24h'].toDouble() : null;
    priceChange24h = json['price_change_24h'];
    priceChangePercentage24h = json['price_change_percentage_24h'];
    marketCapChange24h =
        json['market_cap_change_24h'] != null ? json['market_cap_change_24h'].toDouble() : null;
    marketCapChangePercentage24h = json['market_cap_change_percentage_24h'];
    circulatingSupply = json['circulating_supply'];
    totalSupply = json['total_supply'];
    maxSupply = json['max_supply'];
    ath = json['ath'].toDouble();
    athChangePercentage = json['ath_change_percentage'];
    athDate = json['ath_date'];
    lastUpdated = json['last_updated'];
    sparklineIn7d =
        json['sparkline_in_7d'] != null ? SparklineIn7d.fromJson(json['sparkline_in_7d']) : null;
    priceChangePercentage1hInCurrency = json['price_change_percentage_1h_in_currency'];
    priceChangePercentage24hInCurrency = json['price_change_percentage_24h_in_currency'];
    priceChangePercentage7dInCurrency = json['price_change_percentage_7d_in_currency'];
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
    data['price_change_percentage_1h_in_currency'] = priceChangePercentage1hInCurrency;
    data['price_change_percentage_24h_in_currency'] = priceChangePercentage24hInCurrency;
    data['price_change_percentage_7d_in_currency'] = priceChangePercentage7dInCurrency;
    return data;
  }

  bool get isFavourited => favouriteCacheId != null;

  double? get priceChange1h => priceChangePercentage1hInCurrency != null
      ? (priceChangePercentage1hInCurrency! / 100) * currentPrice
      : null;

  double? get priceChange7d => priceChangePercentage7dInCurrency != null
      ? (priceChangePercentage7dInCurrency! / 100) * currentPrice
      : null;
}

class SparklineIn7d {
  late List<double> price;

  SparklineIn7d({required this.price});

  SparklineIn7d.fromJson(Map<String, dynamic> json) {
    price = json['price'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['price'] = price;
    return data;
  }
}
