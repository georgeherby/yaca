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
  int? _favCacheId;

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['symbol'] = this.symbol;
    data['name'] = this.name;
    data['image'] = this.image;
    data['current_price'] = this.currentPrice;
    data['market_cap'] = this.marketCap;
    data['market_cap_rank'] = this.marketCapRank;
    data['fully_diluted_valuation'] = this.fullyDilutedValuation;
    data['total_volume'] = this.totalVolume;
    data['high_24h'] = this.high24h;
    data['low_24h'] = this.low24h;
    data['price_change_24h'] = this.priceChange24h;
    data['price_change_percentage_24h'] = this.priceChangePercentage24h;
    data['market_cap_change_24h'] = this.marketCapChange24h;
    data['market_cap_change_percentage_24h'] = this.marketCapChangePercentage24h;
    data['circulating_supply'] = this.circulatingSupply;
    data['total_supply'] = this.totalSupply;
    data['max_supply'] = this.maxSupply;
    data['ath'] = this.ath;
    data['ath_change_percentage'] = this.athChangePercentage;
    data['ath_date'] = this.athDate;
    // data['roi'] = this.roi;
    data['last_updated'] = this.lastUpdated;
    if (this.sparklineIn7d != null) {
      data['sparkline_in_7d'] = this.sparklineIn7d?.toJson();
    }
    data['price_change_percentage_1h_in_currency'] = this.priceChangePercentage1hInCurrency;
    data['price_change_percentage_24h_in_currency'] = this.priceChangePercentage24hInCurrency;
    data['price_change_percentage_7d_in_currency'] = this.priceChangePercentage7dInCurrency;
    return data;
  }

  bool get isFavourited => this._favCacheId != null;

  int? get favouriteCacheId => this._favCacheId;

  set favouriteCacheId(int? favouriteCacheId) => this._favCacheId = favouriteCacheId;

  double? get priceChange1h => this.priceChangePercentage1hInCurrency != null
      ? (this.priceChangePercentage1hInCurrency! / 100) * this.currentPrice
      : null;

  double? get priceChange7d => this.priceChangePercentage7dInCurrency != null
      ? (this.priceChangePercentage7dInCurrency! / 100) * this.currentPrice
      : null;
}

class SparklineIn7d {
  late List<double> price;

  SparklineIn7d({required this.price});

  SparklineIn7d.fromJson(Map<String, dynamic> json) {
    price = json['price'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    return data;
  }
}
