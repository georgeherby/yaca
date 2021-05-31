// 🎯 Dart imports:
import 'dart:async';

//  Package imports:
import 'package:bloc/bloc.dart';
// 🌎 Project imports:
import 'package:crypto_app/core/models/favourites.dart';
import 'package:crypto_app/core/repositories/api/coingecko/market_overview_api.dart';
import 'package:crypto_app/core/repositories/favouritess_repository.dart';
import 'package:crypto_app/old/models/api/coingecko/market_coins.dart';
import 'package:equatable/equatable.dart';
// 🐦 Flutter imports:
import 'package:flutter/material.dart';

part 'asset_overview_event.dart';
part 'asset_overview_state.dart';

class AssetOverviewBloc extends Bloc<AssetOverviewEvent, AssetOverviewState> {
  final FavouritesDao _favouriteDao;
  final MarketOverviewRepository _marketOverviewRepository;

  AssetOverviewBloc(this._favouriteDao, this._marketOverviewRepository)
      : super(AssetOverviewInitial());

  @override
  void onEvent(AssetOverviewEvent event) {
    if (event is AssetFavourited) {
      print('isFaved  = ${event.marketCoin.name} to ${event.isChecked}');
    }
    super.onEvent(event);
  }

  @override
  void onTransition(
      Transition<AssetOverviewEvent, AssetOverviewState> transition) {
    print(transition);
    super.onTransition(transition);
  }

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
            return coinData.copyWith(favouriteCacheId: favs.first.id);
          }
          return coinData;
        }));
        yield AssetOverviewLoaded(_marketCoins);
      } catch (e) {
        yield AssetOverviewError(e.toString());
      }
    } else if (event is AssetFavourited) {
      final currentState = state;

      if (currentState is AssetOverviewLoaded) {
        var listOfAssets = [...event.allMarketCoins];

        var index =
            listOfAssets.indexWhere((item) => item.id == event.marketCoin.id);

        if (index > -1) {
          if (event.isChecked) {
            debugPrint('isChecked');
            var idForRecord = await _favouriteDao.insertIgnore(Favourites(
                name: event.marketCoin.name, symbol: event.marketCoin.symbol));

            final updatedAssets = listOfAssets.map((e) {
              if (e.id == event.marketCoin.id) {
                return e.copyWith(favouriteCacheId: idForRecord);
              } else {
                return e;
              }
            });

            yield AssetOverviewLoaded(updatedAssets.toList());
          } else {
            debugPrint('isNotChecked');
            if (listOfAssets[index].favouriteCacheId != null) {
              debugPrint('Remove from sql');
              await _favouriteDao.delete(listOfAssets[index].favouriteCacheId!);
            }

            final updatedAssets = listOfAssets.map((e) {
              if (e.id == event.marketCoin.id) {
                return e.copyWith(favouriteCacheId: null);
              } else {
                return e;
              }
            });
            yield AssetOverviewLoaded(updatedAssets.toList());
          }
        } else {
          debugPrint('Not in list rather worrying');
        }
      }
    }
  }
}
