part of 'global_market_bloc.dart';

abstract class GlobalMarketState extends Equatable {
  const GlobalMarketState();
}

class GlobalMarketInitial extends GlobalMarketState {
  const GlobalMarketInitial();

  @override
  List<Object> get props => [];
}

class GlobalMarketLoading extends GlobalMarketState {
  const GlobalMarketLoading();

  @override
  List<Object> get props => [];
}

class GlobalMarketLoaded extends GlobalMarketState {
  const GlobalMarketLoaded(this.globalMarket);
  final GlobalCoinData globalMarket;

  @override
  List<Object> get props => [globalMarket];
}

class GlobalMarketError extends GlobalMarketState {
  const GlobalMarketError(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}
