import 'package:crypto_app/old/models/asset_history.dart';
import 'package:crypto_app/old/widgets/asset_graph.dart';
import 'package:flutter/material.dart';

class _AssetGraphChipConfig {
  final String label;
  final Duration duration;

  _AssetGraphChipConfig(this.label, this.duration);
}

class AssetGraphWithSwitcher extends StatefulWidget {
  final AssetHistorySplits allHistory;

  const AssetGraphWithSwitcher({
    Key? key,
    required this.allHistory,
  }) : super(key: key);

  @override
  _AssetGraphWithSwitcherState createState() => _AssetGraphWithSwitcherState();
}

class _AssetGraphWithSwitcherState extends State<AssetGraphWithSwitcher> {
  int _index = 2;

  List<_AssetGraphChipConfig> _chips = [
    _AssetGraphChipConfig("15m", Duration(minutes: 15)),
    _AssetGraphChipConfig("30m", Duration(minutes: 30)),
    _AssetGraphChipConfig("1h", Duration(hours: 1)),
    _AssetGraphChipConfig("3h", Duration(hours: 3)),
    _AssetGraphChipConfig("12h", Duration(hours: 12)),
    _AssetGraphChipConfig("24h", Duration(days: 1)),
    _AssetGraphChipConfig("48h", Duration(days: 2)),
    _AssetGraphChipConfig("7d", Duration(days: 7)),
    _AssetGraphChipConfig("30d", Duration(days: 30)),
    _AssetGraphChipConfig("90d", Duration(days: 90)),
    _AssetGraphChipConfig("180d", Duration(days: 180)),
    _AssetGraphChipConfig("1y", Duration(days: 365)),
  ];

  @override
  Widget build(BuildContext context) {
    List<HistoricalData> data = applyFilter(widget.allHistory, _chips[_index].duration);

    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      data.length > 0
          ? AssetGraph(history: data, currencyRate: widget.allHistory.usdRate)
          : SizedBox(
              height: 250,
              width: double.infinity,
              child: Center(
                child: Text("No historical data found."),
              ),
            ),
      Divider(
        thickness: 8,
        color: Colors.transparent,
      ),
      Wrap(
          spacing: 8,
          children: List.generate(_chips.length, (listIndex) {
            return ChoiceChip(
              pressElevation: 0,
              selectedColor: Theme.of(context).primaryColor.withOpacity(0.1),
              backgroundColor: Colors.transparent,
              shape: StadiumBorder(side: BorderSide(color: Theme.of(context).primaryColor)),
              label: Text(_chips[listIndex].label),
              elevation: 0,
              selected: listIndex == _index,
              onSelected: (bool selected) {
                setState(() {
                  _index = listIndex;
                });
              },
            );
          }))
    ]);
  }

  List<HistoricalData> applyFilter(AssetHistorySplits historySplits, Duration duration) {
    List<HistoricalData> data;

    if (duration <= Duration(hours: 24)) {
      data = historySplits.last24Hours;
    } else if (duration <= Duration(days: 7)) {
      data = historySplits.last7Days;
    } else if (duration <= Duration(days: 30)) {
      data = historySplits.last1Month;
    } else if (duration <= Duration(days: 90)) {
      data = historySplits.last6Month;
    } else if (duration <= Duration(days: 180)) {
      data = historySplits.last6Month;
    } else {
      data = historySplits.last12Months;
    }

    return data
        .where((element) => element.time > DateTime.now().subtract(duration).millisecondsSinceEpoch)
        .toList();
  }
}
