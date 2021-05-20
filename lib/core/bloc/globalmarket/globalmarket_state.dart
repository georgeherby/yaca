part of 'globalmarket_bloc.dart';

abstract class GlobalMarketState extends Equatable {
  const GlobalMarketState();

  @override
  List<Object> get props => [];
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
  final GlobalMarket globalMarket;

  const GlobalMarketLoaded(this.globalMarket);

  @override
  List<Object> get props => [globalMarket];
}

class GlobalMarketError extends GlobalMarketState {
  final String error;

  const GlobalMarketError(this.error);

  @override
  List<Object> get props => [error];
}
