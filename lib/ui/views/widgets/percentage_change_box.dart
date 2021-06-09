// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:crypto_app/ui/consts/colours.dart';
import 'package:crypto_app/ui/utils/percentage_formatters.dart';

class PercentageChangeBox extends StatelessWidget {
  final double? changePercent24Hr;
  final double? textSize;
  final bool showBackground;

  PercentageChangeBox(this.changePercent24Hr,
      {Key? key, this.textSize, this.showBackground = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (changePercent24Hr != null) {
      var darkColor = changePercent24Hr!.toPositiveNegativeColorDark();
      var bkgColor = changePercent24Hr!.toPositiveNegativeColorLight();
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            color: showBackground ? bkgColor : Colors.transparent),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              percentageFormat.format(changePercent24Hr! / 100),
              style: TextStyle(
                  color: showBackground
                      ? darkColor
                      : changePercent24Hr!.toPositiveNegativeColor(),
                  fontSize: textSize ??
                      Theme.of(context).textTheme.caption!.fontSize),
            ),
            SizedBox(
              width: 2,
            ),
            Icon(
              changePercent24Hr! < 0
                  ? CupertinoIcons.arrowtriangle_down_fill
                  : CupertinoIcons.arrowtriangle_up_fill,
              color: showBackground
                  ? darkColor
                  : changePercent24Hr!.toPositiveNegativeColor(),
              size: textSize ?? 12,
            )
          ],
        ),
      );
    } else {
      return Container(child: Text('-'));
    }
  }
}