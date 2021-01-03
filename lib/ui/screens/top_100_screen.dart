import 'package:crypto_app/old/market/market_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:crypto_app/old/api/coinmarketcap/market_overview_api.dart';
import 'package:crypto_app/old/models/market_overview.dart';

class Top100Screen extends StatelessWidget {
  const Top100Screen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MarketView();
  }
}
