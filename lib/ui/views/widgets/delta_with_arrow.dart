// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:

// 🌎 Project imports:
import 'package:yaca/ui/constants/colours.dart';
import 'package:yaca/ui/utils/currency_formatters.dart';
import 'package:yaca/ui/utils/percentage_formatters.dart';

class DeltaWithArrow extends StatelessWidget {
  const DeltaWithArrow(this.priceChangeDelta,
      {super.key,
      this.textSize,
      this.textColor,
      this.isPercentage = false,
      this.useTextColorForArrow = false});
  final double? priceChangeDelta;
  final double? textSize;
  final Color? textColor;
  final bool useTextColorForArrow;
  final bool isPercentage;

  @override
  Widget build(BuildContext context) {
    if (priceChangeDelta != null) {
      final color = priceChangeDelta!.toPositiveNegativeColor(context);

      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            priceChangeDelta! < 0
                ? Icons.arrow_downward_rounded
                : Icons.arrow_upward_rounded,
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
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: textColor ??
                      Theme.of(context).textTheme.bodyMedium!.color,
                  fontSize: textSize ??
                      Theme.of(context).textTheme.bodyMedium!.fontSize),
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
