// 🎯 Dart imports:
import 'dart:math';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:fl_chart/fl_chart.dart';

// 🌎 Project imports:
import 'package:crypto_app/ui/consts/colours.dart';

class SimpleSparkLine extends StatelessWidget {
  final List<double> data;
  final double width;
  const SimpleSparkLine({Key? key, required this.data, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (data.isNotEmpty) {
      var maxPrice = data.reduce(max);
      var minPrice = data.reduce(min);
      var lastPrice = data.last;
      var firstPrice = data.first;
      var graphColor = lastPrice > firstPrice ? kPositiveGreen : kNegativeRed;

      return SizedBox(
        height: 120,
        width: width,
        child: LineChart(
          LineChartData(
            backgroundColor: Colors.transparent,
            gridData: FlGridData(
              show: false,
            ),
            borderData: FlBorderData(show: false),
            axisTitleData: FlAxisTitleData(
              show: true,
            ),
            titlesData: FlTitlesData(
                show: true,
                bottomTitles: SideTitles(showTitles: false),
                leftTitles: SideTitles(
                  showTitles: false,
                )),
            minY: minPrice,
            maxY: maxPrice,
            lineTouchData: LineTouchData(
              handleBuiltInTouches: false,
            ),
            lineBarsData: [
              LineChartBarData(
                isCurved: true,
                curveSmoothness: 0.5,
                preventCurveOverShooting: true,
                colors: [
                  graphColor,
                ],
                barWidth: 2,
                isStrokeCapRound: false,
                dotData: FlDotData(
                  show: false,
                ),
                belowBarData: BarAreaData(
                  show: true,
                  colors: [
                    Colors.transparent,
                    // graphColor.withOpacity(0.3),
                  ],
                  gradientFrom: Offset(0, 1),
                  gradientTo: Offset(0, 0),
                  gradientColorStops: [0, 1],
                ),
                spots: List.generate(
                    data.length,
                    (index) => FlSpot(
                          index + 1,
                          data[index],
                        )),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
