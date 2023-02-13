part of 'asset_bloc.dart';

abstract class AssetState extends Equatable {
  const AssetState();
}

class AssetInitial extends AssetState {
  @override
  List<Object> get props => [];
}

class AssetLoading extends AssetState {
  const AssetLoading();

  @override
  List<Object> get props => [];
}

class AssetLoaded extends AssetState {
  const AssetLoaded(this.coin, this.assetHistorySplits);
  final Coin coin;
  final AssetHistorySplits assetHistorySplits;

  @override
  List<Object> get props => [coin, assetHistorySplits];
}

class AssetError extends AssetState {
  const AssetError(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}
