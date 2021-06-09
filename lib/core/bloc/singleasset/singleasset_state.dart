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
  final List<ExchangeTicker> exchangeTickers;

  const SingleAssetLoaded(this.assetHistory, this.exchangeTickers);

  @override
  List<Object> get props => [assetHistory, exchangeTickers];
}

class SingleAssetError extends SingleAssetState {
  final String error;

  const SingleAssetError(this.error);

  @override
  List<Object> get props => [error];
}
