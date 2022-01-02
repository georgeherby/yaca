part of 'asset_overview_bloc.dart';

abstract class AssetOverviewEvent extends Equatable {
  const AssetOverviewEvent();
}

class AssetOverviewLoad extends AssetOverviewEvent {
  final ChosenCurrency currency;
  const AssetOverviewLoad(this.currency);

  @override
  List<Object> get props => [currency];
}

class AssetFavourited extends AssetOverviewEvent {
  final List<MarketCoin> allMarketCoins;
  final String symbol;
  final String name;
  final String id;
  final bool addToFavourite;
  const AssetFavourited(
      {required this.allMarketCoins,
      required this.symbol,
      required this.name,
      required this.id,
      required this.addToFavourite});

  @override
  List<Object> get props => [allMarketCoins, symbol, name, id, addToFavourite];
}

class AssetSorted extends AssetOverviewEvent {
  final List<MarketCoin> allMarketCoins;
  final SortType sortType;
  final SortOrder sortOrder;

  const AssetSorted(this.allMarketCoins, this.sortType, this.sortOrder);

  @override
  List<Object> get props => [allMarketCoins, sortType, sortOrder];
}
