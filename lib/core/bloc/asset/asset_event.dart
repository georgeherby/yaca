part of 'asset_bloc.dart';

abstract class AssetEvent extends Equatable {
  const AssetEvent();
}

class AssetLoad extends AssetEvent {
  final ChosenCurrency currencyCode;
  final String marketCoinId;

  const AssetLoad(
      {required this.currencyCode, required this.marketCoinId});

  @override
  List<Object> get props => [currencyCode, marketCoinId];
}
