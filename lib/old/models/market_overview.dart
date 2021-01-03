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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data.toJson();
    data['status'] = this.status.toJson();

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['btc_dominance'] = this.btcDominance;
    data['eth_dominance'] = this.ethDominance;
    data['active_cryptocurrencies'] = this.activeCryptocurrencies;
    data['total_cryptocurrencies'] = this.totalCryptocurrencies;
    data['active_market_pairs'] = this.activeMarketPairs;
    data['active_exchanges'] = this.activeExchanges;
    data['total_exchanges'] = this.totalExchanges;
    data['last_updated'] = this.lastUpdated;
    if (this.quote != null) {
      data['quote'] = this.quote.toJson();
    }
    return data;
  }
}

class Quote {
  late USD usd;

  Quote({required this.usd});

  Quote.fromJson(Map<String, dynamic> json) {
    usd = USD.fromJson(json['USD']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['USD'] = this.usd.toJson();

    return data;
  }
}

class USD {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_market_cap'] = this.totalMarketCap;
    data['total_volume_24h'] = this.totalVolume24h;
    data['total_volume_24h_reported'] = this.totalVolume24hReported;
    data['altcoin_volume_24h'] = this.altcoinVolume24h;
    data['altcoin_volume_24h_reported'] = this.altcoinVolume24hReported;
    data['altcoin_market_cap'] = this.altcoinMarketCap;
    data['last_updated'] = this.lastUpdated;
    return data;
  }
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = this.timestamp;
    data['error_code'] = this.errorCode;
    data['error_message'] = this.errorMessage;
    data['elapsed'] = this.elapsed;
    data['credit_count'] = this.creditCount;
    return data;
  }
}
