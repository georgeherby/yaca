part of 'singleasset_bloc.dart';

abstract class SingleAssetState extends Equatable {
  const SingleAssetState();

  @override
  List<Object> get props => [];
}

class SingleAssetInitial extends SingleAssetState {
  @override
  List<Object> get props => [];
}

class SingleAssetLoading extends SingleAssetState {
  const SingleAssetLoading();

  @override
  List<Object> get props => [];
}

class SingleAssetLoaded extends SingleAssetState {
  final AssetHistorySplits assetHistorySplits;
  final SingleAssetData singleAsset;

  const SingleAssetLoaded(this.singleAsset, this.assetHistorySplits);

  @override
  List<Object> get props => [singleAsset, assetHistorySplits];
}

class SingleAssetError extends SingleAssetState {
  final String error;

  const SingleAssetError(this.error);

  @override
  List<Object> get props => [error];
}
