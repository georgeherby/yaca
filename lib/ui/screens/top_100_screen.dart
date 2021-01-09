import 'package:crypto_app/old/market/market_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PricesScreen extends StatelessWidget {
  const PricesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MarketView();
  }
}
