part of 'asset_overview_bloc.dart';

abstract class AssetOverviewState extends Equatable {
  const AssetOverviewState();
}

class AssetOverviewInitial extends AssetOverviewState {
  const AssetOverviewInitial();

  @override
  List<Object> get props => [];
}

class AssetOverviewLoading extends AssetOverviewState {
  const AssetOverviewLoading();

  @override
  List<Object> get props => [];
}

class AssetOverviewLoaded extends AssetOverviewState {
  const AssetOverviewLoaded(this.allAssets, this.favourites, this.sortType, this.sortOrder);
  final List<MarketCoin> allAssets;
  final List<MarketCoin> favourites;
  final SortType sortType;
  final SortOrder sortOrder;

  @override
  List<Object> get props =>
      [allAssets, favourites, sortType.toString(), sortOrder.toString()];
}

class AssetOverviewError extends AssetOverviewState {

  const AssetOverviewError(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}

class AssetOverviewTimeout extends AssetOverviewState {
  const AssetOverviewTimeout();

  @override
  List<Object> get props => [];
}
