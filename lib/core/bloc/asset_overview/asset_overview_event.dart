part of 'asset_overview_bloc.dart';

abstract class AssetOverviewEvent extends Equatable {
  const AssetOverviewEvent();
}

class AssetOverviewLoad extends AssetOverviewEvent {
  const AssetOverviewLoad();

  @override
  List<Object> get props => [];
}

class AssetFavourited extends AssetOverviewEvent {
  const AssetFavourited(
      {required this.allMarketCoins,
      required this.favourites,
      required this.symbol,
      required this.name,
      required this.coinId,
      required this.addToFavourite});
  final List<MarketCoin> allMarketCoins;
  final List<MarketCoin> favourites;
  final String symbol;
  final String name;
  final String coinId;
  final bool addToFavourite;

  @override
  List<Object> get props =>
      [allMarketCoins, favourites, symbol, name, coinId, addToFavourite];
}

class AssetSorted extends AssetOverviewEvent {

  const AssetSorted(this.allMarketCoins, this.sortType, this.sortOrder);
  final List<MarketCoin> allMarketCoins;
  final SortType sortType;
  final SortOrder sortOrder;

  @override
  List<Object> get props => [allMarketCoins, sortType, sortOrder];
}
