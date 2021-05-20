import 'package:crypto_app/old/data/dao/favourites_dao.dart';
import 'package:crypto_app/old/data/models/favourites.dart';
import 'package:crypto_app/old/models/api/coingecko/market_coins.dart';
import 'package:flutter/material.dart';

class AssetViewModel extends ChangeNotifier {
  final List<MarketCoin> _marketCoins = <MarketCoin>[];
  // GlobalMarket? _globalMarket;
  // bool _hasGlobalMarketOverviewLoaded = true;
  // final bool _hasAssetsOverviewLoaded = true;
  final FavouritesDao _favouriteDao = FavouritesDao();
  AssetViewModel() {
    // fetchAssets(currencyCode);
  }

  // http.Client _client = http.Client();

  // void fetchAssets(String currencyCode) async {
  //   debugPrint("fetchAssets called for currency $currencyCode");

  //   _hasAssetsOverviewLoaded = false;
  //   notifyListeners();

  //   debugPrint("Clear");
  //   _marketCoins.clear();
  //   debugPrint("Adding");

  //   // fetchMarketOverview(_client).then((GlobalMarket value) {
  //   //   _globalMarket = value;
  //   //   _hasGlobalMarketOverviewLoaded = true;
  //   //   notifyListeners();
  //   // });
  //   List<Favourites> usersFavourites = await _favouriteDao.getAll();
  //   usersFavourites.forEach((element) {
  //     print(element.toMap());
  //   });
  //   List<MarketCoin> marketCoinsResponse =
  //       (await fetchCoinMarkets(_client, currencyCode));

  //   _marketCoins.addAll(marketCoinsResponse.map((coinData) {
  //     Iterable<Favourites> favs = (usersFavourites.where((Favourites fav) =>
  //         fav.name.toLowerCase() == coinData.name.toLowerCase() &&
  //         fav.symbol.toLowerCase() == coinData.symbol.toLowerCase()));

  //     if (favs.isNotEmpty) {
  //       // debugPrint("Cached fav found for ${coinData.name}");
  //       coinData.favouriteCacheId = favs.first.id;
  //     }
  //     return coinData;
  //   }));
  //   debugPrint("Added");
  //   _hasAssetsOverviewLoaded = true;
  //   notifyListeners();
  // }

  // AssetsList get assetList {
  //   return AssetsList(assets: _marketCoins);
  // }

  // // GlobalMarket? get marketOverview {
  // //   return _globalMarket;
  // // }

  // AssetsList get favourites {
  //   List<MarketCoin> favs =
  //       _marketCoins.where((element) => element.isFavourited).toList();
  //   return AssetsList(assets: favs);
  // }

  // // bool get hasGlobalLoaded {
  // //   return _hasGlobalMarketOverviewLoaded;
  // // }

  // bool get hasAssetsLoaded {
  //   return _hasAssetsOverviewLoaded;
  // }

  void setFavourite(MarketCoin mc, bool isChecked) async {
    var a = _marketCoins.firstWhere((item) => item.id == mc.id);

    if (isChecked) {
      var idForRecord = await _favouriteDao
          .insertIgnore(Favourites(name: mc.name, symbol: mc.symbol));
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
