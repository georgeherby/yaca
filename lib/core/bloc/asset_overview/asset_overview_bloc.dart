// 🎯 Dart imports:
import 'dart:async';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:coingecko_api/data/market.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import 'package:yaca/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:yaca/core/extensions/string.dart';
import 'package:yaca/core/models/api/market_coins.dart';
import 'package:yaca/core/models/favourites.dart';
import 'package:yaca/core/models/settings/chosen_currency.dart';
import 'package:yaca/core/models/sort_type.dart';
import 'package:yaca/core/repositories/api/coingecko/market_overview_repository.dart';
import 'package:yaca/core/repositories/favourites_repository.dart';
import 'package:yaca/core/repositories/preferences/asset_overview_preference.dart';

// � Package imports:

part 'asset_overview_event.dart';
part 'asset_overview_state.dart';

class AssetOverviewBloc extends Bloc<AssetOverviewEvent, AssetOverviewState> {
  late StreamSubscription subscription;

  final AppSettingsBloc _settingsBloc;
  final FavouritesDao _favouriteDao;
  final MarketOverviewRepository _marketOverviewRepository;
  final AssetOverviewPreference _assetOverviewPreference;

  AssetOverviewBloc(this._settingsBloc, this._favouriteDao,
      this._marketOverviewRepository, this._assetOverviewPreference)
      : super(const AssetOverviewInitial()) {
    on<AssetFavourited>(_onAssetFavourited);
    on<AssetOverviewLoad>(_onAssetOverviewLoad);
    on<AssetSorted>(_onAssetSort);

    subscription = _settingsBloc.stream.listen((stateOfSettings) {
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
      var marketCoins = <MarketCoin>[];

      var marketCoinsResponse = (await _marketOverviewRepository
          .fetchCoinMarkets(_settingsBloc.state.currency));

      List<MarketCoin> favouriteAssets =
          await _favourites(marketCoinsResponse.map((e) => MarketCoin(market: e)).toList(), _settingsBloc.state.currency);

      marketCoins.addAll(marketCoinsResponse.map((coinData) {
        var favs = (favouriteAssets.where((MarketCoin fav) =>
            fav.market.name.equalsIgnoreCase(coinData.name) &&
            fav.market.symbol.equalsIgnoreCase(coinData.symbol)));

        if (favs.isNotEmpty) {
          return MarketCoin(
              market: coinData, favouriteCacheId: favs.first.favouriteCacheId);
        }
        return MarketCoin(market: coinData);
      }));

      final sortType = await _assetOverviewPreference.getSortType();
      final sortOrder = await _assetOverviewPreference.getSortOrder();
      final sorted = _sortBy(marketCoins, sortType, sortOrder);

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
        if (e.market.id == event.coinId) {
          return e.copyWith(favouriteCacheId: idForRecord);
        } else {
          return e;
        }
      });
      final sortType = await _assetOverviewPreference.getSortType();
      final sortOrder = await _assetOverviewPreference.getSortOrder();
      final sortedAll = _sortBy(updatedAssets.toList(), sortType, sortOrder);

      List<MarketCoin> favouriteAssets =
          await _favourites(event.allMarketCoins, _settingsBloc.state.currency);

      final sortedFavourites = _sortBy(favouriteAssets, sortType, sortOrder);

      emit(AssetOverviewLoaded(
          sortedAll, sortedFavourites, sortType, sortOrder));
    } else {
      debugPrint('!addToFavourite');

      var allAssetsindex =
          listOfAssets.indexWhere((item) => item.market.id == event.coinId);

      if (allAssetsindex != -1) {
        if (listOfAssets[allAssetsindex].favouriteCacheId != null) {
          debugPrint(
              'Remove from sql ${listOfAssets[allAssetsindex].favouriteCacheId}');
          await _favouriteDao
              .delete(listOfAssets[allAssetsindex].favouriteCacheId!);
        }
      } else {
        var favourites = event.favourites;
        var favouritesIndex = event.favourites
            .indexWhere((item) => item.market.id == event.coinId);
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
        if (e.market.id == event.coinId) {
          return e.copyWith(favouriteCacheId: null);
        } else {
          return e;
        }
      });
      final sortType = await _assetOverviewPreference.getSortType();
      final sortOrder = await _assetOverviewPreference.getSortOrder();
      final sorted = _sortBy(updatedAssets.toList(), sortType, sortOrder);
      List<MarketCoin> favouriteAssets =
          await _favourites(event.allMarketCoins, _settingsBloc.state.currency);

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
        await _favourites(event.allMarketCoins, _settingsBloc.state.currency);

    final sortedFavourites =
        _sortBy(favouriteAssets, event.sortType, event.sortOrder);

    emit(AssetOverviewLoaded(
        sortedList, sortedFavourites, event.sortType, event.sortOrder));
  }

  Future<List<MarketCoin>> _favourites(
      List<MarketCoin> allAssetList, ChosenCurrency currency) async {
    List<Favourites> favourites = await _favouriteDao.getAll();
    List<String> favouriteIds = favourites.map((e) => e.coinId).toList();
    List<String> ids = favouriteIds.isEmpty ? [] : favouriteIds;

    Iterable<String> allAssetIds = allAssetList.map((e) => e.market.id);

    // Check so network call is only made if a favourited item is not in allAssetList
    bool areThereExtraCoinsToFetch = favourites
        .where((element) => !allAssetIds.contains(element.coinId))
        .isNotEmpty;

    List<Market> listOfFavourites = (areThereExtraCoinsToFetch
        ? (await _marketOverviewRepository.fetchCoinMarkets(currency,
            specficCoinIds: ids))
        : allAssetList
            .where((element) => favouriteIds.contains(element.market.id))
            .map((e) => e.market)
            .toList());

    return listOfFavourites.map((coinData) {
      var favs = (favourites.where((Favourites fav) =>
          fav.name.equalsIgnoreCase(coinData.name) &&
          fav.symbol.equalsIgnoreCase(coinData.symbol)));

      if (favs.isNotEmpty) {
        return MarketCoin(market: coinData, favouriteCacheId: favs.first.id);
      }
      return MarketCoin(market: coinData);
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
          final first = a.market.marketCapRank!;
          final second = b.market.marketCapRank!;

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
        final first = a.market.priceChangePercentage24h ?? 0.0;
        final second = b.market.priceChangePercentage24h ?? 0.0;

        switch (sortOrder) {
          case SortOrder.ascending:
            return first.compareTo(second);
          case SortOrder.descending:
            return second.compareTo(first);
        }
      });
  }
}
