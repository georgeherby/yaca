// 🎯 Dart imports:
import 'dart:math';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:coingecko_api/data/market_chart_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:responsive_builder/responsive_builder.dart';

// 🌎 Project imports:
import 'package:yaca/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:yaca/ui/consts/colours.dart';
import 'package:yaca/ui/utils/currency_formatters.dart';
import 'package:yaca/ui/views/widgets/delta_with_arrow.dart';

//  Package imports:

// � Package imports:
// � Flutter imports:

class AssetGraph extends StatefulWidget {
  final List<MarketChartData> history;
  final Duration? duration;
  const AssetGraph({
    Key? key,
    required this.history,
    required this.duration,
  }) : super(key: key);

  @override
  State<AssetGraph> createState() => _AssetGraphState();
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
      touchedPrice = widget.history.last.price!;
      touchedTime = widget.history.last.date.millisecondsSinceEpoch;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    touchedPrice = widget.history.last.price!;
    touchedTime = widget.history.last.date.millisecondsSinceEpoch;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var positive = widget.history.isNotEmpty &&
        widget.history.first.price! < widget.history.last.price!;

    var dashColour = (Theme.of(context).brightness == Brightness.light
        ? Colors.grey.shade700
        : Colors.white70);

    var maxPrice = widget.history.map((e) => e.price!).reduce(max);
    var minPrice = widget.history.map((e) => e.price!).reduce(min);

    var maxTime =
        widget.history.map((e) => e.date.millisecondsSinceEpoch).reduce(max);
    var minTime =
        widget.history.map((e) => e.date.millisecondsSinceEpoch).reduce(min);

    var dateTimeTouchedDate = DateTime.fromMillisecondsSinceEpoch(touchedTime);

    var price = touchedPrice;
    var currencyString =
        BlocProvider.of<AppSettingsBloc>(context).state.currency.currencyString;

    var formatDate = DateFormat('EEE, MMM dd, yyyy, HH:mm');
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
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
                        formatDate.format(dateTimeTouchedDate),
                        style: Theme.of(context).textTheme.caption?.copyWith(
                            fontWeight: FontWeight.normal, fontSize: 13),
                      ),
                      const SizedBox(height: 4),
                      SizedBox(
                        height: 20,
                        child: (price != widget.history.last.price!)
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  DeltaWithArrow(
                                      ((price - (widget.history.last.price!)) /
                                              price) *
                                          100,
                                      isPercentage: true),
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
                    price.currencyFormatWithPrefix(currencyString, context),
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
            padding: EdgeInsets
                .zero, //const EdgeInsets.only(top: 0.0, right: 0, left: 24),
            child: LineChart(
              LineChartData(
                backgroundColor: Colors.transparent,
                gridData: FlGridData(
                  show: false,
                  // drawVerticalLine: true,
                  // drawHorizontalLine: true,
                  // verticalInterval: (maxTime - minTime) / verticals,
                  // horizontalInterval: (maxPrice - minPrice) / horizonals,
                  // getDrawingHorizontalLine: (double value) {
                  //   return FlLine(
                  //     color: Colors.grey.withOpacity(0.1),
                  //     strokeWidth: 1,
                  //   );
                  // },
                  // getDrawingVerticalLine: (double value) {
                  //   return FlLine(
                  //     color: Colors.grey.withOpacity(0.1),
                  //     strokeWidth: 1,
                  //   );
                  // },
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                titlesData: FlTitlesData(
                  show: false,
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: ((maxTime - minTime) / verticals),
                      reservedSize: 22,
                      getTitlesWidget: (double value, titleMeta) {
                        DateFormat formatter;
                        if (widget.duration != null &&
                            DateTime.now().year ==
                                DateTime.fromMillisecondsSinceEpoch(
                                        value.toInt())
                                    .year) {
                          formatter = DateFormat('HH:mm\nd MMM');
                        } else {
                          formatter = DateFormat('HH:mm\nd MMM yyyy');
                        }

                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                              formatter.format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                      value.toInt())),
                              style: Theme.of(context).textTheme.caption!),
                        );
                      },
                    ),
                  ),
                  leftTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: (maxPrice - minPrice) / horizonals,
                      getTitlesWidget: (value, titleMeta) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            value.currencyFormatWithPrefix(
                                currencyString, context),
                            style: Theme.of(context).textTheme.caption!,
                          ),
                        );
                      },
                      reservedSize: 56,
                    ),
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
                          color: dashColour,
                          strokeWidth: 1,
                          dashArray: [6, 2],
                        ),
                        FlDotData(
                          show: true,
                          getDotPainter: (spot, percent, barData, index) =>
                              FlDotCirclePainter(
                                  radius: 6,
                                  color: positive
                                      .toPositiveNegativeColorFromBool(context),
                                  strokeWidth: 0),
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
                            .date
                            .millisecondsSinceEpoch;
                        touchedPrice = widget
                            .history[lineTouch.lineBarSpots!.first.spotIndex]
                            .price!;
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
                extraLinesData: ExtraLinesData(horizontalLines: [
                  HorizontalLine(
                    label: HorizontalLineLabel(
                      show: true,
                      alignment: Alignment.bottomLeft,
                      labelResolver: (HorizontalLine value) {
                        return value.y.currencyFormatWithPrefix("£", context);
                      },
                    ),
                    y: widget.history.first.price!,
                    color: dashColour,
                    strokeWidth: 1,
                    dashArray: [4, 4],
                  ),
                ]),
                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    color: positive.toPositiveNegativeColorFromBool(context),
                    barWidth: 2,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) =>
                          FlDotCirclePainter(
                              radius: 6,
                              color: positive
                                  .toPositiveNegativeColorFromBool(context),
                              strokeWidth: 0),
                      checkToShowDot: (FlSpot spot, LineChartBarData barData) =>
                          spot.y == maxPrice || spot.y == minPrice,
                    ),
                    belowBarData: BarAreaData(
                        show: false,
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            (positive.toPositiveNegativeColorFromBool(context))
                                .withOpacity(0.3)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [0, 0.7],
                        )),
                    spots: List.generate(
                        widget.history.length,
                        (index) => FlSpot(
                              widget.history[index].date.millisecondsSinceEpoch
                                  .toDouble(),
                              widget.history[index].price!,
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
