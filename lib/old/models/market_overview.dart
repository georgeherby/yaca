import 'package:crypto_app/old/models/currency.dart';

class GlobalMarketOverview {
  late MarketData data;
  late Status status;

  GlobalMarketOverview({
    required this.data,
    required this.status,
  });

  GlobalMarketOverview.fromJson(Map<String, dynamic> json) {
    data = MarketData.fromJson(json['data']);
    status = Status.fromJson(json['status']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['data'] = this.data.toJson();
    data['status'] = status.toJson();

    return data;
  }
}

class MarketData {
  late double btcDominance;
  late double ethDominance;
  late int activeCryptocurrencies;
  late int totalCryptocurrencies;
  late int activeMarketPairs;
  late int activeExchanges;
  late int totalExchanges;
  late String lastUpdated;
  late Quote quote;

  MarketData(
      {required this.btcDominance,
      required this.ethDominance,
      required this.activeCryptocurrencies,
      required this.totalCryptocurrencies,
      required this.activeMarketPairs,
      required this.activeExchanges,
      required this.totalExchanges,
      required this.lastUpdated,
      required this.quote});

  MarketData.fromJson(Map<String, dynamic> json) {
    btcDominance = json['btc_dominance'];
    ethDominance = json['eth_dominance'];
    activeCryptocurrencies = json['active_cryptocurrencies'];
    totalCryptocurrencies = json['total_cryptocurrencies'];
    activeMarketPairs = json['active_market_pairs'];
    activeExchanges = json['active_exchanges'];
    totalExchanges = json['total_exchanges'];
    lastUpdated = json['last_updated'];
    quote = Quote.fromJson(json['quote']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['btc_dominance'] = btcDominance;
    data['eth_dominance'] = ethDominance;
    data['active_cryptocurrencies'] = activeCryptocurrencies;
    data['total_cryptocurrencies'] = totalCryptocurrencies;
    data['active_market_pairs'] = activeMarketPairs;
    data['active_exchanges'] = activeExchanges;
    data['total_exchanges'] = totalExchanges;
    data['last_updated'] = lastUpdated;
    data['quote'] = quote.toJson();

    return data;
  }
}

class Quote {
  USD? usd;
  GBP? gbp;

  Quote({
    this.usd,
    this.gbp,
  });

  Quote.fromJson(Map<String, dynamic> json) {
    usd = json['USD'] != null ? USD.fromJson(json['USD']) : null;
    gbp = json['GBP'] != null ? GBP.fromJson(json['GBP']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (usd != null) {
      data['USD'] = usd!.toJson();
    }
    if (gbp != null) {
      data['GBP'] = gbp!.toJson();
    }
    return data;
  }
}

class USD implements Currency {
  late double totalMarketCap;
  late double totalVolume24h;
  late double totalVolume24hReported;
  late double altcoinVolume24h;
  late double altcoinVolume24hReported;
  late double altcoinMarketCap;
  late String lastUpdated;

  USD(
      {required this.totalMarketCap,
      required this.totalVolume24h,
      required this.totalVolume24hReported,
      required this.altcoinVolume24h,
      required this.altcoinVolume24hReported,
      required this.altcoinMarketCap,
      required this.lastUpdated});

  USD.fromJson(Map<String, dynamic> json) {
    totalMarketCap = json['total_market_cap'];
    totalVolume24h = json['total_volume_24h'];
    totalVolume24hReported = json['total_volume_24h_reported'];
    altcoinVolume24h = json['altcoin_volume_24h'];
    altcoinVolume24hReported = json['altcoin_volume_24h_reported'];
    altcoinMarketCap = json['altcoin_market_cap'];
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['total_market_cap'] = totalMarketCap;
    data['total_volume_24h'] = totalVolume24h;
    data['total_volume_24h_reported'] = totalVolume24hReported;
    data['altcoin_volume_24h'] = altcoinVolume24h;
    data['altcoin_volume_24h_reported'] = altcoinVolume24hReported;
    data['altcoin_market_cap'] = altcoinMarketCap;
    data['last_updated'] = lastUpdated;
    return data;
  }

  @override
  String get currencySymbol => '\$';
}

class GBP implements Currency {
  late double totalMarketCap;
  late double totalVolume24h;
  late double totalVolume24hReported;
  late double altcoinVolume24h;
  late double altcoinVolume24hReported;
  late double altcoinMarketCap;
  late String lastUpdated;

  GBP(
      {required this.totalMarketCap,
      required this.totalVolume24h,
      required this.totalVolume24hReported,
      required this.altcoinVolume24h,
      required this.altcoinVolume24hReported,
      required this.altcoinMarketCap,
      required this.lastUpdated});

  GBP.fromJson(Map<String, dynamic> json) {
    totalMarketCap = json['total_market_cap'];
    totalVolume24h = json['total_volume_24h'];
    totalVolume24hReported = json['total_volume_24h_reported'];
    altcoinVolume24h = json['altcoin_volume_24h'];
    altcoinVolume24hReported = json['altcoin_volume_24h_reported'];
    altcoinMarketCap = json['altcoin_market_cap'];
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['total_market_cap'] = totalMarketCap;
    data['total_volume_24h'] = totalVolume24h;
    data['total_volume_24h_reported'] = totalVolume24hReported;
    data['altcoin_volume_24h'] = altcoinVolume24h;
    data['altcoin_volume_24h_reported'] = altcoinVolume24hReported;
    data['altcoin_market_cap'] = altcoinMarketCap;
    data['last_updated'] = lastUpdated;
    return data;
  }

  @override
  String get currencySymbol => '\£';
}

class Status {
  late String timestamp;
  late int errorCode;
  late String errorMessage;
  late int elapsed;
  late int creditCount;

  Status(
      {required this.timestamp,
      required this.errorCode,
      required this.errorMessage,
      required this.elapsed,
      required this.creditCount});

  Status.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    errorCode = json['error_code'];
    errorMessage = json['error_message'];
    elapsed = json['elapsed'];
    creditCount = json['credit_count'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    data['error_code'] = errorCode;
    data['error_message'] = errorMessage;
    data['elapsed'] = elapsed;
    data['credit_count'] = creditCount;
    return data;
  }
}
