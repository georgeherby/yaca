import 'package:crypto_app/old/utils/percentage_formatters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PercentageChangeBox extends StatelessWidget {
  final double changePercent24Hr;

  PercentageChangeBox(this.changePercent24Hr);

  @override
  Widget build(BuildContext context) {
    Color color = changePercent24Hr < 0 ? Colors.red : Color(0xFF18C683);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)), color: color.withOpacity(0.2)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            percetnageFormat.format(changePercent24Hr / 100),
            style: TextStyle(color: color),
          ),
          SizedBox(
            width: 2,
          ),
          Icon(
            changePercent24Hr < 0
                ? CupertinoIcons.arrowtriangle_down_fill
                : CupertinoIcons.arrowtriangle_up_fill,
            color: color,
            size: 12,
          )
        ],
      ),
    );
  }
}
