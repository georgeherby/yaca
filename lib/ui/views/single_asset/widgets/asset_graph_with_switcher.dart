// 🐦 Flutter imports:

// 🐦 Flutter imports:
import 'package:crypto_app/core/models/api/coingecko/asset_history.dart';
import 'package:crypto_app/ui/views/single_asset/widgets/asset_graph.dart';
import 'package:flutter/material.dart';

// 🌎 Project imports:

class _AssetGraphChipConfig {
  final String label;
  final Duration? duration;

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
  int _index = 1;

  final List<_AssetGraphChipConfig> _chips = [
    // _AssetGraphChipConfig("15m", Duration(minutes: 15)),
    // _AssetGraphChipConfig("30m", Duration(minutes: 30)),
    // _AssetGraphChipConfig("1H", Duration(hours: 1)),
    // _AssetGraphChipConfig("3h", Duration(hours: 3)),
    _AssetGraphChipConfig('12H', Duration(hours: 12)),
    _AssetGraphChipConfig('1D', Duration(days: 1)),
    _AssetGraphChipConfig('3D', Duration(days: 3)),
    _AssetGraphChipConfig('1W', Duration(days: 7)),
    _AssetGraphChipConfig('1M', Duration(days: 30)),
    _AssetGraphChipConfig('3M', Duration(days: 90)),
    _AssetGraphChipConfig('6M', Duration(days: 180)),
    _AssetGraphChipConfig('1Y', Duration(days: 365)),
    _AssetGraphChipConfig('3Y', Duration(days: 365 * 3)),
    _AssetGraphChipConfig('All', null),
  ];

  @override
  Widget build(BuildContext context) {
    var _duration = _chips[_index].duration;
    var _data = applyFilter(widget.allHistory, _duration);

    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      _data.isNotEmpty
          ? AssetGraph(
              history: _data,
              duration: _duration,
            )
          : SizedBox(
              height: 250,
              width: double.infinity,
              child: Center(
                child: Text('No historical data found.'),
              ),
            ),
      Divider(
        thickness: 8,
        color: Colors.transparent,
      ),
      Wrap(
        spacing: 8,
        runSpacing: 6,
        children: List.generate(_chips.length, (listIndex) {
          var _selected = listIndex == _index;
          return Theme(
            data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
            child: ChoiceChip(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: StadiumBorder(
                  side: BorderSide(color: Theme.of(context).primaryColor)),
              padding: EdgeInsets.symmetric(horizontal: 3),
              selectedColor: Theme.of(context).chipTheme.selectedColor,
              label: Text(
                _chips[listIndex].label,
                textAlign: TextAlign.center,
                style: Theme.of(context).chipTheme.labelStyle.copyWith(
                    fontWeight: _selected ? FontWeight.bold : FontWeight.normal,
                    color: _selected &&
                            Theme.of(context).brightness == Brightness.light
                        ? Colors.white
                        : Theme.of(context).chipTheme.labelStyle.color),
              ),
              selected: listIndex == _index,
              onSelected: (bool selected) {
                setState(() {
                  _index = listIndex;
                });
              },
            ),
          );
        }),
      ),
    ]);
  }

  List<TimeValuePair> applyFilter(
      AssetHistorySplits historySplits, Duration? duration) {
    List<TimeValuePair> data;

    if (duration != null) {
      debugPrint(duration.toString());
      if (duration <= Duration(hours: 24)) {
        data = historySplits.last24Hours.prices;
      } else if (duration <= Duration(days: 90)) {
        data = historySplits.last3Month.prices;
      } else {
        data = historySplits.allMonths.prices;
      }

      return data
          .where((element) =>
              element.timeEpochUtc >
              DateTime.now().subtract(duration).millisecondsSinceEpoch)
          .toList();
    } else {
      return historySplits.allMonths.prices;
    }
  }
}
