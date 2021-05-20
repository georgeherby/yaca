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
  final List<MarketCoin> _assets;

  const AssetOverviewLoaded(this._assets);

  List<MarketCoin> get favouriteAssets =>
      _assets.where((element) => element.isFavourited).toList();

  List<MarketCoin> get allAssets => _assets;

  @override
  List<Object> get props => [_assets];
}

class AssetOverviewError extends AssetOverviewState {
  final String error;

  const AssetOverviewError(this.error);

  @override
  List<Object> get props => [error];
}
