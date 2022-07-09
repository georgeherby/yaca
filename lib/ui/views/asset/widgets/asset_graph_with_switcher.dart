// 🐦 Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:coingecko_api/data/market_chart_data.dart';

// 🌎 Project imports:
import 'package:yaca/core/extensions/platform.dart';
import 'package:yaca/core/models/api/asset_history_splits.dart';
import 'package:yaca/ui/consts/constants.dart';
import 'package:yaca/ui/views/asset/widgets/asset_graph.dart';

class _AssetGraphChipConfigurations {
  const _AssetGraphChipConfigurations(this.label, this.duration);
  final String label;
  final Duration? duration;
}

class AssetGraphWithSwitcher extends StatefulWidget {
  const AssetGraphWithSwitcher({
    super.key,
    required this.allHistory,
  });
  final AssetHistorySplits allHistory;

  @override
  State<AssetGraphWithSwitcher> createState() => _AssetGraphWithSwitcherState();
}

class _AssetGraphWithSwitcherState extends State<AssetGraphWithSwitcher> {
  int _index = 2;

  final List<_AssetGraphChipConfigurations> kChips = const [
    _AssetGraphChipConfigurations('3h', Duration(hours: 3)),
    _AssetGraphChipConfigurations('12H', Duration(hours: 12)),
    _AssetGraphChipConfigurations('1D', Duration(days: 1)),
    _AssetGraphChipConfigurations('3D', Duration(days: 3)),
    _AssetGraphChipConfigurations('1W', Duration(days: 7)),
    _AssetGraphChipConfigurations('1M', Duration(days: 30)),
    _AssetGraphChipConfigurations('3M', Duration(days: 90)),
    _AssetGraphChipConfigurations('6M', Duration(days: 180)),
    _AssetGraphChipConfigurations('1Y', Duration(days: 365)),
    _AssetGraphChipConfigurations('3Y', Duration(days: 365 * 3)),
    _AssetGraphChipConfigurations('All', null),
  ];

  @override
  Widget build(BuildContext context) {
    //Get chips where there data. For example data may only go back 1 year, so dont show 3y chips
    final chips = kChips
        .where((element) => element.duration == null
            ? true
            : widget.allHistory.allMonths.first.date.millisecondsSinceEpoch <
                DateTime.now()
                    .subtract(element.duration!)
                    .millisecondsSinceEpoch)
        .toList();

    final duration =
        chips.length < _index ? chips[0].duration : chips[_index].duration;
    final data = applyFilter(widget.allHistory, duration);

    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      if (data.isNotEmpty)
        AssetGraph(
          history: data,
          duration: duration,
        )
      else
        const SizedBox(
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
                  children: List.generate(chips.length, (listIndex) {
                    final selected = listIndex == _index;
                    return FilterChip(
                      showCheckmark: false,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(kCornerRadiusCirlcular),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      label: Text(
                        chips[listIndex].label,
                        textAlign: TextAlign.center,
                      ),
                      selected: selected,
                      onSelected: (bool selected) {
                        setState(() {
                          _index = listIndex;
                        });
                      },
                    );
                  }),
                ),
              )
            : SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(chips.length, (listIndex) {
                    final selected = listIndex == _index;
                    return FilterChip(
                      showCheckmark: false,
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(kCornerRadiusCirlcular),
                      ),
                      label: Text(
                        chips[listIndex].label,
                        textAlign: TextAlign.center,
                      ),
                      selected: selected,
                      onSelected: (bool selected) {
                        setState(() {
                          _index = listIndex;
                        });
                      },
                    );
                  }),
                ),
              ),
      )
    ]);
  }

  List<MarketChartData> applyFilter(
      AssetHistorySplits historySplits, Duration? duration) {
    List<MarketChartData> data;

    if (duration != null) {
      debugPrint(duration.toString());
      if (duration <= const Duration(hours: 24)) {
        data = historySplits.last24Hours;
      } else if (duration <= const Duration(days: 90)) {
        data = historySplits.last3Month;
      } else {
        data = historySplits.allMonths;
      }

      return data
          .where((element) =>
              element.date.millisecondsSinceEpoch >
              DateTime.now().subtract(duration).millisecondsSinceEpoch)
          .toList();
    } else {
      return historySplits.allMonths;
    }
  }
}
