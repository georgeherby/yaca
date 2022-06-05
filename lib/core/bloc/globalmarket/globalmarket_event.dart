part of 'globalmarket_bloc.dart';

abstract class GlobalMarketEvent extends Equatable {
  const GlobalMarketEvent();
}

class GlobalMarketLoad extends GlobalMarketEvent {

  const GlobalMarketLoad(this.currency);
  final ChosenCurrency currency;

  @override
  List<Object> get props => [currency];
}
