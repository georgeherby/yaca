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
    lastUpdated: '123456789',
    priceChangePercentage24h: 1.0);

var ethMarketCoin = const MarketCoin(
    id: 'eth',
    symbol: 'eth',
    name: 'Ethereum',
    image: 'url',
    currentPrice: 9999.99,
    marketCap: 9878675,
    marketCapRank: 2,
    lastUpdated: '123456788',
    priceChangePercentage24h: 2.0);

var bnbMarketCoin = const MarketCoin(
    id: 'bnb',
    symbol: 'bnb',
    name: 'Binance Coin',
    image: 'url',
    currentPrice: 123999.99,
    marketCap: 1234512341,
    marketCapRank: 3,
    lastUpdated: '123456788',
    priceChangePercentage24h: -1.0);

var btcFavouriteWithID =
    const Favourites(id: 12, name: 'bitcoin', symbol: 'btc');
var ethFavouriteNoId = const Favourites(name: 'Ethereum', symbol: 'eth');
