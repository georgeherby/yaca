import 'package:crypto_app/old/utils/percentage_formatters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PercentageChangeBox extends StatelessWidget {
  final double changePercent24Hr;

  PercentageChangeBox(this.changePercent24Hr);

  @override
  Widget build(BuildContext context) {
    Color color = changePercent24Hr < 0 ? Colors.red : Color(0xFF18C683);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)), color: color.withOpacity(0.2)),
          child: Text(
            percetnageFormat.format(changePercent24Hr / 100),
            style: TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        Icon(
          changePercent24Hr < 0 ? CupertinoIcons.arrow_down : CupertinoIcons.arrow_up,
          color: color,
        )
      ],
    );
  }
}
