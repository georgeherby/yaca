// 🎯 Dart imports:
import 'dart:async';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// 🌎 Project imports:
import 'package:crypto_app/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:crypto_app/core/models/api/coingecko/market_coins.dart';
import 'package:crypto_app/core/models/favourites.dart';
import 'package:crypto_app/core/models/settings/chosen_currency.dart';
import 'package:crypto_app/core/repositories/api/coingecko/market_overview_repository.dart';
import 'package:crypto_app/core/repositories/favourites_repository.dart';

//  Package imports:

//  Package imports:

part 'asset_overview_event.dart';
part 'asset_overview_state.dart';

class AssetOverviewBloc extends Bloc<AssetOverviewEvent, AssetOverviewState> {
  late StreamSubscription subscription;

  final AppSettingsBloc settingsBloc;
  final FavouritesDao _favouriteDao;
  final MarketOverviewRepository _marketOverviewRepository;

  AssetOverviewBloc(
      this.settingsBloc, this._favouriteDao, this._marketOverviewRepository)
      : super(AssetOverviewInitial()) {
    subscription = settingsBloc.stream.listen((stateOfSettings) {
      if (stateOfSettings is AppSettingsLoaded) {
        print('Initial load');
        add(AssetOverviewLoad(stateOfSettings.currency));
      }
    });
  }

  @override
  void onEvent(AssetOverviewEvent event) {
    if (event is AssetFavourited) {
      print(
          'addToFavourite  = ${event.marketCoin.name} to ${event.addToFavourite}');
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

        var marketCoinsResponse =
            (await _marketOverviewRepository.fetchCoinMarkets(event.currency));

        var usersFavourites = await _favouriteDao.getAll();

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
        print(e);
        yield AssetOverviewError(e.toString());
      }
    } else if (event is AssetFavourited) {

      // if (currentState is AssetOverviewLoaded) {
      var listOfAssets = [...event.allMarketCoins];

      var index =
          listOfAssets.indexWhere((item) => item.id == event.marketCoin.id);

      if (index > -1) {
        if (event.addToFavourite) {
          debugPrint('isChecked');
          var idForRecord = await _favouriteDao.insertFavourite(Favourites(
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
      }
    }
  }
}
