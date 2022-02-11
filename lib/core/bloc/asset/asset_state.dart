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
  final Coin coin;
  final AssetHistorySplits assetHistorySplits;

  const AssetLoaded(this.coin, this.assetHistorySplits);

  @override
  List<Object> get props => [coin, assetHistorySplits];
}

class AssetError extends AssetState {
  final String error;

  const AssetError(this.error);

  @override
  List<Object> get props => [error];
}
