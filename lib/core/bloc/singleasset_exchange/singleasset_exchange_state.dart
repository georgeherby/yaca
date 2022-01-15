part of 'singleasset_exchange_bloc.dart';

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
  final List<Tickers> exchangeTickers;

  const SingleAssetExchangeLoaded(this.exchangeTickers);

  @override
  List<Object> get props => [exchangeTickers];
}

class SingleAssetExchangeError extends SingleAssetExchangeState {
  final String error;

  const SingleAssetExchangeError(this.error);

  @override
  List<Object> get props => [error];
}
