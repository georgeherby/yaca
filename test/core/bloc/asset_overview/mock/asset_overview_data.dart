// 🎯 Dart imports:
import 'dart:convert';

// 📦 Package imports:
import 'package:coingecko_api/data/market.dart';

// 🌎 Project imports:
import 'package:yaca/core/models/favourites.dart';

var btcMarketCoin = Market.fromJson(json.decode('''{
    "id": "bitcoin",
    "symbol": "btc",
    "name": "Bitcoin",
    "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
    "current_price": 32719,
    "market_cap": 617883319157,
    "market_cap_rank": 1,
    "fully_diluted_valuation": 684636629389,
    "total_volume": 21355344970,
    "high_24h": 33515,
    "low_24h": 31664,
    "price_change_24h": 158.89,
    "price_change_percentage_24h": 0.488,
    "market_cap_change_24h": -188022574.38806152,
    "market_cap_change_percentage_24h": -0.03042,
    "circulating_supply": 18952462,
    "total_supply": 21000000,
    "max_supply": 21000000,
    "ath": 51032,
    "ath_change_percentage": -36.48582,
    "ath_date": "2021-11-10T14:24:11.849Z",
    "atl": 43.9,
    "atl_change_percentage": 73729.04064,
    "atl_date": "2013-07-05T00:00:00.000Z",
    "roi": null,
    "last_updated": "2022-02-08T20:58:11.493Z",
    "sparkline_in_7d": {
      "price": [
        38943.572365198306,
        38589.78859590186
      ]
    },
    "price_change_percentage_1h_in_currency": 2.784916880625378,
    "price_change_percentage_24h_in_currency": 0.48799977704933944,
    "price_change_percentage_7d_in_currency": 14.105313934001021
  }'''));

var ethMarketCoin = Market.fromJson(json.decode('''
  {
    "id": "ethereum",
    "symbol": "eth",
    "name": "Ethereum",
    "image": "https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880",
    "current_price": 2304.48,
    "market_cap": 275332693319,
    "market_cap_rank": 2,
    "fully_diluted_valuation": null,
    "total_volume": 12222997532,
    "high_24h": 2382.33,
    "low_24h": 2247.66,
    "price_change_24h": -27.367218794186,
    "price_change_percentage_24h": -1.17363,
    "market_cap_change_24h": -3225493636.427124,
    "market_cap_change_percentage_24h": -1.15792,
    "circulating_supply": 119500080.3115,
    "total_supply": null,
    "max_supply": null,
    "ath": 3610.11,
    "ath_change_percentage": -36.17819,
    "ath_date": "2021-11-12T02:17:36.494Z",
    "atl": 0.280314,
    "atl_change_percentage": 821848.14934,
    "atl_date": "2015-10-20T00:00:00.000Z",
    "roi": {
      "times": 93.22378734130479,
      "currency": "btc",
      "percentage": 9322.378734130478
    },
    "last_updated": "2022-02-08T21:01:36.383Z",
    "sparkline_in_7d": {
      "price": [
        2788.4163730535997,
        2770.918400816381,
        2764.062475867259,
        2784.6713402052774,
        2787.308425494528
      ]
    },
    "price_change_percentage_1h_in_currency": 2.000967913312353,
    "price_change_percentage_24h_in_currency": -1.1736305610305673,
    "price_change_percentage_7d_in_currency": 15.2361448707508
  }
'''));

var bnbMarketCoin = Market.fromJson(json.decode('''
  {
    "id": "binancecoin",
    "symbol": "bnb",
    "name": "Binance Coin",
    "image": "https://assets.coingecko.com/coins/images/825/large/binance-coin-logo.png?1547034615",
    "current_price": 305.91,
    "market_cap": 51434820953,
    "market_cap_rank": 4,
    "fully_diluted_valuation": 51434820953,
    "total_volume": 1283993570,
    "high_24h": 328.71,
    "low_24h": 301.76,
    "price_change_24h": -15.816957943094,
    "price_change_percentage_24h": -4.91631,
    "market_cap_change_24h": -2745780069.1072693,
    "market_cap_change_percentage_24h": -5.06783,
    "circulating_supply": 168137035.9,
    "total_supply": 168137035.9,
    "max_supply": 168137035.9,
    "ath": 497.18,
    "ath_change_percentage": -38.47086,
    "ath_date": "2021-11-07T10:13:53.906Z",
    "atl": 0.03027451,
    "atl_change_percentage": 1010354.40557,
    "atl_date": "2017-10-19T00:00:00.000Z",
    "roi": null,
    "last_updated": "2022-02-08T21:01:42.690Z",
    "sparkline_in_7d": {
      "price": [
        386.11239419089236,
        385.0174841493423,
        383.9420586361675,
        385.4336289079841
      ]
    },
    "price_change_percentage_1h_in_currency": 1.252066635210935,
    "price_change_percentage_24h_in_currency": -4.916310387082272,
    "price_change_percentage_7d_in_currency": 9.246870262724698
  }
'''));

var btcFavouriteWithID =
    const Favourites(id: 12, name: 'bitcoin', coinId: 'bitcoin', symbol: 'btc');
var ethFavouriteNoId =
    const Favourites(name: 'Ethereum', coinId: 'ethereum', symbol: 'eth');
var ethFavouriteWithId = const Favourites(
    id: 13, name: 'Ethereum', coinId: 'ethereum', symbol: 'eth');
