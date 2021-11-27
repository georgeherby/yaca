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
    on<AssetFavourited>(_onAssetFavourited);
    on<AssetOverviewLoad>(_onAssetOverviewLoad);

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

  void _onAssetOverviewLoad(
    AssetOverviewLoad event,
    Emitter<AssetOverviewState> emit,
  ) async {
    emit(AssetOverviewLoading());
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
      emit(AssetOverviewLoaded(_marketCoins));
    } catch (e, stacktrace) {
      print('Error $e');
      print('Error $stacktrace');
      print(stacktrace);
      emit(AssetOverviewError(e.toString()));
    }
  }

  void _onAssetFavourited(
    AssetFavourited event,
    Emitter<AssetOverviewState> emit,
  ) async {
    var listOfAssets = [...event.allMarketCoins];

    var index =
        listOfAssets.indexWhere((item) => item.id == event.marketCoin.id);

    if (index > -1) {
      if (event.addToFavourite) {
        debugPrint('isChecked');
        var idForRecord = await _favouriteDao.insertFavourite(Favourites(
            name: event.marketCoin.name, symbol: event.marketCoin.symbol));

        print('Inserted id $idForRecord');

        final updatedAssets = listOfAssets.map((e) {
          if (e.id == event.marketCoin.id) {
            return e.copyWith(favouriteCacheId: idForRecord);
          } else {
            return e;
          }
        });

        emit(AssetOverviewLoaded(updatedAssets.toList()));
      } else {
        debugPrint('isNotChecked');
        if (listOfAssets[index].favouriteCacheId != null) {
          debugPrint('Remove from sql ${listOfAssets[index].favouriteCacheId}');
          await _favouriteDao.delete(listOfAssets[index].favouriteCacheId!);
        }

        final updatedAssets = listOfAssets.map((e) {
          if (e.id == event.marketCoin.id) {
            return e.copyWith(favouriteCacheId: null);
          } else {
            return e;
          }
        });
        emit(AssetOverviewLoaded(updatedAssets.toList()));
      }
    }
  }
}
