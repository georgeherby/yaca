part of 'asset_bloc.dart';

abstract class AssetEvent extends Equatable {
  const AssetEvent();
}

class AssetLoad extends AssetEvent {

  const AssetLoad(
      {required this.currencyCode, required this.marketCoinId});
  final ChosenCurrency currencyCode;
  final String marketCoinId;

  @override
  List<Object> get props => [currencyCode, marketCoinId];
}
