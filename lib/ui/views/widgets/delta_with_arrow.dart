// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:crypto_app/ui/consts/colours.dart';
import 'package:crypto_app/ui/utils/currency_formatters.dart';
import 'package:crypto_app/ui/utils/percentage_formatters.dart';

class DeltaWithArrow extends StatelessWidget {
  final double? priceChangeDelta;
  final double? textSize;
  final bool isPercentage;

  const DeltaWithArrow(this.priceChangeDelta,
      {Key? key, this.textSize, this.isPercentage = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (priceChangeDelta != null) {
      var color = priceChangeDelta!.toPositiveNegativeColor();

      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            priceChangeDelta! < 0
                ? CupertinoIcons.arrowtriangle_down_fill
                : CupertinoIcons.arrowtriangle_up_fill,
            color: color,
            size: textSize ?? 12,
          ),
          const SizedBox(
            width: 1,
          ),
          Flexible(
            child: Text(
              isPercentage
                  ? percentageFormatWithoutNegative
                      .format(priceChangeDelta!.abs())
                  : priceChangeDelta!.deltaFormat(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption?.copyWith(
                  color: Theme.of(context).textTheme.bodyText1!.color,
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
