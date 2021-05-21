part of 'asset_overview_bloc.dart';

abstract class AssetOverviewState extends Equatable {
  const AssetOverviewState();

  @override
  List<Object> get props => [];
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
  final List<MarketCoin> allAssets;

  const AssetOverviewLoaded(this.allAssets);

  List<MarketCoin> get favouriteAssets =>
      allAssets.where((element) => element.isFavourited).toList();

  @override
  List<Object> get props => [allAssets, favouriteAssets];
}

class AssetOverviewError extends AssetOverviewState {
  final String error;

  const AssetOverviewError(this.error);

  @override
  List<Object> get props => [error];
}
