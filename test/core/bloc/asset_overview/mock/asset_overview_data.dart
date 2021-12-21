// 🌎 Project imports:
import 'package:yaca/core/models/api/coingecko/market_coins.dart';
import 'package:yaca/core/models/favourites.dart';

var btcMarketCoin = const MarketCoin(
    id: 'bitcion',
    symbol: 'btc',
    name: 'Bitcoin',
    image: 'url',
    currentPrice: 12345.12,
    marketCap: 123456789,
    marketCapRank: 1,
    lastUpdated: '123456789');

var ethMarketCoin = const MarketCoin(
    id: 'eth',
    symbol: 'eth',
    name: 'Ethereum',
    image: 'url',
    currentPrice: 9999.99,
    marketCap: 9878675,
    marketCapRank: 2,
    lastUpdated: '123456788');

var btcFavouriteWithID =
    const Favourites(id: 12, name: 'bitcoin', symbol: 'btc');
var ethFavouriteNoId = const Favourites(name: 'Ethereum', symbol: 'eth');
