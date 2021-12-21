// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:yaca/ui/consts/colours.dart';
import 'package:yaca/ui/utils/currency_formatters.dart';
import 'package:yaca/ui/utils/percentage_formatters.dart';

class DeltaWithArrow extends StatelessWidget {
  final double? priceChangeDelta;
  final double? textSize;
  final Color? textColor;
  final bool useTextColorForArrow;
  final bool isPercentage;

  const DeltaWithArrow(this.priceChangeDelta,
      {Key? key,
      this.textSize,
      this.textColor,
      this.isPercentage = false,
      this.useTextColorForArrow = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (priceChangeDelta != null) {
      var color = priceChangeDelta!.toPositiveNegativeColor(context);

      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            priceChangeDelta! < 0
                ? CupertinoIcons.arrowtriangle_down_fill
                : CupertinoIcons.arrowtriangle_up_fill,
            color: useTextColorForArrow ? textColor ?? color : color,
            size: textSize ?? 12,
          ),
          const SizedBox(
            width: 2,
          ),
          Flexible(
            child: Text(
              isPercentage
                  ? percentageFormatWithoutNegative
                      .format(priceChangeDelta!.abs() / 100)
                  : priceChangeDelta!.deltaFormat(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption?.copyWith(
                  color:
                      textColor ?? Theme.of(context).textTheme.bodyText1!.color,
                  fontSize: textSize ??
                      Theme.of(context).textTheme.caption!.fontSize),
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
