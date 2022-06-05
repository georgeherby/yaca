part of 'singleasset_exchange_bloc.dart';

abstract class SingleAssetExchangeEvent extends Equatable {
  const SingleAssetExchangeEvent();
}

class SingleAssetExchangeLoad extends SingleAssetExchangeEvent {

  const SingleAssetExchangeLoad({required this.marketCoinId});
  final String marketCoinId;

  @override
  List<Object> get props => [marketCoinId];
}
