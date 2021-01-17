import 'package:crypto_app/old/api/coingecko/global_stats.dart';
import 'package:crypto_app/old/api/coingecko/market_overview_api.dart';
import 'package:crypto_app/old/data/dao/favourites_dao.dart';
import 'package:crypto_app/old/data/models/favourites.dart';
import 'package:crypto_app/old/models/api/coingecko/global_market.dart';
import 'package:crypto_app/old/models/api/coingecko/market_coins.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AssetViewModel extends ChangeNotifier {
  List<MarketCoin> _marketCoins = <MarketCoin>[];
  GlobalMarket? _globalMarket;
  bool _hasGlobalMarketOverviewLoaded = true;
  bool _hasAssetsOverviewLoaded = true;
  FavouritesDao _favouriteDao = FavouritesDao();
  AssetViewModel() {
    // fetchAssets(currencyCode);
  }

  http.Client _client = http.Client();

  void fetchAssets(String currencyCode) async {
    _hasGlobalMarketOverviewLoaded = false;
    _hasAssetsOverviewLoaded = false;
    notifyListeners();

    debugPrint("Clear");
    _marketCoins.clear();
    debugPrint("Adding");

    fetchMarketOverview(_client, currencyCode).then((GlobalMarket value) {
      _globalMarket = value;
      _hasGlobalMarketOverviewLoaded = true;
      notifyListeners();
    });
    List<Favourites> usersFavourites = await _favouriteDao.getAll();
    usersFavourites.forEach((element) {
      print(element.toMap());
    });
    List<MarketCoin> marketCoinsResponse = (await fetchCoinMarkets(_client));

    _marketCoins.addAll(marketCoinsResponse.map((coinData) {
      Iterable<Favourites> favs = (usersFavourites.where((Favourites fav) =>
          fav.name.toLowerCase() == coinData.name.toLowerCase() &&
          fav.symbol.toLowerCase() == coinData.symbol.toLowerCase()));

      if (favs.isNotEmpty) {
        debugPrint("Cached fav found for ${coinData.name}");
        coinData.favouriteCacheId = favs.first.id;
      }
      return coinData;
    }));
    debugPrint("Added");
    _hasAssetsOverviewLoaded = true;
    notifyListeners();
  }

  List<MarketCoin> get assetList {
    return _marketCoins;
  }

  GlobalMarket? get marketOverview {
    return _globalMarket;
  }

  List<MarketCoin> get favourites {
    return _marketCoins.where((element) => element.isFavourited).toList();
  }

  bool get hasGlobalLoaded {
    return _hasGlobalMarketOverviewLoaded;
  }

  bool get hasAssetsLoaded {
    return _hasAssetsOverviewLoaded;
  }

  void setFavourite(MarketCoin mc, bool isChecked) async {
    MarketCoin a = _marketCoins.firstWhere((item) => item.id == mc.id);

    if (isChecked) {
      int idForRecord =
          await _favouriteDao.insertIgnore(Favourites(name: mc.name, symbol: mc.symbol));
      a.favouriteCacheId = idForRecord;
    } else {
      if (a.favouriteCacheId != null) {
        await _favouriteDao.delete(a.favouriteCacheId!);
      }
      a.favouriteCacheId = null;
    }
    notifyListeners();
  }
}
