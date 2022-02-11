// 📦 Package imports:
import 'package:coingecko_api/data/market_chart_data.dart';

class AssetHistorySplits {
  final List<MarketChartData> last24Hours;
  // final AssetHistory last7Days;
  // final AssetHistory last1Month;
  final List<MarketChartData> last3Month;
  final List<MarketChartData> allMonths;
  AssetHistorySplits({
    required this.last24Hours,
    // required this.last7Days,
    // required this.last1Month,
    required this.last3Month,
    required this.allMonths,
  });
}
