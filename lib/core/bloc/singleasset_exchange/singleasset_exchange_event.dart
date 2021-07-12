part of 'singleasset_exchange_bloc.dart';

abstract class SingleAssetExchangeEvent extends Equatable {
  const SingleAssetExchangeEvent();

  @override
  List<Object> get props => [];
}

class SingleAssetExchangeLoad extends SingleAssetExchangeEvent {
  final String marketCoinId;

  const SingleAssetExchangeLoad({required this.marketCoinId});

  @override
  List<Object> get props => [marketCoinId];
}
