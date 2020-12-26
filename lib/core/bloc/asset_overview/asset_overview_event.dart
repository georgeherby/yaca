part of 'asset_overview_bloc.dart';

abstract class AssetOverviewEvent extends Equatable {
  const AssetOverviewEvent();

  @override
  List<Object> get props => [];
}

class AssetOverviewLoad extends AssetOverviewEvent {
  final String currency;
  const AssetOverviewLoad(this.currency);

  @override
  List<Object> get props => [currency];
}

class AssetFavourited extends AssetOverviewEvent {
  final List<MarketCoin> allMarketCoins;
  final MarketCoin marketCoin;
  final bool isChecked;
  const AssetFavourited(this.allMarketCoins, this.marketCoin, this.isChecked);

  @override
  List<Object> get props => [allMarketCoins, marketCoin, isChecked];
}
