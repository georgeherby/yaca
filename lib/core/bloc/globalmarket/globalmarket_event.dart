part of 'globalmarket_bloc.dart';

abstract class GlobalMarketEvent extends Equatable {
  const GlobalMarketEvent();

  @override
  List<Object> get props => [];
}

class GlobalMarketLoad extends GlobalMarketEvent {
  const GlobalMarketLoad();

  @override
  List<Object> get props => [];
}
