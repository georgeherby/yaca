class MarketDetails {
  late int marketCapUsd;
  late int volume24hUsd;
  late double bitcoinDominancePercentage;
  late int cryptocurrenciesNumber;
  late int marketCapAthValue;
  late String marketCapAthDate;
  late int volume24hAthValue;
  late String volume24hAthDate;
  late double marketCapChange24h;
  late double volume24hChange24h;
  late int lastUpdated;

  MarketDetails({
    required this.marketCapUsd,
    required this.volume24hUsd,
    required this.bitcoinDominancePercentage,
    required this.cryptocurrenciesNumber,
    required this.marketCapAthValue,
    required this.marketCapAthDate,
    required this.volume24hAthValue,
    required this.volume24hAthDate,
    required this.marketCapChange24h,
    required this.volume24hChange24h,
    required this.lastUpdated,
  });

  MarketDetails.fromJson(Map<String, dynamic> json) {
    marketCapUsd = json['market_cap_usd'];
    volume24hUsd = json['volume_24h_usd'];
    bitcoinDominancePercentage = json['bitcoin_dominance_percentage'].toDouble();
    cryptocurrenciesNumber = json['cryptocurrencies_number'];
    marketCapAthValue = json['market_cap_ath_value'];
    marketCapAthDate = json['market_cap_ath_date'];
    volume24hAthValue = json['volume_24h_ath_value'];
    volume24hAthDate = json['volume_24h_ath_date'];
    marketCapChange24h = json['market_cap_change_24h'].toDouble();
    volume24hChange24h = json['volume_24h_change_24h'].toDouble();
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['market_cap_usd'] = marketCapUsd;
    data['volume_24h_usd'] = volume24hUsd;
    data['bitcoin_dominance_percentage'] = bitcoinDominancePercentage;
    data['cryptocurrencies_number'] = cryptocurrenciesNumber;
    data['market_cap_ath_value'] = marketCapAthValue;
    data['market_cap_ath_date'] = marketCapAthDate;
    data['volume_24h_ath_value'] = volume24hAthValue;
    data['volume_24h_ath_date'] = volume24hAthDate;
    data['market_cap_change_24h'] = marketCapChange24h;
    data['volume_24h_change_24h'] = volume24hChange24h;
    data['last_updated'] = lastUpdated;
    return data;
  }
}
