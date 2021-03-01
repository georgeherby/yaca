class ExchangeTicker {
  late String name;
  late List<Tickers> tickers;

  ExchangeTicker({required this.name, required this.tickers});

  ExchangeTicker.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['tickers'] != null) {
      tickers = <Tickers>[];
      json['tickers'].forEach((v) {
        tickers.add(Tickers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['tickers'] = this.tickers.map((v) => v.toJson()).toList();

    return data;
  }
}

class Tickers {
  late String base;
  late String target;
  late Market market;
  late double last;
  late double volume;
  late double costToMoveUpUsd;
  late double costToMoveDownUsd;
  late ConvertedLast convertedLast;
  late ConvertedVolume convertedVolume;
  late String? trustScore;
  late double bidAskSpreadPercentage;
  late String timestamp;
  late String lastTradedAt;
  late String lastFetchAt;
  late bool isAnomaly;
  late bool isStale;
  late String? tradeUrl;
  late String? tokenInfoUrl;
  late String coinId;
  late String? targetCoinId;

  Tickers({
    required this.base,
    required this.target,
    required this.market,
    required this.last,
    required this.volume,
    required this.costToMoveUpUsd,
    required this.costToMoveDownUsd,
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
    required this.targetCoinId,
  });

  Tickers.fromJson(Map<String, dynamic> json) {
    base = json['base'];
    target = json['target'];
    market = Market.fromJson(json['market']);
    last = json['last'];
    volume = json['volume'];
    costToMoveUpUsd = json['cost_to_move_up_usd'];
    costToMoveDownUsd = json['cost_to_move_down_usd'];
    convertedLast = ConvertedLast.fromJson(json['converted_last']);
    convertedVolume = ConvertedVolume.fromJson(json['converted_volume']);
    trustScore = json['trust_score'];
    bidAskSpreadPercentage = json['bid_ask_spread_percentage'];
    timestamp = json['timestamp'];
    lastTradedAt = json['last_traded_at'];
    lastFetchAt = json['last_fetch_at'];
    isAnomaly = json['is_anomaly'];
    isStale = json['is_stale'];
    tradeUrl = json['trade_url'];
    tokenInfoUrl = json['token_info_url'];
    coinId = json['coin_id'];
    targetCoinId = json['target_coin_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['base'] = this.base;
    data['target'] = this.target;
    data['market'] = this.market.toJson();
    data['last'] = this.last;
    data['volume'] = this.volume;
    data['cost_to_move_up_usd'] = this.costToMoveUpUsd;
    data['cost_to_move_down_usd'] = this.costToMoveDownUsd;
    data['converted_last'] = this.convertedLast.toJson();
    data['converted_volume'] = this.convertedVolume.toJson();
    data['trust_score'] = this.trustScore;
    data['bid_ask_spread_percentage'] = this.bidAskSpreadPercentage;
    data['timestamp'] = this.timestamp;
    data['last_traded_at'] = this.lastTradedAt;
    data['last_fetch_at'] = this.lastFetchAt;
    data['is_anomaly'] = this.isAnomaly;
    data['is_stale'] = this.isStale;
    data['trade_url'] = this.tradeUrl;
    data['token_info_url'] = this.tokenInfoUrl;
    data['coin_id'] = this.coinId;
    data['target_coin_id'] = this.targetCoinId;
    return data;
  }
}

class Market {
  late String name;
  late String identifier;
  late bool hasTradingIncentive;
  late String logoUrl;

  Market({
    required this.name,
    required this.identifier,
    required this.hasTradingIncentive,
    required this.logoUrl,
  });

  Market.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    identifier = json['identifier'];
    hasTradingIncentive = json['has_trading_incentive'];
    logoUrl = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['identifier'] = this.identifier;
    data['has_trading_incentive'] = this.hasTradingIncentive;
    data['logo'] = this.logoUrl;
    return data;
  }
}

class ConvertedLast {
  late double btc;
  late double eth;
  late double usd;

  ConvertedLast({
    required this.btc,
    required this.eth,
    required this.usd,
  });

  ConvertedLast.fromJson(Map<String, dynamic> json) {
    btc = json['btc'].toDouble();
    eth = json['eth'].toDouble();
    usd = json['usd'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['btc'] = this.btc;
    data['eth'] = this.eth;
    data['usd'] = this.usd;
    return data;
  }
}

class ConvertedVolume {
  late double btc;
  late double eth;
  late double usd;

  ConvertedVolume({
    required this.btc,
    required this.eth,
    required this.usd,
  });

  ConvertedVolume.fromJson(Map<String, dynamic> json) {
    btc = json['btc'].toDouble();
    eth = json['eth'].toDouble();
    usd = json['usd'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['btc'] = this.btc;
    data['eth'] = this.eth;
    data['usd'] = this.usd;
    return data;
  }
}
