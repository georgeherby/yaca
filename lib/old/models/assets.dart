class Assets {
  late List<Asset> data;
  late int timestamp;

  Assets({required this.data, required this.timestamp});

  Assets.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Asset>[];
      json['data'].forEach((v) {
        data.add(Asset.fromJson(v));
      });
    }
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['data'] = this.data.map((v) => v.toJson()).toList();
    data['timestamp'] = timestamp;
    return data;
  }
}

class Asset {
  late String id;
  late String rank;
  late String symbol;
  late String name;
  late double? supply;
  late double? maxSupply;
  late double? marketCapUsd;
  late double? volumeUsd24Hr;
  late double? priceUsd;
  late double? changePercent24Hr;
  late double? vwap24Hr;
  int? favouriteCacheId;

  Asset(
      {required this.id,
      required this.rank,
      required this.symbol,
      required this.name,
      this.supply,
      this.maxSupply,
      this.marketCapUsd,
      this.volumeUsd24Hr,
      this.priceUsd,
      this.changePercent24Hr,
      this.vwap24Hr});
  Asset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rank = json['rank'];
    symbol = json['symbol'];
    name = json['name'];
    supply = json['supply'] != null ? double.parse(json['supply']) : null;
    maxSupply = json['maxSupply'] != null ? double.parse(json['maxSupply']) : null;
    marketCapUsd = json['marketCapUsd'] != null ? double.parse(json['marketCapUsd']) : null;
    volumeUsd24Hr = json['volumeUsd24Hr'] != null ? double.parse(json['volumeUsd24Hr']) : null;
    priceUsd = json['priceUsd'] != null ? double.parse(json['priceUsd']) : null;
    changePercent24Hr =
        json['changePercent24Hr'] != null ? double.parse(json['changePercent24Hr']) : null;
    vwap24Hr = json['vwap24Hr'] != null ? double.parse(json['vwap24Hr']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['rank'] = rank;
    data['symbol'] = symbol;
    data['name'] = name;
    data['supply'] = supply;
    data['maxSupply'] = maxSupply;
    data['marketCapUsd'] = marketCapUsd;
    data['volumeUsd24Hr'] = volumeUsd24Hr;
    data['priceUsd'] = priceUsd;
    data['changePercent24Hr'] = changePercent24Hr;
    data['vwap24Hr'] = vwap24Hr;
    return data;
  }

  bool get isFavourited => favouriteCacheId != null;


}
