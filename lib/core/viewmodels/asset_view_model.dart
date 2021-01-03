import 'package:crypto_app/old/api/coinmarketcap/assets_overview_api.dart';
import 'package:crypto_app/old/api/coinmarketcap/market_overview_api.dart';
import 'package:crypto_app/old/data/dao/favourites_dao.dart';
import 'package:crypto_app/old/data/models/favourites.dart';
import 'package:crypto_app/old/models/asset_overview.dart';
import 'package:crypto_app/old/models/market_overview.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AssetViewModel extends ChangeNotifier {
  List<AssetData> _assets = <AssetData>[];
  GlobalMarketOverview? _marketOverview;
  bool _hasGlobalMarketOverviewLoaded = true;
  bool _hasAssetsOverviewLoaded = true;
  FavouritesDao _favouriteDao = FavouritesDao();
  AssetViewModel() {
    fetchAssets();
  }

  http.Client _client = http.Client();

  void fetchAssets() async {
    _hasGlobalMarketOverviewLoaded = false;
    _hasAssetsOverviewLoaded = false;
    notifyListeners();

    debugPrint("Clear");
    _assets.clear();
    debugPrint("Adding");

    fetchMarketOverview(_client).then((GlobalMarketOverview value) {
      _marketOverview = value;
      _hasGlobalMarketOverviewLoaded = true;
      notifyListeners();
    });
    List<Favourites> usersFavourites = await _favouriteDao.getAll();
    usersFavourites.forEach((element) {
      print(element.toMap());
    });
    List<AssetData> asset = (await fetchAssetsOverview(_client)).data;

    _assets.addAll(asset.map((assetData) {
      Iterable<Favourites> favs = (usersFavourites.where((Favourites fav) =>
          fav.name.toLowerCase() == assetData.name.toLowerCase() &&
          fav.symbol.toLowerCase() == assetData.symbol.toLowerCase()));

      if (favs.isNotEmpty) {
        debugPrint("Cached fav found for ${assetData.name}");
        assetData.favouriteCacheId = favs.first.id;
      }
      return assetData;
    }));
    debugPrint("Added");
    _hasAssetsOverviewLoaded = true;
    notifyListeners();
  }

  List<AssetData> get assetList {
    return _assets;
  }

  GlobalMarketOverview? get marketOverview {
    return _marketOverview;
  }

  List<AssetData> get favourites {
    return _assets.where((element) => element.isFavourited).toList();
  }

  bool get hasGlobalLoaded {
    return _hasGlobalMarketOverviewLoaded;
  }

  bool get hasAssetsLoaded {
    return _hasAssetsOverviewLoaded;
  }

  void setFavourite(AssetData asset, bool isChecked) async {
    AssetData a = _assets.firstWhere((item) => item.id == asset.id);

    if (isChecked) {
      int idForRecord =
          await _favouriteDao.insertIgnore(Favourites(name: asset.name, symbol: asset.symbol));
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
