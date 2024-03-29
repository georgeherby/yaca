// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:ionicons/ionicons.dart';

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
                ? Ionicons.arrow_down_outline
                : Ionicons.arrow_up_outline,
            color: useTextColorForArrow ? textColor ?? color : color,
            size: textSize ?? 18,
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
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color:
                      textColor ?? Theme.of(context).textTheme.bodyText1!.color,
                  fontSize: textSize ??
                      Theme.of(context).textTheme.bodyText1!.fontSize),
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
