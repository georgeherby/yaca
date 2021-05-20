import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_app/old/api/coingecko/market_overview_api.dart';
import 'package:crypto_app/old/data/dao/favourites_dao.dart';
import 'package:crypto_app/old/data/models/favourites.dart';
import 'package:crypto_app/old/models/api/coingecko/market_coins.dart';
import 'package:equatable/equatable.dart';

part 'asset_overview_event.dart';
part 'asset_overview_state.dart';

class AssetOverviewBloc extends Bloc<AssetOverviewEvent, AssetOverviewState> {
  final FavouritesDao favouriteDao;
  final MarketOverviewRepository marketOverviewRepository;

  AssetOverviewBloc(this.favouriteDao, this.marketOverviewRepository)
      : super(AssetOverviewInitial());

  @override
  Stream<AssetOverviewState> mapEventToState(
    AssetOverviewEvent event,
  ) async* {
    if (event is AssetOverviewLoad) {
      yield AssetOverviewLoading();
      try {
        var _marketCoins = <MarketCoin>[];

        var usersFavourites = await favouriteDao.getAll();
        var marketCoinsResponse =
            (await marketOverviewRepository.fetchCoinMarkets());
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
    }
  }
}
