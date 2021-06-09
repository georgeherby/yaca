// 🎯 Dart imports:
import 'dart:math';

// 🐦 Flutter imports:
import 'package:crypto_app/core/models/api/coingecko/asset_history.dart';
import 'package:crypto_app/ui/views/widgets/percentage_change_box.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

// 🌎 Project imports:
import 'package:crypto_app/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:crypto_app/ui/utils/currency_formatters.dart';

class AssetGraph extends StatefulWidget {
  final List<TimeValuePair> history;
  final Duration? duration;
  const AssetGraph({
    Key? key,
    required this.history,
    required this.duration,
  }) : super(key: key);

  @override
  _AssetGraphState createState() => _AssetGraphState(history: history);
}

class _AssetGraphState extends State<AssetGraph> {
  final List<TimeValuePair> history;

  late double touchedPrice;
  late int touchedTime;

  _AssetGraphState({
    required this.history,
  }) {
    touchedPrice = history.last.value;
    touchedTime = history.last.timeEpochUtc;
  }

  @override
  Widget build(BuildContext context) {
    var _dashColour = (Theme.of(context).brightness == Brightness.light
        ? Colors.grey.shade700
        : Colors.white70);

    var maxPrice = widget.history.map((e) => e.value).reduce(max);
    var minPrice = widget.history.map((e) => e.value).reduce(min);

    var maxTime = widget.history.map((e) => e.timeEpochUtc).reduce(max);
    var minTime = widget.history.map((e) => e.timeEpochUtc).reduce(min);

    var _dateTimeTouchedDate = DateTime.fromMillisecondsSinceEpoch(touchedTime);

    var price = touchedPrice;
    var currencySymbol =
        BlocProvider.of<AppSettingsBloc>(context).state.currency.currencySymbol;

    var formatDate = DateFormat('EEE, MMM dd, yyyy, HH:mm');
    // DateFormat formatTime = DateFormat("HH:mm");
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(bottom: 16.0, left: 8, right: 8, top: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(formatTime.format(_dateTimeTouchedDate)),

                  Text(
                    formatDate.format(_dateTimeTouchedDate),
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        ?.copyWith(fontWeight: FontWeight.normal, fontSize: 13),
                  ),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text(
                    price.currencyFormatWithPrefix(currencySymbol, context),
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  VerticalDivider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'high: ${maxPrice.currencyFormatWithPrefix(currencySymbol, context)}',
                          style: Theme.of(context).textTheme.caption),
                      Text(
                          'low: ${minPrice..currencyFormatWithPrefix(currencySymbol, context)}',
                          style: Theme.of(context).textTheme.caption),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  PercentageChangeBox(
                      ((price - (history.last.value)) / price) * 100,
                      textSize: 14),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    'on current price',
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 250,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 0.0, right: 24),
            child: LineChart(
              LineChartData(
                backgroundColor: Colors.transparent,
                gridData: FlGridData(
                    show: true,
                    drawVerticalLine: true,
                    drawHorizontalLine: true,
                    verticalInterval: (maxTime - minTime) / 4,
                    horizontalInterval: (maxPrice - minPrice) / 6,
                    getDrawingHorizontalLine: (double value) {
                      return FlLine(
                        color: Colors.grey.withOpacity(0.15),
                        strokeWidth: 1,
                      );
                    },
                    getDrawingVerticalLine: (double value) {
                      return FlLine(
                        color: Colors.grey.withOpacity(0.25),
                        strokeWidth: 1,
                      );
                    }),
                borderData: FlBorderData(
                    show: false,
                    border: Border(
                        bottom: BorderSide(
                      color: Colors.grey.withOpacity(0.3),
                      width: 1,
                    ))),
                axisTitleData: FlAxisTitleData(
                  show: true,
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: SideTitles(
                    showTitles: true,
                    interval: ((maxTime - minTime) / 4),
                    margin: 12,
                    reservedSize: 22,
                    getTextStyles: (value) =>
                        Theme.of(context).textTheme.caption!,
                    getTitles: (double value) {
                      DateFormat formatter;
                      if (widget.duration != null &&
                          DateTime.now().year ==
                              DateTime.fromMillisecondsSinceEpoch(value.toInt())
                                  .year) {
                        formatter = DateFormat('HH:mm\nd MMM');
                      } else {
                        formatter = DateFormat('HH:mm\nd MMM yyyy');
                      }

                      return '${formatter.format(DateTime.fromMillisecondsSinceEpoch(value.toInt()))}';
                    },
                  ),
                  leftTitles: SideTitles(
                    showTitles: true,
                    interval: (maxPrice - minPrice) / 6,
                    getTextStyles: (value) =>
                        Theme.of(context).textTheme.caption!,
                    getTitles: (value) {
                      return '${value.currencyFormatWithPrefix(currencySymbol, context)}';
                    },
                    reservedSize: 72,
                    margin: 8,
                  ),
                ),
                minY: minPrice,
                maxY: maxPrice,
                lineTouchData: LineTouchData(
                  handleBuiltInTouches: true,
                  getTouchLineStart: (barData, index) =>
                      -double.infinity, // default: from bottom,
                  getTouchLineEnd: (barData, index) => double.infinity, //to top
                  getTouchedSpotIndicator:
                      (LineChartBarData barData, List<int> spotIndexes) {
                    return spotIndexes.map((spotIndex) {
                      return TouchedSpotIndicatorData(
                        FlLine(
                          color: _dashColour,
                          strokeWidth: 1.5,
                          dashArray: [6, 2],
                        ),
                        FlDotData(
                          show: false,
                        ),
                      );
                    }).toList();
                  },
                  touchCallback: (LineTouchResponse response) {
                    if (response.lineBarSpots != null &&
                        response.lineBarSpots!.isNotEmpty) {
                      setState(() {
                        touchedTime = widget
                            .history[response.lineBarSpots!.first.spotIndex]
                            .timeEpochUtc;
                        touchedPrice = widget
                            .history[response.lineBarSpots!.first.spotIndex]
                            .value;
                      });
                    }
                  },
                  touchTooltipData:
                      LineTouchTooltipData(getTooltipItems: (touchedSpots) {
                    return touchedSpots.map((touchedSpot) {
                      return null;
                    }).toList();
                  }),
                ),
                lineBarsData: [
                  LineChartBarData(
                    isCurved: false,
                    // curveSmoothness: 0.25,
                    colors: [
                      Theme.of(context).primaryColor,
                    ],
                    barWidth: 2.5,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: false,
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      colors: [
                        Colors.transparent,
                        Theme.of(context).primaryColor.withOpacity(0.3)
                      ],
                      gradientFrom: Offset(0, 1),
                      gradientTo: Offset(0, 0),
                      gradientColorStops: [0, 0.7],
                    ),
                    spots: List.generate(
                        widget.history.length,
                        (index) => FlSpot(
                              widget.history[index].timeEpochUtc.toDouble(),
                              widget.history[index].value,
                            )),
                  ),
                ],
              ),
              swapAnimationDuration: Duration(milliseconds: 500),
            ),
          ),
        ),
      ],
    );
  }
}
