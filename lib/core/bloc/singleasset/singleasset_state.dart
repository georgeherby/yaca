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
  final AssetHistorySplits assetHistory;

  const SingleAssetLoaded(this.assetHistory);

  @override
  List<Object> get props => [assetHistory];
}

class SingleAssetError extends SingleAssetState {
  final String error;

  const SingleAssetError(this.error);

  @override
  List<Object> get props => [error];
}
