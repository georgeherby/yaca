part of 'single_asset_exchange_bloc.dart';

abstract class SingleAssetExchangeState extends Equatable {
  const SingleAssetExchangeState();
}

class SingleAssetExchangeInitial extends SingleAssetExchangeState {
  @override
  List<Object> get props => [];
}

class SingleAssetExchangeLoading extends SingleAssetExchangeState {
  const SingleAssetExchangeLoading();

  @override
  List<Object> get props => [];
}

class SingleAssetExchangeLoaded extends SingleAssetExchangeState {
  const SingleAssetExchangeLoaded(this.exchangeTickers);
  final List<Ticker> exchangeTickers;

  @override
  List<Object> get props => [exchangeTickers];
}

class SingleAssetExchangeError extends SingleAssetExchangeState {
  const SingleAssetExchangeError(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}
