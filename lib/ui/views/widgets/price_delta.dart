// 🐦 Flutter imports:
// 🌎 Project imports:
import 'package:crypto_app/ui/consts/colours.dart';
import 'package:crypto_app/ui/utils/currency_formatters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceDelta extends StatelessWidget {
  final double? priceChangeDelta;
  final double? textSize;

  const PriceDelta(this.priceChangeDelta, {Key? key, this.textSize})
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
          SizedBox(
            width: 1,
          ),
          Text(
            (priceChangeDelta!.deltaFormat()),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption?.copyWith(
                color: color,
                fontSize:
                    textSize ?? Theme.of(context).textTheme.caption!.fontSize),
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
