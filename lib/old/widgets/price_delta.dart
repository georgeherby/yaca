import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crypto_app/old/utils/currency_formatters.dart';
import 'package:crypto_app/ui/consts/colours.dart';

class PriceDelta extends StatelessWidget {
  final double? priceChangeDelta;
  final double? textSize;

  const PriceDelta(this.priceChangeDelta, {Key? key, this.textSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (priceChangeDelta != null) {
      var color = priceChangeDelta!.toPositiveNegativeColor(opacity: 0.84);

      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            (priceChangeDelta!.deltaFormat()),
            style: Theme.of(context).textTheme.caption?.copyWith(
                color: color, fontSize: textSize ?? Theme.of(context).textTheme.caption!.fontSize),
          ),
          SizedBox(
            width: 2,
          ),
          Icon(
            priceChangeDelta! < 0
                ? CupertinoIcons.arrowtriangle_down_fill
                : CupertinoIcons.arrowtriangle_up_fill,
            color: color,
            size: textSize ?? 12,
          )
        ],
      );
    } else {
      return Container(child: Text('-'));
    }
  }
}
