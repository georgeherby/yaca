// 🎯 Dart imports:
import 'dart:math';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:responsive_builder/responsive_builder.dart';

// 🌎 Project imports:
import 'package:crypto_app/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:crypto_app/core/models/api/coingecko/asset_history.dart';
import 'package:crypto_app/ui/consts/colours.dart';
import 'package:crypto_app/ui/utils/currency_formatters.dart';
import 'package:crypto_app/ui/views/widgets/percentage_change_box.dart';

class AssetGraph extends StatefulWidget {
  final List<TimeValuePair> history;
  final Duration? duration;
  const AssetGraph({
    Key? key,
    required this.history,
    required this.duration,
  }) : super(key: key);

  @override
  _AssetGraphState createState() => _AssetGraphState();
}

class _AssetGraphState extends State<AssetGraph> {
  late double touchedPrice;
  late int touchedTime;

  final int verticals = 3;
  final int horizonals = 4;

  @override
  void didUpdateWidget(covariant AssetGraph oldWidget) {
    if (oldWidget.duration != widget.duration) {
      debugPrint('Duration changed reset touched values');
      touchedPrice = widget.history.last.value;
      touchedTime = widget.history.last.timeEpochUtc;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    touchedPrice = widget.history.last.value;
    touchedTime = widget.history.last.timeEpochUtc;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var positive = widget.history.isNotEmpty &&
        widget.history.first.value < widget.history.last.value;

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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(bottom: 8.0, left: 8, right: 8, top: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        formatDate.format(_dateTimeTouchedDate),
                        style: Theme.of(context).textTheme.caption?.copyWith(
                            fontWeight: FontWeight.normal, fontSize: 13),
                      ),
                      const SizedBox(height: 4),
                      SizedBox(
                        height: 20,
                        child: (price != widget.history.last.value)
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  PercentageChangeBox(
                                      ((price - (widget.history.last.value)) / price) *
                                          100),
                                  const SizedBox(width: 4),
                                  Text(
                                    'on current price',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  )
                                ],
                              )
                            : Container(),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    price.currencyFormatWithPrefix(currencySymbol, context),
                    style: getValueForScreenType<TextStyle?>(
                      context: context,
                      mobile: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(fontWeight: FontWeight.w600),
                      tablet: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(fontWeight: FontWeight.w600),
                      desktop: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: getValueForScreenType<double>(
            context: context,
            mobile: 225,
            tablet: 250,
            desktop: 250,
          ),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 0.0, right: 0, left: 24),
            child: LineChart(
              LineChartData(
                backgroundColor: Colors.transparent,
                gridData: FlGridData(
                    show: true,
                    drawVerticalLine: true,
                    drawHorizontalLine: true,
                    verticalInterval: (maxTime - minTime) / verticals,
                    horizontalInterval: (maxPrice - minPrice) / horizonals,
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
                  topTitles: SideTitles(showTitles: false),
                  bottomTitles: SideTitles(
                    showTitles: true,
                    interval: ((maxTime - minTime) / verticals),
                    margin: 12,
                    reservedSize: 22,
                    getTextStyles: (context, value) =>
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

                      return formatter.format(
                          DateTime.fromMillisecondsSinceEpoch(value.toInt()));
                    },
                  ),
                  leftTitles: SideTitles(showTitles: false),
                  rightTitles: SideTitles(
                    showTitles: true,
                    interval: (maxPrice - minPrice) / horizonals,
                    getTextStyles: (context, value) =>
                        Theme.of(context).textTheme.caption!,
                    getTitles: (value) {
                      return value.currencyFormatWithPrefix(
                          currencySymbol, context);
                    },
                    reservedSize: 56,
                    margin: 8,
                  ),
                ),
                minY: minPrice,
                maxY: maxPrice * 1.005,
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
                  touchCallback:
                      (FlTouchEvent event, LineTouchResponse? lineTouch) {
                    if (!event.isInterestedForInteractions ||
                        lineTouch == null ||
                        lineTouch.lineBarSpots == null) {
                      return;
                    }

                    if (lineTouch.lineBarSpots != null &&
                        lineTouch.lineBarSpots!.isNotEmpty) {
                      setState(() {
                        touchedTime = widget
                            .history[lineTouch.lineBarSpots!.first.spotIndex]
                            .timeEpochUtc;
                        touchedPrice = widget
                            .history[lineTouch.lineBarSpots!.first.spotIndex]
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
                    colors: [positive ? kPositiveGreen : kNegativeRed],
                    barWidth: 2.5,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: false,
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      colors: [
                        Colors.transparent,
                        (positive ? kPositiveGreen : kNegativeRed)
                            .withOpacity(0.3)
                      ],
                      gradientFrom: const Offset(0, 1),
                      gradientTo: const Offset(0, 0),
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
              swapAnimationDuration: const Duration(milliseconds: 500),
            ),
          ),
        ),
      ],
    );
  }
}
