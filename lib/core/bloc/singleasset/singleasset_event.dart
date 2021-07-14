part of 'singleasset_bloc.dart';

abstract class SingleAssetEvent extends Equatable {
  const SingleAssetEvent();
}

class SingleAssetLoad extends SingleAssetEvent {
  final String currencyCode;
  final String marketCoinId;

  const SingleAssetLoad(
      {required this.currencyCode, required this.marketCoinId});

  @override
  List<Object> get props => [currencyCode, marketCoinId];
}
