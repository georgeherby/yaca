import 'dart:math';

import 'package:crypto_app/old/models/asset_history.dart';
import 'package:crypto_app/old/utils/currency_formatters.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AssetGraph extends StatelessWidget {
  final List<HistoricalData> history;
  final double currencyRate;
  const AssetGraph({
    Key? key,
    required this.history,
    required this.currencyRate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _dashColour =
        (Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white)
            .withOpacity(0.6);

    double maxPrice = history.map((e) => e.priceUsd).reduce(max) / currencyRate;
    double minPrice = history.map((e) => e.priceUsd).reduce(min) / currencyRate;

    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: LineChart(
          LineChartData(
            gridData: FlGridData(
              show: false,
            ),
            borderData: FlBorderData(show: false),
            axisTitleData: FlAxisTitleData(show: false),
            titlesData: FlTitlesData(
              show: false,
              bottomTitles: SideTitles(showTitles: false),
              leftTitles: SideTitles(showTitles: false),
            ),
            minY: minPrice * 0.99,
            maxY: maxPrice * 1.01,
            lineTouchData: LineTouchData(
              handleBuiltInTouches: true,
              fullHeightTouchLine: true,
              touchTooltipData: LineTouchTooltipData(
                tooltipBgColor: Theme.of(context).scaffoldBackgroundColor,
                tooltipRoundedRadius: 4,
                tooltipPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                showOnTopOfTheChartBoxArea: false,
                fitInsideHorizontally: true,
                fitInsideVertically: true,
                getTooltipItems: (touchedSpots) {
                  return touchedSpots.map((barSpot) {
                    final flSpot = barSpot;
                    if (flSpot.x == 0 || flSpot.x == 6) {
                      return null;
                    }
                    HistoricalData _asset =
                        history.firstWhere((element) => element.time == flSpot.x.toInt());
                    DateTime _date = new DateTime.fromMillisecondsSinceEpoch(_asset.time);
                    double price = _asset.priceUsd / currencyRate;

                    var formatDate = DateFormat("dd MMM yy");
                    var formatTime = DateFormat("h:mma");
                    var dateString = formatDate.format(_date);
                    var timeString = formatTime.format(_date);

                    return LineTooltipItem(
                        '${price.coinCurrencyFormat()}\n$timeString\n$dateString',
                        Theme.of(context).textTheme.bodyText1
                        // const TextStyle(color: Theme.of(context).brightness == Brightness.Light ? Colors.black),
                        );
                  }).toList();
                },
              ),
            ),
            lineBarsData: [
              LineChartBarData(
                isCurved: false,
                colors: [
                  Theme.of(context).primaryColor,
                ],
                barWidth: 2,
                isStrokeCapRound: false,
                dotData: FlDotData(
                  show: false,
                ),
                belowBarData: BarAreaData(
                    show: true,
                    colors: [
                      Theme.of(context).scaffoldBackgroundColor,
                      Theme.of(context).primaryColor,
                    ].map((color) => color.withOpacity(0.3)).toList(),
                    gradientFrom: Offset(0, 1),
                    gradientTo: Offset(0, 0),
                    gradientColorStops: [0.6, 0.7, 1]),
                spots: List.generate(
                    history.length,
                    (index) => FlSpot(
                          history[index].time.toDouble(),
                          history[index].priceUsd / currencyRate,
                        )),
              ),
            ],
            extraLinesData: ExtraLinesData(horizontalLines: [
              HorizontalLine(
                  y: maxPrice,
                  color: _dashColour,
                  strokeWidth: 1.5,
                  dashArray: [5, 2],
                  label: HorizontalLineLabel(
                    show: true,
                    style: Theme.of(context).textTheme.bodyText1,
                    alignment: Alignment.topLeft,
                    labelResolver: (HorizontalLine line) {
                      return "max - ${maxPrice.coinCurrencyFormat()}";
                    },
                  )),
              HorizontalLine(
                  y: minPrice,
                  color: _dashColour,
                  strokeWidth: 1.5,
                  dashArray: [5, 2],
                  label: HorizontalLineLabel(
                    show: true,
                    style: Theme.of(context).textTheme.bodyText1,
                    alignment: Alignment.bottomLeft,
                    labelResolver: (HorizontalLine line) {
                      return "min - ${minPrice.coinCurrencyFormat()}";
                    },
                  )),
            ]),
          ),
          swapAnimationDuration: Duration(milliseconds: 500),
        ),
      ),
    );
  }
}
