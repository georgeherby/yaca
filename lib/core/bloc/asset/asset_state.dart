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
  final AssetHistorySplits assetHistorySplits;
  final SingleAssetData singleAsset;

  const AssetLoaded(this.singleAsset, this.assetHistorySplits);

  @override
  List<Object> get props => [singleAsset, assetHistorySplits];
}

class AssetError extends AssetState {
  final String error;

  const AssetError(this.error);

  @override
  List<Object> get props => [error];
}
