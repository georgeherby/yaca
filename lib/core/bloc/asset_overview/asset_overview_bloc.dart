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
import 'package:yaca/core/repositories/preferences/asset_overview_preference.dart';

part 'asset_overview_event.dart';
part 'asset_overview_state.dart';

class AssetOverviewBloc extends Bloc<AssetOverviewEvent, AssetOverviewState> {
  late StreamSubscription subscription;

  final AppSettingsBloc settingsBloc;
  final FavouritesDao _favouriteDao;
  final MarketOverviewRepository _marketOverviewRepository;
  final AssetOverviewPreference _assetOverviewPreference;

  AssetOverviewBloc(this.settingsBloc, this._favouriteDao,
      this._marketOverviewRepository, this._assetOverviewPreference)
      : super(const AssetOverviewInitial()) {
    on<AssetFavourited>(_onAssetFavourited);
    on<AssetOverviewLoad>(_onAssetOverviewLoad);
    on<AssetSorted>(_onAssetSort);

    subscription = settingsBloc.stream.listen((stateOfSettings) {
      if (stateOfSettings is AppSettingsLoaded) {
        debugPrint('Initial load');
        add(const AssetOverviewLoad());
      }
    });
  }

  @override
  void onEvent(AssetOverviewEvent event) {
    if (event is AssetFavourited) {
      debugPrint('addToFavourite  = ${event.name} to ${event.addToFavourite}');
    }
    super.onEvent(event);
  }

  @override
  void onTransition(
      Transition<AssetOverviewEvent, AssetOverviewState> transition) {
    debugPrint(transition.toString());
    super.onTransition(transition);
  }

  Future _onAssetOverviewLoad(
    AssetOverviewLoad event,
    Emitter<AssetOverviewState> emit,
  ) async {
    emit(const AssetOverviewLoading());
    try {
      var _marketCoins = <MarketCoin>[];

      var marketCoinsResponse = (await _marketOverviewRepository
          .fetchCoinMarkets(settingsBloc.state.currency));

      List<MarketCoin> favouriteAssets =
          await _favourites(settingsBloc.state.currency);
          
      _marketCoins.addAll(marketCoinsResponse.map((coinData) {
        var favs = (favouriteAssets.where((MarketCoin fav) =>
            fav.name.toLowerCase() == coinData.name.toLowerCase() &&
            fav.symbol.toLowerCase() == coinData.symbol.toLowerCase()));

        if (favs.isNotEmpty) {
          return coinData.copyWith(favouriteCacheId: favs.first.favouriteCacheId);
        }
        return coinData;
      }));

      final sortType = await _assetOverviewPreference.getSortType();
      final sortOrder = await _assetOverviewPreference.getSortOrder();
      final sorted = _sortBy(_marketCoins, sortType, sortOrder);

 
      final sortedFavourites = _sortBy(favouriteAssets, sortType, sortOrder);

      emit(AssetOverviewLoaded(sorted, sortedFavourites, sortType, sortOrder));
    } on TimeoutException catch (_) {
      emit(const AssetOverviewTimeout());
    } catch (e, stacktrace) {
      debugPrint('Error $e');
      debugPrint('Error $stacktrace');
      emit(AssetOverviewError(e.toString()));
    }
  }

