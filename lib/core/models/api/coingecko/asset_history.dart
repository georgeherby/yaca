class AssetHistory {
  late List<TimeValuePair> prices;
  late List<TimeValuePair> marketCaps;
  late List<TimeValuePair> totalVolumes;

  AssetHistory(
      {required this.prices,
      required this.marketCaps,
      required this.totalVolumes});

  AssetHistory.fromJson(Map<String, dynamic> json) {
    if (json['prices'] != null) {
      prices = <TimeValuePair>[];
      json['prices'].forEach((v) {
        if (v is List) {
          prices.add(TimeValuePair(
              timeEpochUtc: v[0].toInt(), value: (v[1] ?? 0).toDouble()));
        }
      });
    }
    if (json['market_caps'] != null) {
      marketCaps = <TimeValuePair>[];
      json['market_caps'].forEach((v) {
        if (v is List) {
          marketCaps.add(TimeValuePair(
              timeEpochUtc: v[0].toInt(), value: (v[1] ?? 0).toDouble()));
        }
      });
    }
    if (json['total_volumes'] != null) {
      totalVolumes = <TimeValuePair>[];
      json['total_volumes'].forEach((v) {
        if (v is List) {
          totalVolumes.add(TimeValuePair(
              timeEpochUtc: v[0].toInt(), value: (v[1] ?? 0).toDouble()));
        }
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.prices != null) {
  //     data['prices'] = this.prices.map((v) => v.toJson()).toList();
  //   }
  //   if (this.marketCaps != null) {
  //     data['market_caps'] = this.marketCaps.map((v) => v.toJson()).toList();
  //   }
  //   if (this.totalVolumes != null) {
  //     data['total_volumes'] = this.totalVolumes.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class TimeValuePair {
  late final int timeEpochUtc;
  late final double value;

  TimeValuePair({required this.timeEpochUtc, required this.value});
}

class AssetHistorySplits {
  final AssetHistory last24Hours;
  // final AssetHistory last7Days;
  // final AssetHistory last1Month;
  final AssetHistory last3Month;
  final AssetHistory allMonths;
  AssetHistorySplits({
    required this.last24Hours,
    // required this.last7Days,
    // required this.last1Month,
    required this.last3Month,
    required this.allMonths,
  });
}
