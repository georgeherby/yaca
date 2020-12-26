import 'package:crypto_app/old/utils/percentage_formatters.dart';
import 'package:flutter/material.dart';

class PercentageChangeBox extends StatelessWidget {
  final double changePercent24Hr;

  PercentageChangeBox(this.changePercent24Hr);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            color: (changePercent24Hr < 0 ? Colors.red : Color(0xFF18C683)).withOpacity(0.2)),
        child: Text(
          percetnageFormat.format(changePercent24Hr / 100),
          style: TextStyle(
              color: changePercent24Hr < 0 ? Colors.red : Color(0xFF18C683),
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ));
  }
}
