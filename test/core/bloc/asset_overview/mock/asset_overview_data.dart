// 🌎 Project imports:
import 'package:crypto_app/core/models/api/coingecko/market_coins.dart';
import 'package:crypto_app/core/models/favourites.dart';

var btcMarketCoin = MarketCoin(
    id: 'bitcion',
    symbol: 'btc',
    name: 'Bitcoin',
    image: 'url',
    currentPrice: 12345.12,
    marketCap: 123456789,
    marketCapRank: 1,
    lastUpdated: '123456789');

var ethMarketCoin = MarketCoin(
    id: 'eth',
    symbol: 'eth',
    name: 'Ethereum',
    image: 'url',
    currentPrice: 9999.99,
    marketCap: 9878675,
    marketCapRank: 2,
    lastUpdated: '123456788');


var btcFavouriteWithID = Favourites(id: 12, name: 'bitcoin', symbol: 'btc');
var ethFavouriteNoId = Favourites(name: 'Ethereum', symbol: 'eth');
