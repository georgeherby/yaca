// 🎯 Dart imports:
import 'dart:math';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:fl_chart/fl_chart.dart';

// 🌎 Project imports:
import 'package:yaca/ui/consts/colours.dart';

// � Package imports:
// � Flutter imports:

// � Package imports:
// � Flutter imports:

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
      var graphColor =
          (lastPrice > firstPrice).toPositiveNegativeColorFromBool(context);

      return LineChart(
        LineChartData(
          backgroundColor: Colors.transparent,
          gridData: FlGridData(
            show: false,
          ),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(show: false),
          minY: minPrice,
          maxY: maxPrice,
          lineTouchData: LineTouchData(
            handleBuiltInTouches: false,
          ),
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              isStrokeCapRound: true,
              color: graphColor,
              barWidth: 2,
              dotData: FlDotData(
                show: false,
              ),
              belowBarData: BarAreaData(
                show: false,
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
      );
    } else {
      return Container();
    }
  }
}
