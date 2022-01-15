class ExchangeTickers {
  String name;
  List<Tickers> tickers;

  ExchangeTickers({required this.name, required this.tickers});

  factory ExchangeTickers.fromJson(Map<String, dynamic> json) {
    var tickers = <Tickers>[];

    if (json['tickers'] != null) {
      json['tickers'].forEach((v) {
        tickers.add(Tickers.fromJson(v));
      });
    }

    return ExchangeTickers(name: json['name'], tickers: tickers);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['tickers'] = tickers.map((v) => v.toJson()).toList();

    return data;
  }
}

class Tickers {
  String base;
  String target;
  Market? market;
  double last;
  double volume;
  ConvertedLast? convertedLast;
  ConvertedLast? convertedVolume;
  String? trustScore;
  double? bidAskSpreadPercentage;
  String timestamp;
  String lastTradedAt;
  String lastFetchAt;
  bool isAnomaly;
  bool isStale;
  String? tradeUrl;
  String? tokenInfoUrl;
  String coinId;
  String? targetCoinId;

  Tickers(
      {required this.base,
      required this.target,
      required this.market,
      required this.last,
      required this.volume,
      required this.convertedLast,
      required this.convertedVolume,
      required this.trustScore,
      required this.bidAskSpreadPercentage,
      required this.timestamp,
      required this.lastTradedAt,
      required this.lastFetchAt,
      required this.isAnomaly,
      required this.isStale,
      required this.tradeUrl,
      required this.tokenInfoUrl,
      required this.coinId,
      required this.targetCoinId});

  factory Tickers.fromJson(Map<String, dynamic> json) {
    return Tickers(
      base: json['base'],
      target: json['target'],
      market: json['market'] != null ? Market.fromJson(json['market']) : null,
      last: json['last'],
      volume: json['volume'],
      convertedLast: json['converted_last'] != null
          ? ConvertedLast.fromJson(json['converted_last'])
          : null,
      convertedVolume: json['converted_volume'] != null
          ? ConvertedLast.fromJson(json['converted_volume'])
          : null,
      trustScore: json['trust_score'],
      bidAskSpreadPercentage: json['bid_ask_spread_percentage'],
      timestamp: json['timestamp'],
      lastTradedAt: json['last_traded_at'],
      lastFetchAt: json['last_fetch_at'],
      isAnomaly: json['is_anomaly'],
      isStale: json['is_stale'],
      tradeUrl: json['trade_url'],
      tokenInfoUrl: json['token_info_url'],
      coinId: json['coin_id'],
      targetCoinId: json['target_coin_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base'] = base;
    data['target'] = target;
    if (market != null) {
      data['market'] = market!.toJson();
    }
    data['last'] = last;
    data['volume'] = volume;
    if (convertedLast != null) {
      data['converted_last'] = convertedLast!.toJson();
    }
    if (convertedVolume != null) {
      data['converted_volume'] = convertedVolume!.toJson();
    }
    data['trust_score'] = trustScore;
    data['bid_ask_spread_percentage'] = bidAskSpreadPercentage;
    data['timestamp'] = timestamp;
    data['last_traded_at'] = lastTradedAt;
    data['last_fetch_at'] = lastFetchAt;
    data['is_anomaly'] = isAnomaly;
    data['is_stale'] = isStale;
    data['trade_url'] = tradeUrl;
    data['token_info_url'] = tokenInfoUrl;
    data['coin_id'] = coinId;
    data['target_coin_id'] = targetCoinId;
    return data;
  }
}

class Market {
  String name;
  String identifier;
  bool hasTradingIncentive;
  String logo;

  Market(
      {required this.name,
      required this.identifier,
      required this.hasTradingIncentive,
      required this.logo});

  factory Market.fromJson(Map<String, dynamic> json) {
    return Market(
      name: json['name'],
      identifier: json['identifier'],
      hasTradingIncentive: json['has_trading_incentive'],
      logo: json['logo'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['identifier'] = identifier;
    data['has_trading_incentive'] = hasTradingIncentive;
    data['logo'] = logo;
    return data;
  }
}

class ConvertedLast {
  double? btc;
  double? eth;
  double? usd;

  ConvertedLast({required this.btc, required this.eth, required this.usd});

  factory ConvertedLast.fromJson(Map<String, dynamic> json) {
    return ConvertedLast(
        btc: json['btc']?.toDouble(),
        eth: json['eth']?.toDouble(),
        usd: json['usd']?.toDouble());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['btc'] = btc;
    data['eth'] = eth;
    data['usd'] = usd;
    return data;
  }
}
