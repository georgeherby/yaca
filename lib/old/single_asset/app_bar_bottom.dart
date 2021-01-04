import 'package:crypto_app/old/utils/currency_formatters.dart';
import 'package:crypto_app/old/widgets/percentage_change_box.dart';
import 'package:crypto_app/old/widgets/price_delta.dart';
import 'package:flutter/material.dart';

class AppBarBottom extends StatelessWidget with PreferredSizeWidget {
  final double? percentageChange24h;
  final double? priceChange24h;
  final double? marketCap;
  final int rank;
  final String symbol;
  final double circulatingSupply;
  final double? volume24;

  const AppBarBottom({
    Key? key,
    required this.percentageChange24h,
    required this.priceChange24h,
    required this.rank,
    required this.marketCap,
    required this.symbol,
    required this.circulatingSupply,
    required this.volume24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("#$rank"),
        percentageChange24h != null ? PercentageChangeBox(percentageChange24h!) : Container(),
        priceChange24h != null
            ? PriceDelta(
                priceChange24h!,
                textSize: 14,
              )
            : Container(),
        Text(readableCurrencyFormat.format(marketCap)),
        Text("$symbol ${readableCurrencyFormat.format(circulatingSupply)}"),
        volume24 != null ? Text(readableCurrencyFormat.format(volume24!)) : Container(),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
