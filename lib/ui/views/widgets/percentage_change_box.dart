// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:yaca/ui/consts/colours.dart';
import 'package:yaca/ui/utils/percentage_formatters.dart';

class PercentageChangeBox extends StatelessWidget {
  final double? changePercent24Hr;
  final double? textSize;
  final EdgeInsets? padding;
  final bool showBackground;

  const PercentageChangeBox(this.changePercent24Hr,
      {Key? key, this.textSize, this.padding, this.showBackground = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (changePercent24Hr != null) {
      var darkColor = changePercent24Hr!.toPositiveNegativeColorDark();
      var bkgColor = changePercent24Hr!.toPositiveNegativeColorLight();
      return Container(
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            color: showBackground ? bkgColor : Colors.transparent),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              changePercent24Hr! < 0
                  ? CupertinoIcons.arrowtriangle_down_fill
                  : CupertinoIcons.arrowtriangle_up_fill,
              color: showBackground
                  ? darkColor
                  : changePercent24Hr!.toPositiveNegativeColor(),
              size: textSize ?? Theme.of(context).textTheme.bodyText1?.fontSize,
            ),
            const SizedBox(
              width: 1,
            ),
            Text(
              percentageFormat.format(changePercent24Hr! / 100),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: showBackground
                      ? darkColor
                      : changePercent24Hr!.toPositiveNegativeColor(),
                  fontSize: textSize ??
                      Theme.of(context).textTheme.caption!.fontSize),
            )
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
