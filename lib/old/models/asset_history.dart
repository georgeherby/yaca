class AssetHistorySplits {
  final List<HistoricalData> last24Hours;
  final List<HistoricalData> last7Days;
  final List<HistoricalData> last1Month;
  final List<HistoricalData> last6Month;
  final List<HistoricalData> last12Months;

  AssetHistorySplits({
    required this.last24Hours,
    required this.last7Days,
    required this.last1Month,
    required this.last6Month,
    required this.last12Months,
  });
}

class AssetHistory {
  late List<HistoricalData> history;
  late int timestamp;

  AssetHistory({required this.history, required this.timestamp});

  AssetHistory.fromJson(Map<String, dynamic> json) {
    history = <HistoricalData>[];
    json['data'].forEach((v) {
      history.add(new HistoricalData.fromJson(v));
    });

    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.history.map((v) => v.toJson()).toList();

    data['timestamp'] = this.timestamp;
    return data;
  }
}

class HistoricalData {
  late double priceUsd;
  late int time;

  HistoricalData({required this.priceUsd, required this.time});

  HistoricalData.fromJson(Map<String, dynamic> json) {
    priceUsd = double.parse(json['priceUsd']);
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['priceUsd'] = this.priceUsd;
    data['time'] = this.time;
    return data;
  }
}
