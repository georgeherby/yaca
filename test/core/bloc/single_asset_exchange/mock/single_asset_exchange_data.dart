// 🎯 Dart imports:
import 'dart:convert';

// 📦 Package imports:
import 'package:coingecko_api/data/ticker.dart';

var singleBinanceBtcTicker = Ticker.fromJson(jsonDecode('''
        {
         "base":"BNB",
         "target":"USDT",
         "market":{
            "name":"Binance",
            "identifier":"binance",
            "has_trading_incentive":false,
            "logo":"https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250"
         },
         "last":529.5,
         "volume":413616.6130190746,
         "converted_last":{
            "btc":0.01126811,
            "eth":0.13906711,
            "usd":530.17
         },
         "converted_volume":{
            "btc":4661,
            "eth":57520,
            "usd":219287627
         },
         "trust_score":"green",
         "bid_ask_spread_percentage":0.018975,
         "timestamp":"2022-01-02T21:02:22+00:00",
         "last_traded_at":"2022-01-02T21:02:22+00:00",
         "last_fetch_at":"2022-01-02T21:02:22+00:00",
         "is_anomaly":false,
         "is_stale":false,
         "trade_url":"https://www.binance.com/en/trade/BNB_USDT?ref=37754157",
         "token_info_url":null,
         "coin_id":"binancecoin",
         "target_coin_id":"tether"
      }
  '''));
