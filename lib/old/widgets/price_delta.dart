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
      Color color = priceChangeDelta!.toPositiveNegativeColor(opacity: 0.84);

      return Text((priceChangeDelta!.deltaFormat()),
          style: Theme.of(context).textTheme.caption?.copyWith(
              color: color, fontSize: textSize ?? Theme.of(context).textTheme.caption!.fontSize));
    } else {
      return Container(child: Text("-"));
    }
  }
}
