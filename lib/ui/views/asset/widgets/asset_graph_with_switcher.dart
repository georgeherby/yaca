// 🐦 Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:yaca/core/extensions/platform.dart';
import 'package:yaca/core/models/api/coingecko/asset_history.dart';
import 'package:yaca/ui/views/asset/widgets/asset_graph.dart';

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
  int _index = 2;

  final List<_AssetGraphChipConfig> _chips = [
    _AssetGraphChipConfig('3h', const Duration(hours: 3)),
    _AssetGraphChipConfig('12H', const Duration(hours: 12)),
    _AssetGraphChipConfig('1D', const Duration(days: 1)),
    _AssetGraphChipConfig('3D', const Duration(days: 3)),
    _AssetGraphChipConfig('1W', const Duration(days: 7)),
    _AssetGraphChipConfig('1M', const Duration(days: 30)),
    _AssetGraphChipConfig('3M', const Duration(days: 90)),
    _AssetGraphChipConfig('6M', const Duration(days: 180)),
    _AssetGraphChipConfig('1Y', const Duration(days: 365)),
    _AssetGraphChipConfig('3Y', const Duration(days: 365 * 3)),
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
          : const SizedBox(
              height: 250,
              width: double.infinity,
              child: Center(
                child: Text('No historical data found'),
              ),
            ),
      Padding(
        padding: const EdgeInsets.only(bottom: 8, top: 16),
        child: (Theme.of(context).platform.isDesktop() || kIsWeb)
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: List.generate(_chips.length, (listIndex) {
                    var _selected = listIndex == _index;
                    return Theme(
                      data: Theme.of(context)
                          .copyWith(canvasColor: Colors.transparent),
                      child: ChoiceChip(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        selectedColor:
                            Theme.of(context).chipTheme.selectedColor,
                        label: Text(
                          _chips[listIndex].label,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .chipTheme
                              .labelStyle
                              .copyWith(
                                  fontWeight: _selected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  color: _selected &&
                                          Theme.of(context).brightness ==
                                              Brightness.light
                                      ? Colors.white
                                      : _selected
                                          ? Colors.black
                                          : Theme.of(context)
                                              .chipTheme
                                              .labelStyle
                                              .color),
                        ),
                        selected: listIndex == _index,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        onSelected: (bool selected) {
                          setState(() {
                            _index = listIndex;
                          });
                        },
                      ),
                    );
                  }),
                ),
              )
            : SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(_chips.length, (listIndex) {
                    var _selected = listIndex == _index;
                    return Theme(
                      data: Theme.of(context)
                          .copyWith(canvasColor: Colors.transparent),
                      child: ChoiceChip(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        selectedColor:
                            Theme.of(context).chipTheme.selectedColor,
                        label: Text(
                          _chips[listIndex].label,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .chipTheme
                              .labelStyle
                              .copyWith(
                                  fontWeight: _selected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  color: _selected &&
                                          Theme.of(context).brightness ==
                                              Brightness.light
                                      ? Colors.white
                                      : _selected
                                          ? Colors.black
                                          : Theme.of(context)
                                              .chipTheme
                                              .labelStyle
                                              .color),
                        ),
                        selected: listIndex == _index,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        onSelected: (bool selected) {
                          setState(() {
                            _index = listIndex;
                          });
                        },
                      ),
                    );
                  }),
                ),
              ),
      )
    ]);
  }

  List<TimeValuePair> applyFilter(
      AssetHistorySplits historySplits, Duration? duration) {
    List<TimeValuePair> data;

    if (duration != null) {
      debugPrint(duration.toString());
      if (duration <= const Duration(hours: 24)) {
        data = historySplits.last24Hours.prices;
      } else if (duration <= const Duration(days: 90)) {
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
