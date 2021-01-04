class AssetOverview {
  late List<AssetData> data;
  late Status status;

  AssetOverview({
    required this.data,
    required this.status,
  });

  AssetOverview.fromJson(Map<String, dynamic> json) {
    data = <AssetData>[];
    json['data'].forEach((v) {
      data.add(new AssetData.fromJson(v));
    });

    status = Status.fromJson(json['status']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data.map((v) => v.toJson()).toList();

    data['status'] = this.status.toJson();

    return data;
  }
}

class AssetData {
  late int id;
  late String name;
  late String symbol;
  late String slug;
  late int cmcRank;
  late int numMarketPairs;
  late double circulatingSupply;
  late double totalSupply;
  late double? maxSupply;
  late String lastUpdated;
  late String dateAdded;
  late List<String> tags;
  late Quote quote;
  int? _favCacheId;

  AssetData(
      {required this.id,
      required this.name,
      required this.symbol,
      required this.slug,
      required this.cmcRank,
      required this.numMarketPairs,
      required this.circulatingSupply,
      required this.totalSupply,
      required this.maxSupply,
      required this.lastUpdated,
      required this.dateAdded,
      required this.tags,
      required this.quote});

  AssetData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    slug = json['slug'];
    cmcRank = json['cmc_rank'];
    numMarketPairs = json['num_market_pairs'];
    circulatingSupply = json['circulating_supply'].toDouble();
    totalSupply = json['total_supply'].toDouble();
    maxSupply = json['max_supply'] != null ? json['max_supply'].toDouble() : null;
    lastUpdated = json['last_updated'];
    dateAdded = json['date_added'];
    tags = json['tags'].cast<String>();
    quote = Quote.fromJson(json['quote']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['symbol'] = this.symbol;
    data['slug'] = this.slug;
    data['cmc_rank'] = this.cmcRank;
    data['num_market_pairs'] = this.numMarketPairs;
    data['circulating_supply'] = this.circulatingSupply;
    data['total_supply'] = this.totalSupply;
    data['max_supply'] = this.maxSupply;
    data['last_updated'] = this.lastUpdated;
    data['date_added'] = this.dateAdded;
    data['tags'] = this.tags;
    data['quote'] = this.quote.toJson();

    return data;
  }

  bool get isFavourited => this._favCacheId != null;

  int? get favouriteCacheId => this._favCacheId;

  set favouriteCacheId(int? favouriteCacheId) => this._favCacheId = favouriteCacheId;
}

class Quote {
  USD? usd;
  GBP? gbp;

  Quote({
    this.usd,
    this.gbp,
  });

  Quote.fromJson(Map<String, dynamic> json) {
    usd = json['USD'] != null ? new USD.fromJson(json['USD']) : null;
    gbp = json['GBP'] != null ? new GBP.fromJson(json['GBP']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.usd != null) {
      data['USD'] = this.usd!.toJson();
    }
    if (this.gbp != null) {
      data['GBP'] = this.gbp!.toJson();
    }
    return data;
  }
}

class USD {
  late double price;
  late double volume24h;
  late double percentChange1h;
  late double percentChange24h;
  late double percentChange7d;
  late double marketCap;
  late String lastUpdated;

  USD(
      {required this.price,
      required this.volume24h,
      required this.percentChange1h,
      required this.percentChange24h,
      required this.percentChange7d,
      required this.marketCap,
      required this.lastUpdated});

  USD.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    volume24h = json['volume_24h'];
    percentChange1h = json['percent_change_1h'].toDouble();
    percentChange24h = json['percent_change_24h'].toDouble();
    percentChange7d = json['percent_change_7d'].toDouble();
    marketCap = json['market_cap'];
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['volume_24h'] = this.volume24h;
    data['percent_change_1h'] = this.percentChange1h;
    data['percent_change_24h'] = this.percentChange24h;
    data['percent_change_7d'] = this.percentChange7d;
    data['market_cap'] = this.marketCap;
    data['last_updated'] = this.lastUpdated;
    return data;
  }
}

class GBP {
  late double price;
  late double volume24h;
  late double? percentChange1h;
  late double? percentChange24h;
  late double? percentChange7d;
  late double marketCap;
  late String lastUpdated;

  GBP(
      {required this.price,
      required this.volume24h,
      required this.percentChange1h,
      required this.percentChange24h,
      required this.percentChange7d,
      required this.marketCap,
      required this.lastUpdated});

  GBP.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    volume24h = json['volume_24h'];
    percentChange1h =
        json['percent_change_1h'] != null ? json['percent_change_1h'].toDouble() : null;
    percentChange24h =
        json['percent_change_24h'] != null ? json['percent_change_24h'].toDouble() : null;
    percentChange7d =
        json['percent_change_7d'] != null ? json['percent_change_7d'].toDouble() : null;
    marketCap = json['market_cap'];
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['volume_24h'] = this.volume24h;
    data['percent_change_1h'] = this.percentChange1h;
    data['percent_change_24h'] = this.percentChange24h;
    data['percent_change_7d'] = this.percentChange7d;
    data['market_cap'] = this.marketCap;
    data['last_updated'] = this.lastUpdated;
    return data;
  }

  double? get priceChange1h =>
      this.percentChange1h != null ? (this.percentChange1h! / 100) * this.price : null;
  double? get priceChange24h =>
      this.percentChange24h != null ? (this.percentChange24h! / 100) * this.price : null;
  double? get priceChange7d =>
      this.percentChange7d != null ? (this.percentChange7d! / 100) * this.price : null;
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
