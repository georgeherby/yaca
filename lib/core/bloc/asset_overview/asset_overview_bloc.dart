import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_app/old/api/coingecko/market_overview_api.dart';
import 'package:crypto_app/old/data/dao/favourites_dao.dart';
import 'package:crypto_app/old/data/models/favourites.dart';
import 'package:crypto_app/old/models/api/coingecko/market_coins.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'asset_overview_event.dart';
part 'asset_overview_state.dart';

class AssetOverviewBloc extends Bloc<AssetOverviewEvent, AssetOverviewState> {
  final FavouritesDao _favouriteDao;
  final MarketOverviewRepository _marketOverviewRepository;

  AssetOverviewBloc(this._favouriteDao, this._marketOverviewRepository)
      : super(AssetOverviewInitial());

  @override
  Stream<AssetOverviewState> mapEventToState(
    AssetOverviewEvent event,
  ) async* {
    if (event is AssetOverviewLoad) {
      yield AssetOverviewLoading();
      try {
        var _marketCoins = <MarketCoin>[];

        var usersFavourites = await _favouriteDao.getAll();
        var marketCoinsResponse =
            (await _marketOverviewRepository.fetchCoinMarkets());
        _marketCoins.addAll(marketCoinsResponse.map((coinData) {
          var favs = (usersFavourites.where((Favourites fav) =>
              fav.name.toLowerCase() == coinData.name.toLowerCase() &&
              fav.symbol.toLowerCase() == coinData.symbol.toLowerCase()));

          if (favs.isNotEmpty) {
            coinData.favouriteCacheId = favs.first.id;
          }
          return coinData;
        }));
        yield AssetOverviewLoaded(_marketCoins);
      } catch (e) {
        yield AssetOverviewError(e.toString());
      }
    } else if (event is AssetFavourited) {
      var index = event.allMarketCoins
          .indexWhere((item) => item.id == event.marketCoin.id);


      if (index > -1) {
        yield AssetOverviewLoading();
        if (event.isChecked) {
          debugPrint('isChecked');
          var idForRecord = await _favouriteDao.insertIgnore(Favourites(
              name: event.marketCoin.name, symbol: event.marketCoin.symbol));
          event.allMarketCoins[index].favouriteCacheId = idForRecord;
        } else {
          debugPrint('isNotChecked');
          if (event.allMarketCoins[index].favouriteCacheId != null) {
            debugPrint('Remove from sql');

            await _favouriteDao
                .delete(event.allMarketCoins[index].favouriteCacheId!);
          }
          event.allMarketCoins[index].favouriteCacheId = null;
        }

        yield AssetOverviewLoaded(event.allMarketCoins);
      } else {
        print('Not in list rather worrying');
      }
    }
  }
}
