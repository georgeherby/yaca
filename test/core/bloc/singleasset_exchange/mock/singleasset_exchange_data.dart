// 🎯 Dart imports:
import 'dart:convert';

// 🌎 Project imports:
import 'package:crypto_app/core/models/api/coingecko/exchange_ticker.dart';

var binanceBtcTicker = ExchangeTicker.fromJson(jsonDecode('''
  {
  "name": "Binance",
  "tickers": [
    {
      "base": "BTC",
      "target": "USDT",
      "market": {
        "name": "Binance",
        "identifier": "binance",
        "has_trading_incentive": false,
        "logo": "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250"
      },
      "last": 34236.23,
      "volume": 48760.29990427486,
      "cost_to_move_up_usd": 12737082.0045867,
      "cost_to_move_down_usd": 17692902.8740597,
      "converted_last": {
        "btc": 1.006063,
        "eth": 16.124592,
        "usd": 34332
      },
      "converted_volume": {
        "btc": 49056,
        "eth": 786240,
        "usd": 1674036281
      },
      "trust_score": "green",
      "bid_ask_spread_percentage": 0.010029,
      "timestamp": "2021-07-25T15:47:03+00:00",
      "last_traded_at": "2021-07-25T15:47:03+00:00",
      "last_fetch_at": "2021-07-25T15:47:03+00:00",
      "is_anomaly": false,
      "is_stale": false,
      "trade_url": "https://www.binance.com/en/trade/BTC_USDT?ref=37754157",
      "token_info_url": null,
      "coin_id": "bitcoin",
      "target_coin_id": "tether"
    },
    {
      "base": "BTC",
      "target": "BUSD",
      "market": {
        "name": "Binance",
        "identifier": "binance",
        "has_trading_incentive": false,
        "logo": "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250"
      },
      "last": 34192.63,
      "volume": 12079.798200714606,
      "cost_to_move_up_usd": 6679284.87727341,
      "cost_to_move_down_usd": 8749408.42337897,
      "converted_last": {
        "btc": 1.000818,
        "eth": 16.056559,
        "usd": 34124
      },
      "converted_volume": {
        "btc": 12090,
        "eth": 193960,
        "usd": 412210252
      },
      "trust_score": "green",
      "bid_ask_spread_percentage": 0.010029,
      "timestamp": "2021-07-25T15:44:51+00:00",
      "last_traded_at": "2021-07-25T15:44:51+00:00",
      "last_fetch_at": "2021-07-25T15:44:51+00:00",
      "is_anomaly": false,
      "is_stale": false,
      "trade_url": "https://www.binance.com/en/trade/BTC_BUSD?ref=37754157",
      "token_info_url": null,
      "coin_id": "bitcoin",
      "target_coin_id": "binance-usd"
    },
    {
      "base": "BTC",
      "target": "USDC",
      "market": {
        "name": "Binance",
        "identifier": "binance",
        "has_trading_incentive": false,
        "logo": "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250"
      },
      "last": 34150.66,
      "volume": 2122.7913125131995,
      "cost_to_move_up_usd": 2240407.77348226,
      "cost_to_move_down_usd": 1646790.07446623,
      "converted_last": {
        "btc": 1.003895,
        "eth": 16.113671,
        "usd": 34213
      },
      "converted_volume": {
        "btc": 2131,
        "eth": 34206,
        "usd": 72626262
      },
      "trust_score": "green",
      "bid_ask_spread_percentage": 0.02796,
      "timestamp": "2021-07-25T15:36:51+00:00",
      "last_traded_at": "2021-07-25T15:36:51+00:00",
      "last_fetch_at": "2021-07-25T15:36:51+00:00",
      "is_anomaly": false,
      "is_stale": false,
      "trade_url": "https://www.binance.com/en/trade/BTC_USDC?ref=37754157",
      "token_info_url": null,
      "coin_id": "bitcoin",
      "target_coin_id": "usd-coin"
    },
    {
      "base": "BTC",
      "target": "EUR",
      "market": {
        "name": "Binance",
        "identifier": "binance",
        "has_trading_incentive": false,
        "logo": "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250"
      },
      "last": 29345.07,
      "volume": 1900.2483510922284,
      "cost_to_move_up_usd": 1825290.2353520177,
      "cost_to_move_down_usd": 1728044.1995049436,
      "converted_last": {
        "btc": 1.008228,
        "eth": 16.128657,
        "usd": 34543
      },
      "converted_volume": {
        "btc": 1916,
        "eth": 30648,
        "usd": 65640195
      },
      "trust_score": "green",
      "bid_ask_spread_percentage": 0.0134,
      "timestamp": "2021-07-25T15:53:24+00:00",
      "last_traded_at": "2021-07-25T15:53:24+00:00",
      "last_fetch_at": "2021-07-25T15:53:24+00:00",
      "is_anomaly": false,
      "is_stale": false,
      "trade_url": "https://www.binance.com/en/trade/BTC_EUR?ref=37754157",
      "token_info_url": null,
      "coin_id": "bitcoin"
    },
    {
      "base": "BTC",
      "target": "TRY",
      "market": {
        "name": "Binance",
        "identifier": "binance",
        "has_trading_incentive": false,
        "logo": "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250"
      },
      "last": 292000,
      "volume": 247.43144548333905,
      "cost_to_move_up_usd": 1045956.6626743342,
      "cost_to_move_down_usd": 580777.8428843772,
      "converted_last": {
        "btc": 0.99620674,
        "eth": 15.949817,
        "usd": 34130
      },
      "converted_volume": {
        "btc": 246.493,
        "eth": 3946,
        "usd": 8444957
      },
      "trust_score": "green",
      "bid_ask_spread_percentage": 0.038697,
      "timestamp": "2021-07-25T15:52:36+00:00",
      "last_traded_at": "2021-07-25T15:52:36+00:00",
      "last_fetch_at": "2021-07-25T15:52:36+00:00",
      "is_anomaly": false,
      "is_stale": false,
      "trade_url": "https://www.binance.com/en/trade/BTC_TRY?ref=37754157",
      "token_info_url": null,
      "coin_id": "bitcoin"
    },
    {
      "base": "BTC",
      "target": "GBP",
      "market": {
        "name": "Binance",
        "identifier": "binance",
        "has_trading_incentive": false,
        "logo": "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250"
      },
      "last": 24834.42,
      "volume": 234.53736885022158,
      "cost_to_move_up_usd": 631645.2675628152,
      "cost_to_move_down_usd": 537891.0922582037,
      "converted_last": {
        "btc": 1.001395,
        "eth": 16.065814,
        "usd": 34144
      },
      "converted_volume": {
        "btc": 234.865,
        "eth": 3768,
        "usd": 8007951
      },
      "trust_score": "green",
      "bid_ask_spread_percentage": 0.070312,
      "timestamp": "2021-07-25T15:44:48+00:00",
      "last_traded_at": "2021-07-25T15:44:48+00:00",
      "last_fetch_at": "2021-07-25T15:44:48+00:00",
      "is_anomaly": false,
      "is_stale": false,
      "trade_url": "https://www.binance.com/en/trade/BTC_GBP?ref=37754157",
      "token_info_url": null,
      "coin_id": "bitcoin"
    },
    {
      "base": "BTC",
      "target": "BRL",
      "market": {
        "name": "Binance",
        "identifier": "binance",
        "has_trading_incentive": false,
        "logo": "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250"
      },
      "last": 178234,
      "volume": 214.91330194020222,
      "cost_to_move_up_usd": 779386.9122498191,
      "cost_to_move_down_usd": 210704.5574903567,
      "converted_last": {
        "btc": 0.99968637,
        "eth": 15.99202,
        "usd": 34250
      },
      "converted_volume": {
        "btc": 214.846,
        "eth": 3437,
        "usd": 7360849
      },
      "trust_score": "green",
      "bid_ask_spread_percentage": 0.037026,
      "timestamp": "2021-07-25T15:53:38+00:00",
      "last_traded_at": "2021-07-25T15:53:38+00:00",
      "last_fetch_at": "2021-07-25T15:53:38+00:00",
      "is_anomaly": false,
      "is_stale": false,
      "trade_url": "https://www.binance.com/en/trade/BTC_BRL?ref=37754157",
      "token_info_url": null,
      "coin_id": "bitcoin"
    },
    {
      "base": "BTC",
      "target": "DAI",
      "market": {
        "name": "Binance",
        "identifier": "binance",
        "has_trading_incentive": false,
        "logo": "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250"
      },
      "last": 34189.47,
      "volume": 59.93842390439512,
      "cost_to_move_up_usd": 811835.388904792,
      "cost_to_move_down_usd": 155265.403057692,
      "converted_last": {
        "btc": 1.002257,
        "eth": 16.079642,
        "usd": 34189
      },
      "converted_volume": {
        "btc": 60.074,
        "eth": 963.788,
        "usd": 2049258
      },
      "trust_score": "green",
      "bid_ask_spread_percentage": 0.046706,
      "timestamp": "2021-07-25T15:45:59+00:00",
      "last_traded_at": "2021-07-25T15:45:59+00:00",
      "last_fetch_at": "2021-07-25T15:45:59+00:00",
      "is_anomaly": false,
      "is_stale": false,
      "trade_url": "https://www.binance.com/en/trade/BTC_DAI?ref=37754157",
      "token_info_url": null,
      "coin_id": "bitcoin",
      "target_coin_id": "dai"
    },
    {
      "base": "BTC",
      "target": "RUB",
      "market": {
        "name": "Binance",
        "identifier": "binance",
        "has_trading_incentive": false,
        "logo": "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250"
      },
      "last": 2524156,
      "volume": 56.36813661189721,
      "cost_to_move_up_usd": 600235.9067489931,
      "cost_to_move_down_usd": 172685.4239328831,
      "converted_last": {
        "btc": 1.002235,
        "eth": 16.086989,
        "usd": 34171
      },
      "converted_volume": {
        "btc": 56.494,
        "eth": 906.794,
        "usd": 1926160
      },
      "trust_score": "green",
      "bid_ask_spread_percentage": 0.083282,
      "timestamp": "2021-07-25T15:41:39+00:00",
      "last_traded_at": "2021-07-25T15:41:39+00:00",
      "last_fetch_at": "2021-07-25T15:41:39+00:00",
      "is_anomaly": false,
      "is_stale": false,
      "trade_url": "https://www.binance.com/en/trade/BTC_RUB?ref=37754157",
      "token_info_url": null,
      "coin_id": "bitcoin"
    },
    {
      "base": "BTC",
      "target": "AUD",
      "market": {
        "name": "Binance",
        "identifier": "binance",
        "has_trading_incentive": false,
        "logo": "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250"
      },
      "last": 46382.71,
      "volume": 152.41013711364988,
      "cost_to_move_up_usd": 401086.98122304847,
      "cost_to_move_down_usd": 355399.144791225,
      "converted_last": {
        "btc": 1.002027,
        "eth": 16.083123,
        "usd": 34154
      },
      "converted_volume": {
        "btc": 152.719,
        "eth": 2451,
        "usd": 5205436
      },
      "trust_score": "green",
      "bid_ask_spread_percentage": 0.126674,
      "timestamp": "2021-07-25T15:38:19+00:00",
      "last_traded_at": "2021-07-25T15:38:19+00:00",
      "last_fetch_at": "2021-07-25T15:38:19+00:00",
      "is_anomaly": false,
      "is_stale": false,
      "trade_url": "https://www.binance.com/en/trade/BTC_AUD?ref=37754157",
      "token_info_url": null,
      "coin_id": "bitcoin"
    },
    {
      "base": "BTC",
      "target": "BIDR",
      "market": {
        "name": "Binance",
        "identifier": "binance",
        "has_trading_incentive": false,
        "logo": "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250"
      },
      "last": 495243362,
      "volume": 39.22384556502143,
      "cost_to_move_up_usd": 340471.024922665,
      "cost_to_move_down_usd": 172497.502508533,
      "converted_last": {
        "btc": 1.001235,
        "eth": 16.073414,
        "usd": 34121
      },
      "converted_volume": {
        "btc": 39.272304,
        "eth": 630.461,
        "usd": 1338366
      },
      "trust_score": "green",
      "bid_ask_spread_percentage": 0.115498,
      "timestamp": "2021-07-25T15:35:50+00:00",
      "last_traded_at": "2021-07-25T15:35:50+00:00",
      "last_fetch_at": "2021-07-25T15:35:50+00:00",
      "is_anomaly": false,
      "is_stale": false,
      "trade_url": "https://www.binance.com/en/trade/BTC_BIDR?ref=37754157",
      "token_info_url": null,
      "coin_id": "bitcoin",
      "target_coin_id": "binanceidr"
    },
    {
      "base": "BTC",
      "target": "UAH",
      "market": {
        "name": "Binance",
        "identifier": "binance",
        "has_trading_incentive": false,
        "logo": "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250"
      },
      "last": 936311,
      "volume": 4.528536192559951,
      "cost_to_move_up_usd": 304994.0593397189,
      "cost_to_move_down_usd": 58794.54252352863,
      "converted_last": {
        "btc": 1.01527,
        "eth": 16.272159,
        "usd": 34646
      },
      "converted_volume": {
        "btc": 4.597687,
        "eth": 73.689,
        "usd": 156896
      },
      "trust_score": "green",
      "bid_ask_spread_percentage": 0.169177,
      "timestamp": "2021-07-25T15:47:02+00:00",
      "last_traded_at": "2021-07-25T15:47:02+00:00",
      "last_fetch_at": "2021-07-25T15:47:02+00:00",
      "is_anomaly": false,
      "is_stale": false,
      "trade_url": "https://www.binance.com/en/trade/BTC_UAH?ref=37754157",
      "token_info_url": null,
      "coin_id": "bitcoin"
    },
    {
      "base": "BTC",
      "target": "TUSD",
      "market": {
        "name": "Binance",
        "identifier": "binance",
        "has_trading_incentive": false,
        "logo": "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250"
      },
      "last": 34206.12,
      "volume": 43.458606798668484,
      "cost_to_move_up_usd": 171891.885850579,
      "cost_to_move_down_usd": 140645.023154321,
      "converted_last": {
        "btc": 1.00233,
        "eth": 16.080817,
        "usd": 34192
      },
      "converted_volume": {
        "btc": 43.559863,
        "eth": 698.85,
        "usd": 1485932
      },
      "trust_score": "green",
      "bid_ask_spread_percentage": 0.05093,
      "timestamp": "2021-07-25T15:45:27+00:00",
      "last_traded_at": "2021-07-25T15:45:27+00:00",
      "last_fetch_at": "2021-07-25T15:45:27+00:00",
      "is_anomaly": false,
      "is_stale": false,
      "trade_url": "https://www.binance.com/en/trade/BTC_TUSD?ref=37754157",
      "token_info_url": null,
      "coin_id": "bitcoin",
      "target_coin_id": "true-usd"
    },
    {
      "base": "BTC",
      "target": "PAX",
      "market": {
        "name": "Binance",
        "identifier": "binance",
        "has_trading_incentive": false,
        "logo": "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250"
      },
      "last": 34149.62,
      "volume": 91.34960563452594,
      "cost_to_move_up_usd": 125477.463054148,
      "cost_to_move_down_usd": 161676.558055354,
      "converted_last": {
        "btc": 1.003999,
        "eth": 16.115333,
        "usd": 34216
      },
      "converted_volume": {
        "btc": 91.715,
        "eth": 1472,
        "usd": 3125632
      },
      "trust_score": "green",
      "bid_ask_spread_percentage": 0.040909,
      "timestamp": "2021-07-25T15:36:01+00:00",
      "last_traded_at": "2021-07-25T15:36:01+00:00",
      "last_fetch_at": "2021-07-25T15:36:01+00:00",
      "is_anomaly": false,
      "is_stale": false,
      "trade_url": "https://www.binance.com/en/trade/BTC_PAX?ref=37754157",
      "token_info_url": null,
      "coin_id": "bitcoin",
      "target_coin_id": "paxos-standard"
    },
    {
      "base": "BTC",
      "target": "IDRT",
      "market": {
        "name": "Binance",
        "identifier": "binance",
        "has_trading_incentive": false,
        "logo": "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250"
      },
      "last": 492774313,
      "volume": 0.7505373671131271,
      "cost_to_move_up_usd": 51814.1447121999,
      "cost_to_move_down_usd": 20974.1325708508,
      "converted_last": {
        "btc": 1.00405,
        "eth": 16.116124,
        "usd": 34233
      },
      "converted_volume": {
        "btc": 0.75357676,
        "eth": 12.095753,
        "usd": 25693
      },
      "trust_score": "green",
      "bid_ask_spread_percentage": 0.294492,
      "timestamp": "2021-07-25T15:41:40+00:00",
      "last_traded_at": "2021-07-25T15:41:40+00:00",
      "last_fetch_at": "2021-07-25T15:41:40+00:00",
      "is_anomaly": false,
      "is_stale": false,
      "trade_url": "https://www.binance.com/en/trade/BTC_IDRT?ref=37754157",
      "token_info_url": null,
      "coin_id": "bitcoin",
      "target_coin_id": "rupiah-token"
    },
    {
      "base": "BTC",
      "target": "VAI",
      "market": {
        "name": "Binance",
        "identifier": "binance",
        "has_trading_incentive": false,
        "logo": "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250"
      },
      "last": 38767.85,
      "volume": 0.9018062204468393,
      "cost_to_move_up_usd": 10602.2508554272,
      "cost_to_move_down_usd": 15622.5428129152,
      "converted_last": {
        "btc": 0.99665026,
        "eth": 15.996311,
        "usd": 34011
      },
      "converted_volume": {
        "btc": 0.8987854,
        "eth": 14.425572,
        "usd": 30671
      },
      "trust_score": "green",
      "bid_ask_spread_percentage": 1.029216,
      "timestamp": "2021-07-25T15:28:05+00:00",
      "last_traded_at": "2021-07-25T15:28:05+00:00",
      "last_fetch_at": "2021-07-25T15:36:33+00:00",
      "is_anomaly": false,
      "is_stale": false,
      "trade_url": "https://www.binance.com/en/trade/BTC_VAI?ref=37754157",
      "token_info_url": null,
      "coin_id": "bitcoin",
      "target_coin_id": "vai"
    },
    {
      "base": "BTC",
      "target": "NGN",
      "market": {
        "name": "Binance",
        "identifier": "binance",
        "has_trading_incentive": false,
        "logo": "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250"
      },
      "last": 17761590,
      "volume": 7.681567987775025,
      "cost_to_move_up_usd": 27221.72696681515,
      "cost_to_move_down_usd": 24897.496852067816,
      "converted_last": {
        "btc": 1.266803,
        "eth": 20.333356,
        "usd": 43191
      },
      "converted_volume": {
        "btc": 9.731034,
        "eth": 156.192,
        "usd": 331778
      },
      "trust_score": null,
      "bid_ask_spread_percentage": 0.452376,
      "timestamp": "2021-07-25T15:42:05+00:00",
      "last_traded_at": "2021-07-25T15:42:05+00:00",
      "last_fetch_at": "2021-07-25T15:42:05+00:00",
      "is_anomaly": true,
      "is_stale": false,
      "trade_url": "https://www.binance.com/en/trade/BTC_NGN?ref=37754157",
      "token_info_url": null,
      "coin_id": "bitcoin"
    }
  ]
}
  '''));
