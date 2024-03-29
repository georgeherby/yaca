part of 'globalmarket_bloc.dart';

abstract class GlobalMarketEvent extends Equatable {
  const GlobalMarketEvent();
}

class GlobalMarketLoad extends GlobalMarketEvent {
  final ChosenCurrency currency;

  const GlobalMarketLoad(this.currency);

  @override
  List<Object> get props => [currency];
}
