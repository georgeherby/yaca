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
  final MarketCoin marketCoin;
  final bool addToFavourite;
  const AssetFavourited(this.allMarketCoins, this.marketCoin, this.addToFavourite);

  @override
  List<Object> get props => [allMarketCoins, marketCoin, addToFavourite];
}
