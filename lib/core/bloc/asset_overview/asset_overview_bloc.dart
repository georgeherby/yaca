// 🎯 Dart imports:
import 'dart:async';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// 🌎 Project imports:
import 'package:yaca/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:yaca/core/models/api/coingecko/market_coins.dart';
import 'package:yaca/core/models/favourites.dart';
import 'package:yaca/core/models/settings/chosen_currency.dart';
import 'package:yaca/core/models/sort_type.dart';
import 'package:yaca/core/repositories/api/coingecko/market_overview_repository.dart';
import 'package:yaca/core/repositories/favourites_repository.dart';

part 'asset_overview_event.dart';
part 'asset_overview_state.dart';

class AssetOverviewBloc extends Bloc<AssetOverviewEvent, AssetOverviewState> {
  late StreamSubscription subscription;

  final AppSettingsBloc settingsBloc;
  final FavouritesDao _favouriteDao;
  final MarketOverviewRepository _marketOverviewRepository;

  AssetOverviewBloc(
      this.settingsBloc, this._favouriteDao, this._marketOverviewRepository)
      : super(const AssetOverviewInitial()) {
    on<AssetFavourited>(_onAssetFavourited);
    on<AssetOverviewLoad>(_onAssetOverviewLoad);
    on<AssetSorted>(_onAssetSort);

    subscription = settingsBloc.stream.listen((stateOfSettings) {
      if (stateOfSettings is AppSettingsLoaded) {
        debugPrint('Initial load');
        add(AssetOverviewLoad(stateOfSettings.currency, SortType.sortByRank,
            SortOrder.ascending)); //Todo Make this pull from SharedPrefs
      }
    });
  }

  @override
  void onEvent(AssetOverviewEvent event) {
    if (event is AssetFavourited) {
      debugPrint(
          'addToFavourite  = ${event.marketCoin.name} to ${event.addToFavourite}');
    }
    super.onEvent(event);
  }

  @override
  void onTransition(
      Transition<AssetOverviewEvent, AssetOverviewState> transition) {
    debugPrint(transition.toString());
    super.onTransition(transition);
  }

  void _onAssetOverviewLoad(
    AssetOverviewLoad event,
    Emitter<AssetOverviewState> emit,
  ) async {
    emit(const AssetOverviewLoading());
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

      final sorted = _sortBy(_marketCoins, event.sortType, event.sortOrder);

      emit(AssetOverviewLoaded(sorted));
    } catch (e, stacktrace) {
      debugPrint('Error $e');
      debugPrint('Error $stacktrace');
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

        debugPrint('Inserted id $idForRecord');

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

  void _onAssetSort(
    AssetSorted event,
    Emitter<AssetOverviewState> emit,
  ) {
    debugPrint("Sort type ${event.sortType}, Sort order ${event.sortOrder}");
    emit(const AssetOverviewLoading());
    final sortedList =
        _sortBy(event.allMarketCoins, event.sortType, event.sortOrder);
    emit(AssetOverviewLoaded(sortedList));
  }

  List<MarketCoin> _sortBy(
      List<MarketCoin> allMarketCoins, SortType sortType, SortOrder sortOrder) {
    switch (sortType) {
      case SortType.sortByRank:
        return _sortByRank(allMarketCoins, sortOrder);
      case SortType.sortBy24hPercentageChange:
        return _sortByPercentageChange(allMarketCoins, sortOrder);
    }
  }

  List<MarketCoin> _sortByRank(
      List<MarketCoin> allMarketCoins, SortOrder sortOrder) {
    return allMarketCoins
      ..sort((a, b) {
        final first = a.marketCapRank;
        final second = b.marketCapRank;

        switch (sortOrder) {
          case SortOrder.ascending:
            return first.compareTo(second);
          case SortOrder.descending:
            return second.compareTo(first);
        }
      });
  }

  List<MarketCoin> _sortByPercentageChange(
      List<MarketCoin> allMarketCoins, SortOrder sortOrder) {
    return allMarketCoins
      ..sort((a, b) {
        final first = a.priceChangePercentage24h ?? 0.0;
        final second = b.priceChangePercentage24h ?? 0.0;

        switch (sortOrder) {
          case SortOrder.ascending:
            return first.compareTo(second);
          case SortOrder.descending:
            return second.compareTo(first);
        }
      });
  }
}
