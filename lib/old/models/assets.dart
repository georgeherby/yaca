class Assets {
  late List<Asset> data;
  late int timestamp;

  Assets({required this.data, required this.timestamp});

  Assets.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Asset>[];
      json['data'].forEach((v) {
        data.add(new Asset.fromJson(v));
      });
    }
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data.map((v) => v.toJson()).toList();
    data['timestamp'] = this.timestamp;
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
  int? _favCacheId;

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rank'] = this.rank;
    data['symbol'] = this.symbol;
    data['name'] = this.name;
    data['supply'] = this.supply;
    data['maxSupply'] = this.maxSupply;
    data['marketCapUsd'] = this.marketCapUsd;
    data['volumeUsd24Hr'] = this.volumeUsd24Hr;
    data['priceUsd'] = this.priceUsd;
    data['changePercent24Hr'] = this.changePercent24Hr;
    data['vwap24Hr'] = this.vwap24Hr;
    return data;
  }

  bool get isFavourited => this._favCacheId != null;

  int? get favouriteCacheId => this._favCacheId;

  set favouriteCacheId(int? favouriteCacheId) => this._favCacheId = favouriteCacheId;
}
