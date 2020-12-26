import 'package:crypto_app/old/api/assets_api.dart';
import 'package:crypto_app/old/data/dao/favourites_dao.dart';
import 'package:crypto_app/old/data/models/favourites.dart';
import 'package:crypto_app/old/models/assets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AssetViewModel extends ChangeNotifier {
  List<Asset> _assets = <Asset>[];
  bool _hasLoaded = true;
  FavouritesDao _favouriteDao = FavouritesDao();
  AssetViewModel() {
    fetchAssets();
  }

  void fetchAssets() async {
    _hasLoaded = false;
    notifyListeners();

    //Is Loading?
    debugPrint("Clear");
    _assets.clear();
    debugPrint("Adding");

    List<Favourites> usersFavourites = await _favouriteDao.getAll();
    usersFavourites.forEach((element) {
      print(element.toMap());
    });
    List<Asset> assetData = (await fetchAssetsList(http.Client())).data;

    _assets.addAll(assetData.map((assetData) {
      debugPrint("Checking ${assetData.name}  ${assetData.symbol}");
      Iterable<Favourites> favs = (usersFavourites.where((Favourites fav) =>
          fav.name.toLowerCase() == assetData.name.toLowerCase() &&
          fav.symbol.toLowerCase() == assetData.symbol.toLowerCase()));

      if (favs.isNotEmpty) {
        debugPrint("Cached fav found for ${assetData.name}");
        assetData.favouriteCacheId = favs.first.id;
      }
      return assetData;
    }));
    _hasLoaded = true;
    debugPrint("Added");
    notifyListeners();
  }

  List<Asset> get assetList {
    return _assets;
  }

  List<Asset> get favourites {
    return _assets.where((element) => element.isFavourited).toList();
  }

  bool get hasLoaded {
    return _hasLoaded;
  }

  void setFavourite(Asset asset, bool isChecked) async {
    Asset a = _assets.firstWhere((item) => item.id == asset.id);

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
