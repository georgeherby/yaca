part of 'asset_overview_bloc.dart';

abstract class AssetOverviewEvent extends Equatable {
  const AssetOverviewEvent();

  @override
  List<Object> get props => [];
}

class AssetOverviewLoad extends AssetOverviewEvent {
  const AssetOverviewLoad();

  @override
  List<Object> get props => [];
}

class AssetFavourited extends AssetOverviewEvent {
  final List<MarketCoin> allMarketCoins;
  final MarketCoin marketCoin;
  final bool isChecked;
  const AssetFavourited(this.allMarketCoins, this.marketCoin, this.isChecked);

  @override
  List<Object> get props => [allMarketCoins, marketCoin, isChecked];
}