  Future _onAssetFavourited(
    AssetFavourited event,
    Emitter<AssetOverviewState> emit,
  ) async {
    var listOfAssets = [...event.allMarketCoins];

    if (event.addToFavourite) {
      debugPrint('addToFavourite');
      var idForRecord = await _favouriteDao.insertFavourite(Favourites(
          name: event.name, coinId: event.coinId, symbol: event.symbol));

      debugPrint('Inserted id $idForRecord');

      final updatedAssets = listOfAssets.map((e) {
        if (e.id == event.coinId) {
          return e.copyWith(favouriteCacheId: idForRecord);
        } else {
          return e;
        }
      });
      final sortType = await _assetOverviewPreference.getSortType();
      final sortOrder = await _assetOverviewPreference.getSortOrder();
      final sortedAll = _sortBy(updatedAssets.toList(), sortType, sortOrder);

      List<MarketCoin> favouriteAssets =
          await _favourites(settingsBloc.state.currency);

      final sortedFavourites = _sortBy(favouriteAssets, sortType, sortOrder);

      emit(AssetOverviewLoaded(
          sortedAll, sortedFavourites, sortType, sortOrder));
    } else {
      debugPrint('!addToFavourite');

      var allAssetsindex =
          listOfAssets.indexWhere((item) => item.id == event.coinId);

      if (allAssetsindex != -1) {
        if (listOfAssets[allAssetsindex].favouriteCacheId != null) {
          debugPrint(
              'Remove from sql ${listOfAssets[allAssetsindex].favouriteCacheId}');
          await _favouriteDao
              .delete(listOfAssets[allAssetsindex].favouriteCacheId!);
        }
      } else {
        var favourites = event.favourites;
        var favouritesIndex =
            event.favourites.indexWhere((item) => item.id == event.coinId);
        if (favouritesIndex != -1) {
          if (favourites[favouritesIndex].favouriteCacheId != null) {
            debugPrint(
                'Remove from sql ${favourites[favouritesIndex].favouriteCacheId}');
            await _favouriteDao
                .delete(favourites[favouritesIndex].favouriteCacheId!);
          }
        }
      }

      final updatedAssets = listOfAssets.map((e) {
        if (e.id == event.coinId) {
          return e.copyWith(favouriteCacheId: null);
        } else {
          return e;
        }
      });
      final sortType = await _assetOverviewPreference.getSortType();
      final sortOrder = await _assetOverviewPreference.getSortOrder();
      final sorted = _sortBy(updatedAssets.toList(), sortType, sortOrder);
      List<MarketCoin> favouriteAssets =
          await _favourites(settingsBloc.state.currency);

      final sortedFavourites = _sortBy(favouriteAssets, sortType, sortOrder);

      emit(AssetOverviewLoaded(sorted, sortedFavourites, sortType, sortOrder));
    }
  }

  Future _onAssetSort(
    AssetSorted event,
    Emitter<AssetOverviewState> emit,
  ) async {
    debugPrint("Sort type ${event.sortType}, Sort order ${event.sortOrder}");
    final sortedList =
        _sortBy(event.allMarketCoins, event.sortType, event.sortOrder);
    await _assetOverviewPreference.setSortOrder(event.sortOrder);
    await _assetOverviewPreference.setSortType(event.sortType);

    List<MarketCoin> favouriteAssets =
        await _favourites(settingsBloc.state.currency);

    final sortedFavourites =
        _sortBy(favouriteAssets, event.sortType, event.sortOrder);

    emit(AssetOverviewLoaded(
        sortedList, sortedFavourites, event.sortType, event.sortOrder));
  }

  Future<List<MarketCoin>> _favourites(ChosenCurrency currency) async {
    List<Favourites> favourites = await _favouriteDao.getAll();
    List<String> favouriteIds = favourites.map((e) => e.coinId).toList();
    String? ids = favouriteIds.isEmpty ? null : favouriteIds.join(',');
    List<MarketCoin> listOfFavourites = await _marketOverviewRepository
        .fetchCoinMarkets(currency, specficCoinIds: ids);

    return listOfFavourites.map((coinData) {
      var favs = (favourites.where((Favourites fav) =>
          fav.name.toLowerCase() == coinData.name.toLowerCase() &&
          fav.symbol.toLowerCase() == coinData.symbol.toLowerCase()));

      if (favs.isNotEmpty) {
        return coinData.copyWith(favouriteCacheId: favs.first.id);
      }
      return coinData;
    }).toList();
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
      ..sort(
        (a, b) {
          final first = a.marketCapRank;
          final second = b.marketCapRank;

          switch (sortOrder) {
            case SortOrder.ascending:
              return first.compareTo(second);
            case SortOrder.descending:
              return second.compareTo(first);
          }
        },
      );
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
