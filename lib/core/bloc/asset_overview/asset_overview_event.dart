part of 'asset_overview_bloc.dart';

abstract class AssetOverviewEvent extends Equatable {
  const AssetOverviewEvent();
}

class AssetOverviewLoad extends AssetOverviewEvent {
  final ChosenCurrency currency;
  final SortType sortType;
  final SortOrder sortOrder;
  const AssetOverviewLoad(this.currency, this.sortType, this.sortOrder);

  @override
  List<Object> get props => [currency, sortType, sortOrder];
}

class AssetFavourited extends AssetOverviewEvent {
  final List<MarketCoin> allMarketCoins;
  final MarketCoin marketCoin;
  final bool addToFavourite;
  const AssetFavourited(
      this.allMarketCoins, this.marketCoin, this.addToFavourite);

  @override
  List<Object> get props => [allMarketCoins, marketCoin, addToFavourite];
}

class AssetSorted extends AssetOverviewEvent {
  final List<MarketCoin> allMarketCoins;
  final SortType sortType;
  final SortOrder sortOrder;

  const AssetSorted(this.allMarketCoins, this.sortType, this.sortOrder);

  @override
  List<Object> get props => [allMarketCoins, sortType, sortOrder];
}
