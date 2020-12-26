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
    final data = <String, dynamic>{};
    data['name'] = name;
    data['tickers'] = tickers.map((v) => v.toJson()).toList();

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
  late double? bidAskSpreadPercentage;
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
    final data = <String, dynamic>{};
    data['base'] = base;
    data['target'] = target;
    data['market'] = market.toJson();
    data['last'] = last;
    data['volume'] = volume;
    data['cost_to_move_up_usd'] = costToMoveUpUsd;
    data['cost_to_move_down_usd'] = costToMoveDownUsd;
    data['converted_last'] = convertedLast.toJson();
    data['converted_volume'] = convertedVolume.toJson();
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
    final data = <String, dynamic>{};
    data['name'] = name;
    data['identifier'] = identifier;
    data['has_trading_incentive'] = hasTradingIncentive;
    data['logo'] = logoUrl;
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
    final data = <String, dynamic>{};
    data['btc'] = btc;
    data['eth'] = eth;
    data['usd'] = usd;
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
    final data = <String, dynamic>{};
    data['btc'] = btc;
    data['eth'] = eth;
    data['usd'] = usd;
    return data;
  }
}
