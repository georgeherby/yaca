import 'package:crypto_app/old/models/asset_history.dart';
import 'package:crypto_app/old/widgets/asset_graph.dart';
import 'package:flutter/material.dart';

class AssetGraphWithSwitcher extends StatefulWidget {
  final AssetHisotrySplits allHistory;

  const AssetGraphWithSwitcher({
    Key? key,
    required this.allHistory,
  }) : super(key: key);

  @override
  _AssetGraphWithSwitcherState createState() => _AssetGraphWithSwitcherState();
}

class _AssetGraphWithSwitcherState extends State<AssetGraphWithSwitcher> {
  int _index = 2;
  Duration? duration = Duration(hours: 1);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      AssetGraph(history: applyFilter(widget.allHistory, duration)),
      Divider(
        thickness: 10,
        color: Colors.transparent,
      ),
      Wrap(spacing: 8, children: [
        ChoiceChip(
          pressElevation: 0,
          selectedColor: Theme.of(context).primaryColor.withOpacity(0.1),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          shape: StadiumBorder(side: BorderSide(color: Theme.of(context).primaryColor)),
          label: Text('15m'),
          // labelStyle: TextStyle(),
          elevation: 0,
          selected: 0 == _index,
          onSelected: (bool selected) {
            setState(() {
              _index = 0;
              duration = Duration(minutes: 15);
            });
          },
        ),
        ChoiceChip(
          pressElevation: 0,
          selectedColor: Theme.of(context).primaryColor.withOpacity(0.1),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          shape: StadiumBorder(side: BorderSide(color: Theme.of(context).primaryColor)),
          label: Text('30m'),
          // labelStyle: TextStyle(),
          elevation: 0,
          selected: 1 == _index,
          onSelected: (bool selected) {
            setState(() {
              _index = 1;
              duration = Duration(minutes: 30);
            });
          },
        ),
        ChoiceChip(
          pressElevation: 0,
          selectedColor: Theme.of(context).primaryColor.withOpacity(0.1),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          shape: StadiumBorder(side: BorderSide(color: Theme.of(context).primaryColor)),
          label: Text('1h'),
          // labelStyle: TextStyle(),
          elevation: 0,
          selected: 2 == _index,
          onSelected: (bool selected) {
            setState(() {
              _index = 2;
              duration = Duration(hours: 1);
            });
          },
        ),
        Wrap(spacing: 8, children: [
          ChoiceChip(
              pressElevation: 0,
              selectedColor: Theme.of(context).primaryColor.withOpacity(0.1),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              shape: StadiumBorder(side: BorderSide(color: Theme.of(context).primaryColor)),
              label: Text('3h'),
              // labelStyle: TextStyle(),
              elevation: 0,
              selected: 3 == _index,
              onSelected: (bool selected) {
                setState(() {
                  _index = 3;
                  duration = Duration(hours: 3);
                });
              }),
          ChoiceChip(
            pressElevation: 0,
            selectedColor: Theme.of(context).primaryColor.withOpacity(0.1),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            shape: StadiumBorder(side: BorderSide(color: Theme.of(context).primaryColor)),
            label: Text('12h'),
            // labelStyle: TextStyle(),
            elevation: 0,
            selected: 4 == _index,
            onSelected: (bool selected) {
              setState(() {
                _index = 4;
                duration = Duration(hours: 12);
              });
            },
          ),
          ChoiceChip(
            pressElevation: 0,
            selectedColor: Theme.of(context).primaryColor.withOpacity(0.1),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            shape: StadiumBorder(side: BorderSide(color: Theme.of(context).primaryColor)),
            label: Text('24h'),
            // labelStyle: TextStyle(),
            elevation: 0,
            selected: 5 == _index,
            onSelected: (bool selected) {
              setState(() {
                _index = 5;
                duration = Duration(days: 1);
              });
            },
          ),
          ChoiceChip(
            pressElevation: 0,
            selectedColor: Theme.of(context).primaryColor.withOpacity(0.1),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            shape: StadiumBorder(side: BorderSide(color: Theme.of(context).primaryColor)),
            label: Text('48h'),
            // labelStyle: TextStyle(),
            elevation: 0,
            selected: 6 == _index,
            onSelected: (bool selected) {
              setState(() {
                _index = 6;
                duration = Duration(days: 2);
              });
            },
          ),
          ChoiceChip(
            pressElevation: 0,
            selectedColor: Theme.of(context).primaryColor.withOpacity(0.1),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            shape: StadiumBorder(side: BorderSide(color: Theme.of(context).primaryColor)),
            label: Text('3d'),
            // labelStyle: TextStyle(),
            elevation: 0,
            selected: 7 == _index,
            onSelected: (bool selected) {
              setState(() {
                _index = 7;
                duration = Duration(days: 3);
              });
            },
          ),
          ChoiceChip(
            pressElevation: 0,
            selectedColor: Theme.of(context).primaryColor.withOpacity(0.1),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            shape: StadiumBorder(side: BorderSide(color: Theme.of(context).primaryColor)),
            label: Text('1w'),
            // labelStyle: TextStyle(),
            elevation: 0,
            selected: 8 == _index,
            onSelected: (bool selected) {
              setState(() {
                _index = 8;
                duration = Duration(days: 7);
              });
            },
          ),
          // ChoiceChip(
          //   pressElevation: 0,
          //   selectedColor: Theme.of(context).primaryColor.withOpacity(0.1),
          //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          //   shape: StadiumBorder(side: BorderSide(color: Theme.of(context).primaryColor)),
          //   label: Text('All'),
          //   // labelStyle: TextStyle(),
          //   elevation: 0,
          //   selected: 9 == _index,
          //   onSelected: (bool selected) {
          //     setState(() {
          //       _index = 9;
          //       duration = null;
          //     });
          //   },
          // )
        ])
      ])
    ]);
  }

  List<HistoricalData> applyFilter(AssetHisotrySplits hisotrySplits, Duration? duration) {
    List<HistoricalData> data;

    if (duration != null) {
      if (duration <= Duration(hours: 24)) {
        data = hisotrySplits.last24Hours;
      } else {
        data = hisotrySplits.all;
      }

      return data
          .where(
              (element) => element.time > DateTime.now().subtract(duration).millisecondsSinceEpoch)
          .toList();
    } else {
      return hisotrySplits.all;
    }
  }
}
